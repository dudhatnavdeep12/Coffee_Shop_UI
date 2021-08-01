import 'dart:io';

import 'package:coffee_shop_project/description.dart';
import 'package:coffee_shop_project/details_udf.dart';
import 'package:coffee_shop_project/loginpage.dart';
import 'package:coffee_shop_project/signuppage.dart';
import 'package:coffee_shop_project/temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash/',
      routes: {
        '/': (context) => MyHomePage(),
        'splash/': (context) => Splash(),
        'signuppage/': (context) => SignupPage(),
        'loginpage/': (context) => LoginPage(),
        'info/': (context) => Info(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfffcd5ce),
            ),
            padding: EdgeInsets.all(7),
            child: Column(
              children: [
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome, Miss Sujata',
                      style: TextStyle(
                        fontFamily: 'varela',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF473D3A),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage('assets/model.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(right: 45.0),
                  child: Container(
                    child: Text(
                      'Let\'s select the best taste for your next coffee break! In the Coffee Adda.',
                      style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff774936),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taste of the week',
                      style: TextStyle(
                        fontFamily: 'varela',
                        fontSize: 17.0,
                        color: Color(0xFF473D3A),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'varela',
                          fontSize: 15.0,
                          color: Color(0xff8a5a44),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 430,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // scrollDirection: Axis.horizontal,
                      children: [
                        Coffeelist(
                          imgPath: 'assets/star.png',
                          coffeeName: 'CAFFÈ MOCHA',
                          shopName: 'StarBuck',
                          description:
                              'Our dark, rich espresso balanced with steamed milk and a light layer of foam',
                          price: '\$4.99',
                        ),
                        Coffeelist(
                          imgPath: 'assets/star.png',
                          coffeeName: 'CAFFÈ LATTE',
                          shopName: 'The Steam Room',
                          description:
                              'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk',
                          price: '\$3.99',
                        ),
                        Coffeelist(
                          imgPath: 'assets/star.png',
                          coffeeName: 'CAFÈ AU LAIT',
                          shopName: 'The Coffee Adda',
                          description:
                              'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk',
                          price: '\$5.99',
                        ),
                        Coffeelist(
                          imgPath: 'assets/star.png',
                          coffeeName: 'CAPPUCCINO',
                          shopName: 'Coffee Culture',
                          description:
                              'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk',
                          price: '\$9.99',
                        ),
                        Coffeelist(
                          imgPath: 'assets/star.png',
                          coffeeName: 'AFFOGATO',
                          shopName: 'Rojo’s Roastery',
                          description:
                              'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk',
                          price: '\$8.99',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Explore nearby',
                      style: TextStyle(
                          fontFamily: 'varela',
                          fontSize: 17.0,
                          color: Color(0xFF473D3A)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'See All',
                        style: TextStyle(
                            fontFamily: 'varela',
                            fontSize: 15.0,
                            color: Color(0xfff8a5a44)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 130,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildImage(
                          'assets/coffee.jpg',
                          '5.99',
                          'The sensory profile of a cup of coffee varies according to a number of factors: the type and blend of coffee beans; geographical source; roasting method',
                          'CAFÈ AU LAIT',
                        ),
                        _buildImage(
                          'assets/coffee2.jpg',
                          '6.99',
                          'The sensory profile of a cup of coffee varies according to a number of factors: the type and blend of coffee beans; geographical source; roasting method',
                          'COLD BREW COFFEE',
                        ),
                        _buildImage(
                          'assets/coffee3.jpg',
                          '8.99',
                          'The sensory profile of a cup of coffee varies according to a number of factors: the type and blend of coffee beans; geographical source; roasting method',
                          'ESPRESSO CON PANNA',
                        ),
                        _buildImage(
                          'assets/coffee4.jpg',
                          '7.99',
                          'The sensory profile of a cup of coffee varies according to a number of factors: the type and blend of coffee beans; geographical source; roasting method',
                          'FRAPPÉ',
                        ),
                        _buildImage(
                          'assets/coffee5.jpg',
                          '3.99',
                          'The sensory profile of a cup of coffee varies according to a number of factors: the type and blend of coffee beans; geographical source; roasting method',
                          'ICED MOCHA',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildImage(String imgPath, String _price, String _des, String _name) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return Info(
              img1: imgPath,
              price: _price,
              des: _des,
              i: _name,
            );
          }),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Container(
          height: 200,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
