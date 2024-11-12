import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/user.model.dart';
import 'models/user_info.model.dart';
import 'controllers/auth.controller.dart';
import 'services/firebase.options.dart';
import 'views/login.view.dart';
import 'views/clothing_list.view.dart';
import 'views/profile.view.dart';
import 'views/clothing_detail.view.dart';
import 'views/cart.view.dart';
import 'controllers/clothing.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()), // Ajout de AuthController
        StreamProvider<UserModel?>.value(
          value: AuthController().userStream,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => ClothingController()), // Ajout de ClothingController
      ],
      child: MaterialApp(
        title: 'Clothed',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthWrapper(),
        routes: {
          '/login': (context) => LoginPage(),
          '/profile': (context) => ProfileView(),
          '/cart': (context) => CartView(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user != null) {
      return ClothingListView(); // Si l'utilisateur est connecté, afficher la liste des vêtements
    } else {
      return LoginPage(); // Sinon, afficher la page de connexion
    }
  }
}