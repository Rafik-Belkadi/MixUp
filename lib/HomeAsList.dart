import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tinder_linkedin/RestaurantDetail.dart';
import 'package:tinder_linkedin/utils/BeautytextField.dart';
import 'package:undraw/undraw.dart';
import 'Home.dart';
import 'Model/Restaurant.dart';

class HomePageList extends StatelessWidget {
  final List<Widget> mypins;
  HomePageList({Key key, this.mypins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myGreen = Color(0xFF08A197);
    var myOrange = Color(0xFFF19E06);
    var myRed = Color(0xFFD75227);
    var myGrey = Color(0xFFA9A9A9);
    var myBrown = Color(0xFF743015);

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

    Restaurant rest = new Restaurant(
        name: 'Le delice',
        id: 1,
        address: 'Dely Ibrahim',
        imageUrl: 'assets/img/rest.jpg',
        phone: "0776 58 45 25",
        price: '1k-2k',
        description:
            "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ");
    return Scaffold(
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
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: myGrey),
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
                    print(data);
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
                itemCount: this.mypins.length,
                itemBuilder: (BuildContext context, int index) {
                  return this.mypins[index];
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 150,
                      child: GestureDetector(
                        onTap: () => navigateDetails(rest),
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 300,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(rest.imageUrl,), fit: BoxFit.fill)
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rest.name,
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        Text(
                                          'Something realy interesting',
                                          style: TextStyle(
                                              fontSize: 12, color: myRed),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40, left: 70),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    color: myRed,
                                                  ),
                                                  child: Text(
                                                    'Closed',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  )),
                                              FlatButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Rating',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: myRed),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ])),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ]),
    );
  }
}
