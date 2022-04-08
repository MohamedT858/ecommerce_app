import 'package:flutter/services.dart';
import 'package:online_mart/Pages/account_page.dart';
import 'package:online_mart/Pages/cart_page.dart';
import 'package:online_mart/Pages/deals_Page.dart';
import 'package:online_mart/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'icons/NavBar_icons.dart';
import 'icons/custom_icons.dart';
import 'package:online_mart/Pages/home_page.dart';
import 'dart:async';

StreamController<int> streamController = StreamController<int>();
void main() => runApp(OnlineMart());

class OnlineMart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
        primaryColor: Color(0xff0E0B16),
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xffFFD523)),
      ),
      home: HomeScreen(streamController.stream),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.stream);
  final Stream<int> stream;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  ShapeBorder? bottomBarShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(6.0);
  int selectedItemPosition = 4;
  SnakeShape snakeShape = SnakeShape.rectangle;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = true;

  PageController pageController = PageController();

  @override
  void initState() {
    print("initStating....");

    super.initState();

    pageController = PageController(initialPage: 4);
    widget.stream.listen((index) {
      changePage(index);
    });
  }

  void changePage(index) {
    setState(() {
      selectedItemPosition = 1;
      pageController.jumpToPage(1);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("building....");

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: selectedItemPosition == 4
          ? PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: CustomAppBar(
                  selectedAndBGcolor: Theme.of(context).primaryColor,
                  unselectedcolor: Theme.of(context).colorScheme.secondary),
            )
          : null,
      body: SizedBox.expand(
        child: PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() => selectedItemPosition = index);
          },
          children: <Widget>[
            AccountPage(),
            CartPage(),
            DealsPage(pageColor: Colors.blue),
            DealsPage(pageColor: Colors.white),
            HomePage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: SnakeNavigationBar.color(
          height: 60,
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,
          padding: padding,
          backgroundColor: Theme.of(context).primaryColor,
          snakeViewColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          elevation: 8.0,
          showUnselectedLabels: showUnselectedLabels,
          showSelectedLabels: showSelectedLabels,
          currentIndex: selectedItemPosition,
          onTap: (index) {
            setState(() => selectedItemPosition = index);
            pageController.jumpToPage(index);
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined, size: 25), label: 'account'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 24),
                label: 'cart'),
            const BottomNavigationBarItem(
                icon: Icon(NavBar.thiccDeals, size: 25), label: 'deals'),
            const BottomNavigationBarItem(
                icon: Icon(NavBar.Categories64, size: 25), label: 'categories'),
            const BottomNavigationBarItem(
                icon: Icon(CustomIcons.home), label: 'home')
          ],
          selectedLabelStyle: const TextStyle(fontSize: 15),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }
}
