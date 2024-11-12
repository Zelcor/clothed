import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/clothing.controller.dart';
import '../models/clothing.model.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Consumer<ClothingController>(
        builder: (context, clothingController, child) {
          final cart = clothingController.cart;
          final total = cart.fold(0.0, (sum, item) => sum + item.price);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final clothing = cart[index];
                    return ListTile(
                        leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(clothing.imageUrl),
                        ),
                      title: Text(clothing.title),
                      subtitle: Text('Taille: ${clothing.size} - Prix: ${clothing.price}€'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          clothingController.removeFromCart(clothing);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Total: $total€', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      ),
    );
  }
}