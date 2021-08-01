import 'package:coffee_shop_project/deatails.dart';
import 'package:flutter/material.dart';

class Coffeelist extends StatefulWidget {
  String imgPath;
  String coffeeName;
  String shopName;
  String description;
  String price;
  Color _a = Colors.grey;
  Coffeelist({
    this.imgPath,
    this.coffeeName,
    this.shopName,
    this.description,
    this.price,
  });
  @override
  _CoffeelistState createState() => _CoffeelistState();
}

class _CoffeelistState extends State<Coffeelist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 410,
        width: 230,
        child: Column(
          children: [
            Stack(
              children: [
                Container(height: 335.0),
                Positioned(
                  top: 75.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 20.0),
                    height: 260.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xff774936),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          widget.shopName + '\'s',
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.coffeeName,
                          style: TextStyle(
                            fontFamily: 'varela',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                // fontFamily: 'varela',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff9c74f),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (widget._a == Colors.grey) {
                                    widget._a = Colors.red;
                                  } else {
                                    widget._a = Colors.grey;
                                  }
                                });
                              },
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: widget._a,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 70.0,
                  top: 20.0,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imgPath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Details(),
                  ),
                );
              },
              child: Container(
                height: 50.0,
                width: 225.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xFF473D3A),
                ),
                child: Center(
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
