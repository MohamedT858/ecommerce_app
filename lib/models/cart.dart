class CartItems {
  final String prodName;
  final String price;
  final String img;
  final int prodID;
  bool isPressed = false;
  int numOfItems;
  CartItems({
    required this.numOfItems,
    required this.prodName,
    required this.price,
    required this.img,
    required this.prodID,
  });
}

List<CartItems> cartItems = [];

int addToCart(
    String prodName, String price, String img, int prodID, int numOfItems) {
  int reptition = 0;
  for (int i = 0; i < cartItems.length; i++) {
    if (prodID == cartItems[i].prodID) {
      cartItems[i].numOfItems++;
      reptition = cartItems[i].numOfItems;
    }
  }

  if (reptition == 0) {
    cartItems += [
      CartItems(
          prodName: prodName,
          price: price,
          img: img,
          prodID: prodID,
          numOfItems: numOfItems)
    ];
  }
  return cartItems.length;
}
