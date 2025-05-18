import 'package:fashionista/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  widget.product.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 215,
                left: 155,
                child:
                    widget.product.isLiked
                        ? GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.product.isLiked = !widget.product.isLiked;
                            });
                          },
                          child: Icon(Icons.favorite, color: Color(0xffDD8560)),
                        )
                        : GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.product.isLiked = !widget.product.isLiked;
                            });
                          },
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xffDD8560),
                          ),
                        ),
              ),
            ],
          ),
          Text(
            widget.product.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Tenor Sans",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Tenor Sans",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "\$${widget.product.price.toInt()}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xffDD8560),
              fontFamily: "Tenor Sans",
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

/*
SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.product.image, 
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 215,
                left: 155,
                child: widget.product.isLiked
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.product.isLiked = !widget.product.isLiked;
                          });
                        },
                        child: Icon(Icons.favorite, color: Color(0xffDD8560)),
                      )
                      : GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.product.isLiked = !widget.product.isLiked;
                          });
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Color(0xffDD8560),
                        ),
                      ),
              ),),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Tenor Sans",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Tenor Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "\$${widget.product.price.toInt()}",
                  style: TextStyle(
                    color: Color(0xffDD8560),
                    fontFamily: "Tenor Sans",
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
*/
