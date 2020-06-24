import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alkamovies/Cart.dart';
import 'package:alkamovies/Home.dart';
import 'package:alkamovies/Discover.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PageController pageController;
  int currentPageNumber ;
  int initPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: initPage , keepPage: true);
    currentPageNumber = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(primaryColorDark: Color(0xFF343a40)),
      routes:{
        HomePage.id : (context) => HomePage(),
      },
      theme: ThemeData(primaryColor: Colors.white, primaryColorDark: Color(0xFF20201f)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF20201f),
        bottomNavigationBar: Container(
          height: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: Colors.white24,

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home ,size: 30,color:  currentPageNumber == 0 ? Colors.amber : Colors.white,),
                onPressed: (){
                setState(() {
                  currentPageNumber = 0;
                });
                pageController.jumpToPage(currentPageNumber);
              },),
              IconButton(icon: Icon(Icons.explore, size: 30,), color:  currentPageNumber == 1 ? Colors.amber : Colors.white,
                onPressed: (){
                  setState(() {
                    currentPageNumber = 1;
                  });
                pageController.jumpToPage(currentPageNumber);
              },),
              IconButton(icon: Icon(Icons.shopping_cart, size: 30,color:  currentPageNumber == 2 ? Colors.amber : Colors.white,),
                onPressed: (){
                  setState(() {
                    currentPageNumber = 2;
                  });
                pageController.jumpToPage(currentPageNumber);
              },)
            ],
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            HomePage(),
            DiscoverPage(),
            CartPage(),
          ],
        ),
      ),
    );
  }
}
