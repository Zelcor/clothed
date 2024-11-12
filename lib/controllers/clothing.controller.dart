import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/clothing.model.dart';

class ClothingController with ChangeNotifier {
  List<Clothing> _clothings = [];
  List<Clothing> _cart = [];

  List<Clothing> get clothings => _clothings;
  List<Clothing> get cart => _cart;

  ClothingController() {
    _fetchClothings();
  }

  Future<void> _fetchClothings() async {
    final snapshot = await FirebaseFirestore.instance.collection('clothings').get();
    _clothings = snapshot.docs.map((doc) => Clothing.fromMap(doc.data())).toList();
    notifyListeners();
  }

  void addToCart(Clothing clothing) {
    _cart.add(clothing);
    notifyListeners();
    // Ajouter le vêtement au panier en base de données
    FirebaseFirestore.instance.collection('carts').add(clothing.toMap());
  }

  void removeFromCart(Clothing clothing) {
    _cart.remove(clothing);
    notifyListeners();
    // Supprimer le vêtement du panier en base de données
    FirebaseFirestore.instance.collection('carts').where('id', isEqualTo: clothing.id).get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  void addClothing(Clothing clothing) {
    _clothings.add(clothing);
    notifyListeners();
    // Ajouter le vêtement en base de données
    FirebaseFirestore.instance.collection('clothings').add(clothing.toMap());
  }
}