import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/models/you_may_also_like_item_model.dart';
import 'package:fashionista/widgets/you_may_also_like_item.dart';

class Helper {
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
  static List<YouMayAlsoLikeItemModel> mayAlsoLike = [
    YouMayAlsoLikeItemModel(
      image: "assets/imgs/Rectangle 440.png",
      name: "HAE BY HAEKIM",
    ),
    YouMayAlsoLikeItemModel(
      image: "assets/imgs/Rectangle 440.png",
      name: "Black collection",
    ),
  ];
}
