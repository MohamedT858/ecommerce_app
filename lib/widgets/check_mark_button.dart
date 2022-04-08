import 'package:flutter/material.dart';
import 'package:online_mart/Pages/cart_page.dart';
import 'package:online_mart/models/cart.dart';

class CheckMarkButton extends StatefulWidget {
  final int index;

  const CheckMarkButton({Key? key, required this.index}) : super(key: key);
  @override
  _CheckMarkButtonState createState() => _CheckMarkButtonState();
}

class _CheckMarkButtonState extends State<CheckMarkButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        totalUpdate.add(" ");

        setState(() {
          cartItems[widget.index].isPressed =
              !cartItems[widget.index].isPressed;
          print(cartItems[widget.index].isPressed);
        });
      },
      child: Container(
          margin: EdgeInsets.only(top: 10, right: 8),
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: cartItems[widget.index].isPressed == true
                ? null
                : Theme.of(context).primaryColor,
          ),
          child: Icon(
            Icons.check,
            size: 17,
            color: cartItems[widget.index].isPressed == true
                ? Theme.of(context).primaryColor
                : Colors.white,
          )),
    );
  }
}
