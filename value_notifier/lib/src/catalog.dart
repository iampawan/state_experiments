import 'dart:async';
import 'dart:collection';
import 'dart:ui' show Color;

import 'product.dart';

/// Returns the catalog of products.
Future<Catalog> fetchCatalog() {
  // This simulates a short delay so that we don't get too cocky about having
  // this state present from application start (something unlikely to happen
  // in the real world).
  return new Future.delayed(
      const Duration(milliseconds: 200), () => new Catalog._sample());
}

class Catalog {
  static const List<Product> _sampleProducts = const <Product>[
    const Product(42, "Sweater", const Color.fromRGBO(2, 90, 60, 1.0)),
    const Product(1337, "Shawl", const Color.fromRGBO(90, 250, 3, 1.0)),
    const Product(1024, "Socks", const Color.fromRGBO(250, 240, 16, 1.0)),
    const Product(123, "Jacket", const Color.fromRGBO(20, 0, 250, 1.0)),
    const Product(201805, "Hat", const Color.fromRGBO(100, 100, 250, 1.0)),
    const Product(321, "Tuxedo", const Color.fromRGBO(250, 250, 0, 1.0)),
  ];

  final List<Product> _products;

  Catalog.empty() : _products = [];

  Catalog._sample() : _products = _sampleProducts;

  UnmodifiableListView<Product> get products =>
      new UnmodifiableListView<Product>(_products);
}