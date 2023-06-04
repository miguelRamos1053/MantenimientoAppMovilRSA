class Item {

  Item(
      {required this.name,
      required this.unit,
      required this.price,
      required this.image});
  final String name;
  final String unit;
  final int price;
  final String image;

  Map toJson() {
    return {
      'name': name,
      'unit': unit,
      'price': price,
      'image': image,
    };
  }
}
