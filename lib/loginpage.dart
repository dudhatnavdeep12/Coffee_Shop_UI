import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String uname = "";
  String pass = "";
  int count, index, temp;

  bool permission = true;
  IconData _eye = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(
          "Login Page",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: AssetImage("assets/gladys-arivia-qjs4Gp2RRAI-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Form(
            key: _loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 200,
                    width: 200,
                    // alignment: Alignment.topCenter,
                    image: AssetImage('assets/logo5.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.pink,
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    cursorHeight: 30,
                    cursorWidth: 2,
                    controller: _unameController,
                    validator: (val) {
                      if (val.length < 6) {
                        return "Enter your Username";
                      } else if (val == null ||
                          val == "" ||
                          val.isEmpty == true) {
                        return "Enter any Username";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        uname = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                      helperText:
                          "For Example, Enter your Username OR Email Address",
                      icon: Icon(
                        Icons.people_alt,
                        color: Colors.brown,
                        size: 30,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown, width: 2),
                      ),
                      hintText: "Enter Your Username",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      helperStyle: TextStyle(color: Colors.black),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.pink,
                    cursorHeight: 30,
                    cursorWidth: 2,
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    controller: _passController,
                    obscureText: permission,
                    validator: (val) {
                      if (val.length < 6) {
                        return "Enter your Password";
                      } else if (val == null ||
                          val == "" ||
                          val.isEmpty == true) {
                        return "Enter any Password";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        pass = val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      helperText: "For Example, Enter your Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown, width: 2),
                      ),
                      icon: Icon(
                        Icons.vpn_key,
                        size: 30,
                        color: Colors.brown,
                      ),
                      hintText: "Enter Your Password",
                      suffix: InkWell(
                        child: Icon(_eye),
                        onTap: () {
                          setState(() {
                            if (permission == true) {
                              permission = false;
                              _eye = Icons.visibility;
                            } else {
                              permission = true;
                              _eye = Icons.visibility_off;
                            }
                          });
                        },
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red),
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      helperStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    color: Color(0xff774936),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      count = 0;
                      index = 0;
                      if (_loginFormKey.currentState.validate()) {
                        _loginFormKey.currentState.save();
                        Data.l.forEach((element) {
                          index++;
                          if (uname == element.uname &&
                              pass == element.password) {
                            temp = index - 1;
                            count++;
                          }
                        });
                        if (count > 0) {
                          Navigator.of(context).pushNamed("/", arguments: temp);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("User Doesn't exist.."),
                                );
                              });
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Need An Account ?",
                        style: TextStyle(
                          // fontFamily: "varela",
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("signuppage/");
                        },
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            // fontFamily: "varela",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
