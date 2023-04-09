import 'package:estampados_app/Car/car_product.dart';

class Product {
  late int id;
  late String name;
  late String image;
  late String type;
  late String size;
  late double price;
  late String description;
  late int inventoryQuantity;
  late List<CarProduct> miLista = [];
  Product ({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.size,
    required this.price,
    required this.description,
    required this.inventoryQuantity,
  });
}
