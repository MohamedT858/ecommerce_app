import 'package:flutter/material.dart';

class ChipListView extends StatelessWidget {
  const ChipListView({
    Key? key,
    required this.chipsLabels,
  }) : super(key: key);
  final List<String> chipsLabels;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipsLabels.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (() {
                print("chip num $index has been tapped");
              }),
              child: Container(
                margin: EdgeInsets.only(right: 7, left: 7, top: 3),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  border: Border.all(
                      color: Colors.blueGrey.shade100.withOpacity(0.8),
                      width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9.0,
                    ),
                    child: Text(
                      chipsLabels[index] + '$index',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
