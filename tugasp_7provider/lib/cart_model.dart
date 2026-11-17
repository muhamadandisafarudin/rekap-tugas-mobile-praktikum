import 'dart:collection';

import 'package:flutter/material.dart';

class Product {
  final String nama, deskripsi;

  Product(this.nama, this.deskripsi);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  // Dibuat read-only supaya list hanya bisa diubah lewat method di model ini
  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);
  int get totalItems => _items.length;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  // Hapus berdasarkan posisi, jadi aman walaupun produk yang sama
  // dimasukkan ke keranjang lebih dari satu kali
  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}