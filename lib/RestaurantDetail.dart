import 'package:flutter/material.dart';


class RestaurantDetails extends StatelessWidget {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String price;
  final String imageUrl;
  final String description;
  final Color myColor;
  const RestaurantDetails({Key key, this.id, this.name, this.address, this.phone, this.price, this.imageUrl, this.description, this.myColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF19E06),
        title: Text(this.name, style: TextStyle(color: Colors.white, fontSize: 24),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(this.imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                Text(this.name, style: TextStyle(fontSize: 24)),
                Row(children: <Widget>[
                  Icon(Icons.location_on),
                  Text(this.address, style: TextStyle(fontSize: 16)),
                ],),
                SizedBox(height: 20,),
                Text(this.description, style: TextStyle(fontSize: 16),)
              ],
            ),
          )

        ],
      ),
    );
  }
}