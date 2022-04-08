import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int starsCount;
  final double rating;

  Rating([this.rating = 0, this.starsCount = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  Widget _buildRatingStar(int index) {
    if (index <= widget.rating && index <= widget.rating.abs()) {
      return Icon(Icons.star, color: Colors.amber);
    } else if (index - widget.rating < 1 && index - widget.rating > 0) {
      return Icon(Icons.star_half, color: Colors.amber);
    } else {
      return Icon(Icons.star_border_outlined, color: Colors.grey);
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.starsCount, (index) {
      return _buildRatingStar(index + 1);
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
