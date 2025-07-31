import 'package:get/get.dart';

class Product {
  final String id;
  final String name;
  final String? subtitle;
  final int quantity;

  const Product({
    required this.id,
    required this.name,
    this.subtitle,
    this.quantity = 1,
  });
}

class ProductCategory {
  final String name;
  final List<Product> products;

  const ProductCategory({required this.name, required this.products});
}
