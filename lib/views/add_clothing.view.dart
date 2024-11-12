import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/clothing.controller.dart';
import '../models/clothing.model.dart';

class AddClothingView extends StatelessWidget {
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un vêtement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: sizeController,
              decoration: InputDecoration(labelText: 'Taille'),
            ),
            TextField(
              controller: brandController,
              decoration: InputDecoration(labelText: 'Marque'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Prix'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final clothing = Clothing(
                  id: DateTime.now().toString(),
                  imageUrl: imageUrlController.text,
                  title: titleController.text,
                  category: _determineCategory(imageUrlController.text),
                  size: sizeController.text,
                  brand: brandController.text,
                  price: double.parse(priceController.text),
                );
                Provider.of<ClothingController>(context, listen: false).addClothing(clothing);
                Navigator.of(context).pop();
              },
              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }

  String _determineCategory(String imageUrl) {
    // Logique pour déterminer la catégorie en fonction de l'image
    // Pour simplifier, nous allons retourner une catégorie fixe
    return 'Haut';
  }
}