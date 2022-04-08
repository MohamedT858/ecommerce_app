import 'package:flutter/material.dart';
import 'package:online_mart/Pages/cart_page.dart';
import 'package:online_mart/models/cart.dart';
import 'package:online_mart/widgets/check_mark_button.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    required this.img,
    required this.width,
    required this.prodName,
    required this.sellerName,
    required this.price,
    required this.index,
  });
  final double width;
  final String img;
  final String prodName;
  final String sellerName;
  final String price;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: width,
        height: width,
        margin: EdgeInsets.only(
          left: 10.0,
          top: 5,
          right: 10,
        ),
      ),
      Container(
        height: width + 10,
        width: MediaQuery.of(context).size.width - 122,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 162,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(prodName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold)),
                ),
                CheckMarkButton(index: index),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(price,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Spacer(),
                ItemsCount(
                  buttonsDimensions: 10,
                  index: index,
                ),
              ],
            )
          ],
        ),
      )
    ]));
  }
}

class ItemsCount extends StatefulWidget {
  const ItemsCount({
    required this.buttonsDimensions,
    required this.index,
  });
  final double buttonsDimensions;
  final int index;
  @override
  _ItemCountState createState() => _ItemCountState();
}

ItemListBuilderState listBuilder = new ItemListBuilderState();

class _ItemCountState extends State<ItemsCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
          splashRadius: 20,
          iconSize: 15,
          onPressed: () {
            totalUpdate.add(" ");

            setState(() {
              cartItems[widget.index].numOfItems++;
            });
          },
          icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          width: widget.buttonsDimensions + 20,
          height: widget.buttonsDimensions + 15,
          child: Text(cartItems[widget.index].numOfItems.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Ubuntu",
                  color: Theme.of(context).primaryColor)),
        ),
        IconButton(
            splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
            splashRadius: 20,
            padding: EdgeInsets.zero,
            iconSize: 15,
            onPressed: () {
              totalUpdate.add(" ");

              setState(() {
                if (cartItems[widget.index].numOfItems > 1) {
                  cartItems[widget.index].numOfItems--;
                } else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      contentPadding:
                          EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 15.0),
                      actionsPadding: EdgeInsets.symmetric(horizontal: 5.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      content: Text('Remove Item From Cart?',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Ubuntu",
                              color: Theme.of(context).primaryColor)),
                      actions: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(
                                Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1)),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Ubuntu",
                                  color: Theme.of(context).primaryColor)),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(
                                Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1)),
                          ),
                          onPressed: () {
                            streamContrller.add(widget.index);
                            totalUpdate.add("E");
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 81,
                            child: Row(
                              children: [
                                Icon(Icons.delete_outlined, color: Colors.red),
                                SizedBox(width: 3),
                                Text('Remove',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              });
            },
            icon: Icon(
              Icons.remove,
              color: cartItems[widget.index].numOfItems == 1
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
            )),
      ],
    );
  }
}
