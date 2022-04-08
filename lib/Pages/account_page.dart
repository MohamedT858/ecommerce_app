import 'package:flutter/material.dart';
import 'package:online_mart/models/Users.dart';

class AccountPage extends StatelessWidget {
  Widget listItemBuilder(index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: accountPageListItems[index].leadingIcon,
              ),
              Text(accountPageListItems[index].tapName,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  Widget accountListBuilder(BuildContext context) {
    final listItems =
        List<Widget>.generate(accountPageListItems.length, (index) {
      return listItemBuilder(index, context);
    });
    return Column(
      children: listItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> shadow = [
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
    return SizedBox.expand(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        color: Colors.blueGrey.shade50,
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text("Account & Preferences",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 60,
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      boxShadow: shadow,
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('lib/assets/E3oihSUUYAM1CGu.jpg'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Customer Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      )),
                  SizedBox(height: 10),
                  Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: MediaQuery.of(context).size.width * .3,
                      color: Colors.blueGrey.shade300.withOpacity(.7)),
                  SizedBox(height: 10),
                  accountListBuilder(context),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
