import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_info.model.dart';
import '../controllers/auth.controller.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();
  UserInfoModel? _userInfo;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    Object userInfo = await Provider.of<AuthController>(context, listen: false).getUserInfo();
    setState(() {
      _userInfo = userInfo as UserInfoModel?;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userInfo == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _userInfo!.id,
                decoration: InputDecoration(labelText: 'Login'),
                readOnly: true,
              ),
              TextFormField(
                initialValue: _userInfo!.password,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextFormField(
                initialValue: _userInfo!.birthday,
                decoration: InputDecoration(labelText: 'Anniversaire'),
              ),
              TextFormField(
                initialValue: _userInfo!.address,
                decoration: InputDecoration(labelText: 'Adresse'),
              ),
              TextFormField(
                initialValue: _userInfo!.postalCode,
                decoration: InputDecoration(labelText: 'Code Postal'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                initialValue: _userInfo!.city,
                decoration: InputDecoration(labelText: 'Ville'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<AuthController>(context, listen: false).updateUserInfo(_userInfo!);
                  }
                },
                child: Text('Valider'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AuthController>(context, listen: false).logout();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Text('Se déconnecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}