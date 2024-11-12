import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/clothing.model.dart';
import '../controllers/clothing.controller.dart';

class ClothingDetailView extends StatelessWidget {
  final Clothing clothing;

  ClothingDetailView({required this.clothing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail du vêtement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200.0,
                  child: Image.network(
                    clothing.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  clothing.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Catégorie: ${clothing.category}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Taille: ${clothing.size}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Marque: ${clothing.brand}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Prix: ${clothing.price}€',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Retour'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Ajouter le vêtement au panier
                        Provider.of<ClothingController>(context, listen: false).addToCart(clothing);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Vêtement ajouté au panier')),
                        );
                      },
                      child: Text('Ajouter au panier'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}