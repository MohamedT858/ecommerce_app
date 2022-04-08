import 'package:flutter/material.dart';
import 'package:online_mart/icons/custom_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.selectedAndBGcolor,
    required this.unselectedcolor,
  }) : super(key: key);

  final Color selectedAndBGcolor;
  final Color unselectedcolor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: selectedAndBGcolor,
      automaticallyImplyLeading: false, // hides leading widget
      title: Row(
        children: [
          Expanded(
            flex: 50,
            child: Container(
              height: 37,
              child: TextField(
                cursorWidth: 1,
                cursorColor: selectedAndBGcolor,
                textAlignVertical: TextAlignVertical(y: 1.0),
                decoration: InputDecoration(
                  suffixIcon: Icon(CustomIcons.search,
                      size: 20, color: selectedAndBGcolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: unselectedcolor,
                  hintStyle: new TextStyle(color: Colors.grey[600]),
                  hintText: "Hint text",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Expanded(
            flex: 13,
            child: Container(
              child: Text(
                "AppName",
                style: TextStyle(fontSize: 15, fontFamily: 'Ubuntu'),
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                  color: unselectedcolor),
            ),
          )
        ],
      ),
    );
  }
}
