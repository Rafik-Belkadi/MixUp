import 'dart:math';

import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';
import 'Home.dart';
import 'utils/BeautytextField.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'utils/AnimatedWave.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobLess',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var myGreen = Color(0xFF08A197);
    var myOrange = Color(0xFFF19E06);
    var myRed = Color(0xFFD75227);
    var myGrey = Color(0xFFA9A9A9);
    var myBrown = Color(0xFF743015);

    navigateHome() => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: myOrange,
        body: ListView(
          children: <Widget>[
            Image.asset('assets/img/wave.png', color: myBrown),
            Padding(
              padding: EdgeInsets.only(left: 160, right: 140, top: 89),
              child:
                  Text('MixUP', style: TextStyle(fontSize: 30, color: myGreen)),
            ),
            SizedBox(height: 150,),
             Padding(
              padding: EdgeInsets.only(left: 160, right: 140),
              child:Text('Sign In', style: TextStyle(color: myRed, fontSize: 22),),
             ),
            SizedBox(height: 28,),
            
            BeautyTextfield(cornerRadius: BorderRadius.circular(40),
            margin: EdgeInsets.symmetric(horizontal: 60),
              backgroundColor: Colors.white,
              accentColor: myRed,
              textColor: myGrey,
              width: double.maxFinite,
              height: 60,
              duration: Duration(milliseconds: 300),
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.person_outline, color: myGrey),
              placeholder: "Username",
              onTap: () {
                print('Click');
              },
              onChanged: (text) {
                print(text);
              },
              onSubmitted: (data) {
                print(data.length);
              },
            ),
            SizedBox(height: 20,),
            
            BeautyTextfield(cornerRadius: BorderRadius.circular(40),
            margin: EdgeInsets.symmetric(horizontal: 60),
              backgroundColor: Colors.white,
              accentColor: myRed,
              textColor: myGrey,
              width: double.maxFinite,
              height: 60,
              duration: Duration(milliseconds: 300),
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.lock, color: myGrey),
              placeholder: "Password",
              onTap: () {
                print('Click');
              },
              onChanged: (text) {
                print(text);
              },
              onSubmitted: (data) {
                print(data.length);
              },
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(vertical: 13),
                color: myRed,
                onPressed: () => navigateHome(),
                
                child: Text('Login', style:TextStyle(fontSize: 16,color: Colors.white) ,),
              ),
            ),
            SizedBox(height: 37,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: FlatButton(onPressed: (){}, child: Text('If you\'re new, click here!', style: TextStyle(color: myGreen, fontSize: 16),)),
            )
          ],
        ));
  }
}
