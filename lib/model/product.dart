class Product {
  String name;
  String description;
  int availability;
  int price;

  Product({
    required this.name,
    this.description = '',
    this.availability = 0,
    this.price = 0,
  });
}
