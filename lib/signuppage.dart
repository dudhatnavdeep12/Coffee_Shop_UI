import 'package:coffee_shop_project/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    ),
  );
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _unamecontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();

  String uname = "";
  String pass = "";
  int count, index;

  bool permission = true;
  IconData _eye = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage("assets/stefan-kunz-6VeIwIf3c_g-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formkey,
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
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorHeight: 30,
                    cursorWidth: 2,
                    // cursorRadius: Radius.circular(100),
                    controller: _unamecontroller,
                    validator: (val) {
                      if (val.length < 6) {
                        return "Enter Correct type username";
                      } else if (val == null ||
                          val == "" ||
                          val.isEmpty == true) {
                        return "Enter any username";
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red),
                      hintText: "Enter Your Username",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      helperStyle: TextStyle(color: Colors.black),
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
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _passcontroller,
                    obscureText: permission,
                    validator: (val) {
                      if (val.length < 6) {
                        return "Enter At least 6 Digit password";
                      } else if (val == null ||
                          val == "" ||
                          val.isEmpty == true) {
                        return "Enter any password";
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
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.brown,
                        size: 30,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown, width: 2),
                      ),
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
                      helperStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: "Enter Your Password",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    color: Color(0xff774936),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      count = 0;
                      if (_formkey.currentState.validate()) {
                        _formkey.currentState.save();
                        index = 0;
                        Data.l.forEach(
                          (element) {
                            index++;
                            if (uname == element.uname &&
                                pass == element.password) {
                              count++;
                            }
                          },
                        );
                        if (count == 0) {
                          Data.l.add(Data(uname: uname, password: pass));
                          _formkey.currentState.reset();
                          Navigator.of(context)
                              .pushNamed("loginpage/", arguments: index);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("User alredy exist"),
                              );
                            },
                          );
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
                        "Do You Have An Account ?",
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
                          Navigator.of(context).pushNamed("loginpage/");
                        },
                        child: Text(
                          "LogIn",
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
