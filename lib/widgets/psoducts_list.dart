import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/pages/product_details.dart';
import 'package:fashionista/widgets/product_card.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        crossAxisCount: 2,
        childAspectRatio: 0.45,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetails(product: product);
                  },
                ),
              ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}
