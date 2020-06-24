import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<String> movieCartTitles = ["Naruto", "Avengers", "Insecure", "Kill Bill", "On the Road", "Such is Life", "Thug"];
  List<double> movieCartPrice = [123, 412, 455, 43, 12, 56, 56 , ];

  double totalPrice ;
  double discount ;
  double netTotal ;
  @override
  void initState() {
    totalPrice = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    for(int i = 0 ;i < movieCartPrice.length;i++){
      totalPrice = totalPrice + movieCartPrice[i];
    }

    discount = totalPrice * 0.20;
    netTotal = totalPrice - discount;

    Widget cartTile(String title, double price){
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(shape: BoxShape.circle,),
            child: Image.asset("asset/images/11.jpg", fit: BoxFit.cover,),
          ),
          title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
          subtitle: Text("\$ " + "$price" ,style: TextStyle(color: Colors.amber, fontSize: 20),),
          trailing: Container(
            width: 105,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.amber,
                  ),
                  height: 30,
                  width: 30,

                  child: Icon(Icons.exposure_neg_1, color: Colors.white,),
                ),
                Text("1" , style: TextStyle(color: Colors.white, fontSize: 30),),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.amber,
                  ),
                  height: 30,
                  width: 30,
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text("Carts", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.white,),)
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.57,
              child: ListView.builder(
                itemCount: movieCartTitles.length,
                  itemBuilder: (BuildContext context, index){
                return cartTile(movieCartTitles[index], movieCartPrice[index]);
              }),
            ),
            Expanded(
              child: Container(
                color: Color(0xFF303030),
                  height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Discount: ", style: TextStyle(color: Colors.white),),
                          Text("\$ $discount" ,style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Total: ",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                          ),

                          Text("\$ $netTotal",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                          ),

                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *0.9,
                        height: 40,
                        child: FlatButton(
                          onPressed: (){},
                          color: Colors.amber,
                          child: Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
