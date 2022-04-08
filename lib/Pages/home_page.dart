import 'package:online_mart/models/Products.dart';
import 'package:online_mart/widgets/horizontal_prod_cards.dart';
import 'package:online_mart/widgets/image_slider.dart';
import 'package:flutter/material.dart';

final List<String> chipsLabels = <String>[
  'Category/item num',
  'Category/item num',
  'Category/item num',
  'Category/item num',
  'Category/item num',
  'Category/item num'
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: bg,
              //   fit: BoxFit.cover,
              // ),
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ImageSlider(slideShowImgs: prods[0].img),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
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
                child: CardsWithChips(
                    heroTagOffset: 10,
                    label: "Popular items:",
                    items: prods,
                    chips: true,
                    chipsLabels: chipsLabels),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
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
                child: CardsWithChips(
                  heroTagOffset: 20,
                  label: "Just for you:",
                  items: prods,
                  chips: false,
                  chipsLabels: [""],
                ),
              ),
              SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
