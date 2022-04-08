import 'package:flutter/material.dart';
import 'package:online_mart/models/Products.dart';
import 'package:online_mart/models/cart.dart';
import 'package:online_mart/widgets/frosted_glass_template.dart';
import 'package:online_mart/widgets/image_slider.dart';
import 'package:online_mart/widgets/stars.dart';
import 'package:online_mart/main.dart';

final HomeScreenState hs = new HomeScreenState();

final List<BoxShadow> shadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.28),
    spreadRadius: 2.0,
    blurRadius: 10.0,
    offset: const Offset(
      5.0,
      5.0,
    ),
  ),
  BoxShadow(
    color: Colors.white.withOpacity(0.28),
    blurRadius: 0.0,
    spreadRadius: 0.0,
    offset: const Offset(0.0, 0.0),
  )
];
BorderRadiusGeometry radius = BorderRadius.only(
  bottomLeft: Radius.circular(25),
  bottomRight: Radius.circular(25),
);
int quantity = 1;

class ProductPage extends StatelessWidget {
  ProductPage({
    required this.name,
    required this.price,
    required this.description,
    required this.discount,
    required this.img,
    required this.stars,
    required this.heroTag,
    required this.prodID,
  });
  final EdgeInsetsGeometry padding =
      const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0);
  final String name;
  final String price;
  final String description;
  final String discount;
  final List<String> img;
  final double stars;
  final String heroTag;
  final int prodID;

  @override
  Widget build(BuildContext context) {
    quantity = 1;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SizedBox.expand(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FrostedGlass(
                  sigmaX: 0,
                  sigmaY: 0,
                  height: size.height * .65,
                  width: size.width,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: radius,
                    ),
                    child: Stack(children: [
                      Hero(
                        tag: heroTag,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          child: ImageSlider(
                            autoPlayInterval: Duration(seconds: 7),
                            viewportFraction: 1.015,
                            height: size.height * .65,
                            containerBorderRadius: radius,
                            slideShowImgs: img,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 20,
                          child: SizedBox(
                              width: size.width,
                              child: ProdPageBar(index: prodID))),
                    ]),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(name,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold)),
                ),
                Divider(
                    thickness: 2,
                    indent: 18,
                    endIndent: MediaQuery.of(context).size.width * .20,
                    color: Colors.blueGrey.shade300.withOpacity(.7)),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Rating(stars, 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "$price",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 1),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: RichText(
                                text: TextSpan(
                              text: "$discount",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w200,
                                color: Colors.grey.shade900,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                    thickness: 2,
                    indent: 18,
                    endIndent: MediaQuery.of(context).size.width * .60,
                    color: Colors.blueGrey.shade300.withOpacity(.7)),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                  child: Text("Description:",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 12.0, right: 1.0),
                  child: Text(description,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                      )),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
          //the bottom two buttons
          Positioned(
            bottom: 15,
            left: 10,
            right: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 300,
                  child: TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            (EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal:
                                    ((MediaQuery.of(context).size.width - 35) /
                                            2) *
                                        .37))),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                        elevation: MaterialStateProperty.all<double>(10.0),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor.withOpacity(0.1))),
                    onPressed: (() {
                      showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.27),
                          transitionDuration: Duration(milliseconds: 700),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 80,
                                      child: ItemsCount(
                                        buttonsDimensions: 10,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 98,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15, right: 15),
                                        child: TextButton(
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty
                                                  .all<EdgeInsets>(
                                                      (EdgeInsets.symmetric(
                                                vertical: 10,
                                              ))),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(0.1))),
                                          onPressed: (() {
                                            addToCart(name, price, img[0],
                                                prodID, quantity);
                                            Navigator.pop(context);
                                          }),
                                          child: Text(
                                            "Add To Cart",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "Ubuntu",
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(
                                    bottom: 0, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade50,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25)),
                                ),
                              ),
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          });
                    }),
                    child: Text(
                      "Buy now",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 120,
                  child: TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            (EdgeInsets.symmetric(
                          vertical: 15,
                        ))),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                        elevation: MaterialStateProperty.all<double>(10.0),
                        shadowColor: MaterialStateProperty.all<Color>(
                          Colors.black,
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor,
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.1))),
                    onPressed: (() {
                      Navigator.pop(context, 1);
                    }),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ProdPageBar extends StatefulWidget {
  ProdPageBar({required this.index});
  final int index;
  @override
  _ProdPageBarState createState() => _ProdPageBarState();
}

class _ProdPageBarState extends State<ProdPageBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon:
                  Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: IconButton(
              onPressed: (() {
                setState(() {
                  prods[widget.index].isFav = !prods[widget.index].isFav;
                });
              }),
              icon: Icon(
                  prods[widget.index].isFav
                      ? Icons.favorite_border_outlined
                      : Icons.favorite,
                  color: Colors.red),
            ),
          ),
        ]);
  }
}

class ItemsCount extends StatefulWidget {
  const ItemsCount({
    required this.buttonsDimensions,
  });
  final double buttonsDimensions;
  @override
  ItemCountState createState() => ItemCountState();
}

class ItemCountState extends State<ItemsCount> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quantity:",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  IconButton(
                    splashColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    splashRadius: 20,
                    iconSize: 15,
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon:
                        Icon(Icons.add, color: Theme.of(context).primaryColor),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    width: widget.buttonsDimensions + 20,
                    height: widget.buttonsDimensions + 15,
                    child: Text(quantity.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Ubuntu",
                            color: Theme.of(context).primaryColor)),
                  ),
                  IconButton(
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      iconSize: 15,
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove,
                        color: quantity == 1
                            ? Colors.grey
                            : Theme.of(context).primaryColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
