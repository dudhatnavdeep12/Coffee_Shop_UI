import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Info extends StatefulWidget {
  String i;
  String img1;
  String des;
  int q = 0;
  int r = 1;
  String price;
  double a = 0;
  var b;
  Info({this.i, this.img1, this.des, this.price});
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_back,
                            size: 40,
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Center(
                          child: Image(
                            image: AssetImage(widget.img1),
                          ),
                        ),
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                flex: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 290,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.des,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 28,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.redAccent),
                                      width: 40,
                                      height: 40,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (widget.r >= 1) {
                                          widget.r--;
                                          widget.a =
                                              double.parse(widget.price) *
                                                  widget.r;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '${widget.r}',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (widget.r >= 0) {
                                          widget.r++;
                                          widget.a =
                                              double.parse(widget.price) *
                                                  widget.r;
                                        }
                                      });
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.green),
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${widget.a}',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Color(0xff003049),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Add to cart',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
