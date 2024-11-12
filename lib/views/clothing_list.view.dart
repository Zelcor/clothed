import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/clothing.model.dart';
import '../controllers/clothing.controller.dart';
import 'clothing_detail.view.dart';
import 'cart.view.dart';

class ClothingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acheter'),
      ),
      body: Consumer<ClothingController>(
        builder: (context, clothingController, child) {
          return ListView.builder(
            itemCount: clothingController.clothings.length,
            itemBuilder: (context, index) {
              final clothing = clothingController.clothings[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(clothing.imageUrl),
                ),
                title: Text(clothing.title),
                subtitle: Text('Taille: ${clothing.size} - Prix: ${clothing.price}€'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ClothingDetailView(clothing: clothing),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0, // La page actuelle est "Acheter"
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartView(),
              ),
            );
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/profile');
          }
          // Gérer la navigation entre les autres pages
        },
      ),
    );
  }
}