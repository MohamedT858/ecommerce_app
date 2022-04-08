import 'package:flutter/material.dart';
import 'package:online_mart/widgets/stars.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.price,
    required this.discount,
    required this.img,
    required this.bgColor,
    required this.name,
    required this.index,
    required this.stars,
  }) : super(key: key);

  final String name;
  final String price;
  final String discount;
  final String img;
  final Color bgColor;
  final int index;
  final double stars;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      height: 270,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Hero(
            tag: "ProductTranstion$index",
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: bgColor,
              ),
              height: 155,
              margin: EdgeInsets.all(5.0),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Rating(stars, 5),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "$price",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 1),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
                text: TextSpan(
              text: "$discount",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w200,
                color: Colors.grey.shade900,
                decoration: TextDecoration.lineThrough,
              ),
            )),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
