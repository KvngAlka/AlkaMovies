import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<String> movieType = ["Adventure", "Action", "Romantic", "Fiction"];

  bool isGrid;

  @override
  void initState() {
    super.initState();
    isGrid = true;
  }
  @override
  Widget build(BuildContext context) {

    Widget productBox(double widthRatio, double height){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white24,

            ),
            width: MediaQuery.of(context).size.width * widthRatio,
            height: height,
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

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColorDark,
        title: Text("Discover", style: TextStyle(color: Colors.white, fontSize: 30),),
        actions: <Widget>[
        IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white,),),
        IconButton(onPressed: (){}, icon: Icon(Icons.shop, color: Colors.white,),)
      ],),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: movieType.length,
                    itemBuilder: (BuildContext context, index){
                    return  index == 0 ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.amber,
                      ),
                      height: 40,
                        width: 100,

                        child: Center(child: Text(movieType[index], style: TextStyle(color: Colors.white,fontSize: 20),))
                    )
                    :Container(
                        height: 40,
                        width: 100,
                        child: Center(child: Text(movieType[index], style: TextStyle(color: Colors.white54,fontSize: 20),))
                    )
                    ;
                    }),
              ),

              Row(
                children: <Widget>[
                  //grid view button
                  IconButton(icon: Icon(Icons.grid_on, color: isGrid ? Colors.amber : Colors.white,),onPressed: (){
                    setState(() {
                      isGrid = true;
                    });
                  },),

                  //list view button
                  IconButton(icon: Icon(Icons.list, color:!isGrid ? Colors.amber :  Colors.white,),onPressed: (){
                    setState(() {
                      isGrid = false;
                    });
                  },),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),

          //Grid item display
          Expanded(
            child: Container(
              child: isGrid ? GridView.builder(itemCount: movieType.length + 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ), itemBuilder: (BuildContext context, index){
                return productBox(0.45, 200);
              })
                  :
              ListView.builder(
                itemCount: movieType.length + 5,
                  itemBuilder: (BuildContext context, index){
                return Container(
                    width: 200,
                    child: Center(child: productBox(0.8, 400))
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
