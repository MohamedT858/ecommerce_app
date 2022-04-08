class Products {
  final String price;
  final String description;
  final String discount;
  final List<String> img;
  final double stars;
  final String name;
  bool isFav;
  Products({
    required this.name,
    required this.price,
    required this.discount,
    required this.img,
    required this.description,
    required this.stars,
    required this.isFav,
  });
}

List<Products> prods = [
  Products(
      name: "Product Name Goes Here",
      price: "19.99 EGP",
      discount: "24.99 EGP",
      img: [
        "https://picsum.photos/id/120/720/576/",
        "https://picsum.photos/id/500/720/576/",
        "https://picsum.photos/id/250/720/576/",
        "https://picsum.photos/id/69/720/576/",
        "https://picsum.photos/id/25/720/576/",
      ],
      description:
          "ASGSGSGS afhioaf aghasi jlka nlkania ASGSGSGS afhioaf aghasi jlka nlkania ASGSGSGS afhioaf aghasi jlka nlkaniaASGSGSGS afhioaf aghasi jlka nlkaniaASGSGSGS afhioaf aghasi jlka nlkania ASGSGSGS afhioaf aghasi jlka nlkania ASGSGSGS afhioaf aghasi jlka nlkaniaASGSGSGS afhioaf aghasi jlka nlkania",
      stars: 2.5,
      isFav: false),
  Products(
      name: "Product Name Goes Here",
      price: "39.99 EGP",
      discount: "49.99EGP",
      img: [
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200"
      ],
      description: "ASGSGSGS afhioaf aghasi jlka nlkania",
      stars: 1.0,
      isFav: true),
  Products(
      name: "Product Name Goes Here",
      price: "99.99 EGP",
      discount: "119.99 EGP",
      img: [
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200"
      ],
      description: "ASGSGSGS afhioaf aghasi jlka nlkania",
      stars: 3.5,
      isFav: true),
  Products(
    name: "Product Name Goes Here",
    price: "9.99 EGP",
    discount: "19.99 EGP",
    img: [
      "https://picsum.photos/200",
      "https://picsum.photos/200",
      "https://picsum.photos/200",
      "https://picsum.photos/200"
    ],
    description: "ASGSGSGS afhioaf aghasi jlka nlkania",
    stars: 4.0,
    isFav: true,
  ),
  Products(
      name: "Product Name Goes Here",
      price: "150.00 EGP",
      discount: "159.99 EGP",
      img: [
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200"
      ],
      description: "ASGSGSGS afhioaf aghasi jlka nlkania",
      stars: 5.0,
      isFav: false),
  Products(
      name: "Product Name Goes Here",
      price: "4.99 EGP",
      discount: "14.99 EGP",
      img: [
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200",
        "https://picsum.photos/200"
      ],
      description: "ASGSGSGS afhioaf aghasi jlka nlkania",
      stars: 0.0,
      isFav: false),
];
