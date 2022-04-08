import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_mart/Pages/prodcut_page.dart';
import 'package:online_mart/models/Products.dart';
import 'package:online_mart/models/cart.dart';
import 'package:online_mart/widgets/cart_item_card.dart';
import 'package:online_mart/widgets/frosted_glass_template.dart';

StreamController<String> totalUpdate = StreamController<String>.broadcast();
StreamController<int> streamContrller = StreamController<int>.broadcast();

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox.expand(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          color: Colors.blueGrey.shade50,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text("Items In Cart",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Column(
                  children: [
                    ItemListBuilder(
                        cartItem: cartItems, stream: streamContrller.stream),
                    SizedBox(height: 120),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      BottomCartBar(stream: totalUpdate.stream),
    ]);
  }
}

class BottomCartBar extends StatefulWidget {
  final Stream<String> stream;

  const BottomCartBar({Key? key, required this.stream}) : super(key: key);
  @override
  _BottomCartBarState createState() => _BottomCartBarState();
}

class _BottomCartBarState extends State<BottomCartBar> {
  @override
  void initState() {
    super.initState();
    widget.stream.listen((string) {
      if (string == " ") {
        updateTotal();
      } else if (string == "E") {
        cartIsEmpty();
      }
    });
  }

  String totalPrice = "0.00";
  void priceSum() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].isPressed == false) {
        totalPrice += double.parse(cartItems[i]
                .price
                .substring(0, cartItems[i].price.indexOf(" "))) *
            cartItems[i].numOfItems;
      }
    }
    this.totalPrice = totalPrice.toStringAsFixed(2);
  }

  void cartIsEmpty() {
    setState(() {
      totalPrice = "0.00";
    });
  }

  void updateTotal() {
    setState(() {
      priceSum();
    });
  }

  @override
  Widget build(BuildContext context) {
    priceSum();
    return cartItems.length > 0
        ? Positioned(
            left: 15,
            bottom: 80,
            child: Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          (EdgeInsets.symmetric(vertical: 18, horizontal: 70))),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  onPressed: (() {}),
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 245,
                  child: Column(
                    children: [
                      Text("Total:",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Ubuntu",
                            color: Theme.of(context).primaryColor,
                          )),
                      Text("$totalPrice EGP",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        : SizedBox.shrink();
  }
}

class ItemListBuilder extends StatefulWidget {
  const ItemListBuilder({required this.cartItem, required this.stream});
  final Stream<int> stream;
  final List<CartItems> cartItem;

  @override
  ItemListBuilderState createState() => ItemListBuilderState();
}

class ItemListBuilderState extends State<ItemListBuilder> {
  @override
  void initState() {
    super.initState();
    widget.stream.listen((index) {
      updateList(index);
    });
  }

  void updateList(index) {
    setState(() {
      widget.cartItem.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return cartItems.length > 0
        ? Container(
            height: (110 * widget.cartItem.length + 70).toDouble(),
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
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
                ],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.cartItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (() async {
                          await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProductPage(
                              name: prods[widget.cartItem[index].prodID].name,
                              price: prods[widget.cartItem[index].prodID].price,
                              description: prods[widget.cartItem[index].prodID]
                                  .description,
                              discount:
                                  prods[widget.cartItem[index].prodID].discount,
                              img: [
                                widget.cartItem[index].img,
                                widget.cartItem[index].img,
                                widget.cartItem[index].img
                              ],
                              stars: prods[widget.cartItem[index].prodID].stars,
                              heroTag: "",
                              prodID: widget.cartItem[index].prodID,
                            );
                          }));
                        }),
                        child: FrostedGlass(
                          sigmaX: 0,
                          sigmaY: 0,
                          height: 110 - 10,
                          width: MediaQuery.of(context).size.width - 10,
                          child: CartItemCard(
                              index: index,
                              img: widget.cartItem[index].img,
                              prodName: widget.cartItem[index].prodName,
                              width: 90,
                              sellerName: 'SellerName',
                              price: widget.cartItem[index].price),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }),
          )
        : Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2 - 100),
                child: Center(
                    child: Icon(
                  Icons.add_shopping_cart_rounded,
                  size: 65,
                  color: Theme.of(context).primaryColor,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cart Is Empty",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor)),
              ),
            ],
          );
  }
}
