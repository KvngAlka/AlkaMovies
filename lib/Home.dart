import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> prod = ["Naruto", "Vader", "Kill Bill", "Infamous","Others"];
  @override
  Widget build(BuildContext context) {

    Widget productBox(){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white24,

            ),
            width: MediaQuery.of(context).size.width * 0.45,
            height: 200,
            child: Stack(
            children: <Widget>[
              Image.asset("asset/images/11.jpg", fit: BoxFit.cover,),
              Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.panorama_fish_eye, size: 20.0, color: Colors.black,),
                ),
              )
            ],
          ),),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: SingleChildScrollView(
          child: Column( 
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                color: Colors.white30,
                child: Stack(
                  children: <Widget>[
                    //as some kindaf background
                    Opacity(

                        child: Image.asset("asset/images/11.jpg", fit: BoxFit.fill,),
                      opacity: 0.3,
                    ),
                    //custom appbar
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("aLKa Movies",
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),

                          Container(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.search, color: Colors.white,),onPressed: (){},),
                                IconButton(icon: Icon(Icons.shop, color: Colors.white,),onPressed: (){},),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //slogan

                    Positioned(
                      bottom: 20.0,
                      left: 10.0,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Life is" , style: TextStyle(color: Colors.white, fontSize: 30.0, letterSpacing: 1.0),),
                            Text("So Simple", style: TextStyle(color: Colors.white, fontSize: 30.0,letterSpacing: 1.0),),
                            Text("This week 20% discount", style: TextStyle(color: Colors.white),),
                            //button for buy
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.amber,
                                child: FlatButton(
                                  color: Colors.amber,
                                  onPressed: (){},
                                child: Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 20),),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //bellow list
              Container(
                height: 100,
                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: prod.length,itemBuilder: (BuildContext context, index){
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(prod[index], style: TextStyle(color: Colors.white, fontSize: 20.0),),
                  );
                }),
              ),


              //unknown
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text("New", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),

                      Container(

                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                productBox(),
                                productBox(),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                productBox(),
                                productBox(),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}
