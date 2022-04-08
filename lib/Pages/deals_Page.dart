import 'package:flutter/material.dart';

class DealsPage extends StatelessWidget {
  final Color pageColor;

  const DealsPage({
    Key? key,
    required this.pageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pageColor,
    );
  }
}
