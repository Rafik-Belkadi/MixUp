import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tinder_linkedin/RestaurantDetail.dart';
import 'package:tinder_linkedin/utils/BeautytextField.dart';
import 'package:undraw/undraw.dart';
import 'HomeAsList.dart';
import 'Model/Restaurant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var myGreen = Color(0xFF08A197);
    var myOrange = Color(0xFFF19E06);
    var myGrey = Color(0xFFA9A9A9);
    var myBrown = Color(0xFF743015);

    Restaurant rest = new Restaurant(
        name: 'Le delice',
        id: 1,
        address: 'Dely Ibrahim',
        imageUrl: 'assets/img/rest.jpg',
        phone: "0776 58 45 25",
        price: '1k-2k',
        description:
            "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ");
    List<Widget> myPins = [];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(leading: Icon(Icons.favorite), title: Text('This is an interest of mine'),),
            ListTile(leading: Icon(Icons.favorite), title: Text('This is an interest of mine'),),
            ListTile(leading: Icon(Icons.favorite), title: Text('This is an interest of mine'),),
            ListTile(leading: Icon(Icons.favorite), title: Text('This is an interest of mine'),),
            ListTile(leading: Icon(Icons.favorite), title: Text('This is an interest of mine'),),
          ],
        ),
      ),
      key: _scaffoldKey,
      backgroundColor: myOrange,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/img/wave.png', color: myBrown),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  child: Icon(Icons.menu, color: myGrey),
                  backgroundColor: Colors.white,
                ),
                BeautyTextfield(
                  cornerRadius: BorderRadius.circular(40),
                  backgroundColor: Colors.white,
                  accentColor: myGreen,
                  textColor: Colors.white,
                  width: 300,
                  height: 60,
                  duration: Duration(milliseconds: 300),
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.search, color: myGrey),
                  placeholder: "Want something ?",
                  onTap: () {
                    print('Click');
                  },
                  onChanged: (text) {
                    print(text);
                  },
                  onSubmitted: (data) {
                    setState(() {
                      myPins.add(new MyPin(
                        title: data,
                      ));
                      navigateToHomeList(myPins);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myPins.length,
                itemBuilder: (BuildContext context, int index) {
                  return myPins[index];
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                padding: EdgeInsets.only(left: 10, right: 10),
                // Generate 100 widgets that display their index in the List.
                children: List.generate(100, (index) {
                  return Center(
                      child: GestureDetector(
                    onTap: () => navigateDetails(rest),
                    child: Container(
                      height: 500.0,
                      width: 180,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 100,
                                width: 180,
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.asset(
                                    rest.imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                rest.name,
                                style: TextStyle(color: myGrey, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                rest.description,
                                style: TextStyle(color: myGrey, fontSize: 12),
                                maxLines: 3,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                }),
              ),
            ),
          ]),
    );
  }

  navigateDetails(Restaurant rest) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RestaurantDetails(
            id: rest.id,
            name: rest.name,
            address: rest.address,
            phone: rest.phone,
            price: rest.price,
            imageUrl: rest.imageUrl,
            description: rest.description)));
  }

  navigateToHomeList(List<Widget> list) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePageList(
              mypins: list,
            )));
  }
}

class MyPin extends StatelessWidget {
  final String title;
  const MyPin({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myGreen = Color(0xFF08A197);

    return Container(
      margin: EdgeInsets.all(8.0),
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Row(
        children: <Widget>[
          SizedBox(
            width: 5,
          ),
          Text(
            this.title,
            style: TextStyle(color: myGreen, fontSize: 13),
          ),
          IconButton(
            icon: Icon(
              Icons.clear,
              color: myGreen,
              size: 15,
            ),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
