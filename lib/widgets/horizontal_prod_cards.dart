import 'package:flutter/material.dart';
import 'package:online_mart/Pages/prodcut_page.dart';
import 'package:online_mart/models/Products.dart';
import 'package:online_mart/widgets/chipListview.dart';
import 'package:online_mart/widgets/frosted_glass_template.dart';
import 'package:online_mart/widgets/product_card.dart';
import '../main.dart';

class CardsWithChips extends StatelessWidget {
  const CardsWithChips({
    Key? key,
    required this.label,
    required this.items,
    required this.chips,
    required this.chipsLabels,
    required this.heroTagOffset,
  }) : super(key: key);

  final List<Products> items;
  final String label;
  final bool chips;
  final List<String> chipsLabels;
  final int heroTagOffset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600)),
                  InkWell(
                    onTap: () {
                      print("See More $label");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("see more",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Ubuntu",
                              color: Colors.blueGrey,
                            )),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
                thickness: 2,
                indent: 10,
                endIndent: MediaQuery.of(context).size.width * .20,
                color: Colors.blueGrey.shade300.withOpacity(.5)),
            chips ? ChipListView(chipsLabels: chipsLabels) : SizedBox(),
          ]),
        ),
        Container(
          height: 310,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: prods.length,
              itemBuilder: (BuildContext context, int index) {
                int indexWithOffset = index + heroTagOffset;
                String heroTag = "ProductTranstion$indexWithOffset";
                String imgUrl =
                    'https://picsum.photos/250?image=$indexWithOffset';
                return InkWell(
                  onTap: (() async {
                    print(hs.selectedItemPosition);

                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductPage(
                        name: items[index].name,
                        price: items[index].price,
                        description: items[index].description,
                        discount: items[index].discount,
                        img: [imgUrl, imgUrl, imgUrl],
                        stars: items[index].stars,
                        heroTag: heroTag,
                        prodID: index,
                      );
                    })).then((value) =>
                        value == 1 ? streamController.add(index) : null);
                  }),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 13),
                    child: FrostedGlass(
                      sigmaX: 0,
                      sigmaY: 0,
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 270,
                      child: ProductCard(
                        name: items[index].name,
                        price: items[index].price,
                        discount: items[index].discount,
                        img: imgUrl,
                        stars: items[index].stars,
                        bgColor: Theme.of(context).primaryColor,
                        index: indexWithOffset,
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
