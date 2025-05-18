class Product {
  String image;
  bool isLiked;
  String name;
  String description;
  double price;
  Product({
    required this.description,
    required this.image,
    required this.isLiked,
    required this.name,
    required this.price,
  });

  static List<Product> products = [
    Product(
      description: "reversible angora cardigan",
      image: "assets/imgs/Rectangle 344.png",
      isLiked: false,
      name: "October collection",
      price: 120,
    ),
    Product(
      description: "leatherette and cashmere",
      image: "assets/imgs/Rectangle 344 (1).png",
      isLiked: false,
      name: "October collection",
      price: 100,
    ),
    Product(
      description: "leatherette and cashmere",
      image: "assets/imgs/Rectangle 344 (2).png",
      isLiked: false,
      name: "October collection",
      price: 100,
    ),
    Product(
      description:
          "reversible angorsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssa cardigan",
      image: "assets/imgs/Rectangle 344 (3).png",
      isLiked: false,
      name: "October collection",
      price: 120,
    ),
    Product(
      description: "leatherette and cashmere",
      image: "assets/imgs/Rectangle 344 (4).png",
      isLiked: false,
      name: "October collection",
      price: 100,
    ),
    Product(
      description: "description",
      image: "assets/imgs/Rectangle 344 (5).png",
      isLiked: false,
      name: "name",
      price: 100,
    ),
  ];
}
