import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //fire base auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isVisible = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in Page'),
        backgroundColor: Colors.amber.shade800,
      ),
      body: Stack(
          //fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: -330,
              //left: -10,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  image: DecorationImage(
                    //colorFilter: ColorFilter.mode(
                    // Colors.amber.shade800.withOpacity(1.0),
                    // BlendMode.overlay),
                    image: AssetImage("images/one.png"),
                    fit: BoxFit.none,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset("images/abby1.svg"),
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: 100,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('images/two.png'), fit: BoxFit.none),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(
                            0.1,
                            0.2,
                          ),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 18.5, right: 18.5),
                          child: TextField(
                              controller: _emailController,
                              cursorColor: Colors.grey.shade300,
                              decoration: InputDecoration(
                                  hintText: 'Enter email or username',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade300))),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 18.5, right: 18.5),
                          child: TextField(
                              obscureText: isVisible,
                              controller: _passwordController,
                              cursorColor: Colors.grey.shade300,
                              decoration: InputDecoration(
                                  counterText: 'Forgot Password?',
                                  counterStyle: TextStyle(
                                    color: Colors.amber[800],
                                  ),
                                  hintText: 'Password',
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                  ),
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade300))),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 18.5, right: 18.5),
                          child: Expanded(
                            child: GestureDetector(
                              child: Container(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'Log in',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.amber[800],
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              onTap: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    _auth.signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          Text('Incorrect Input!'),
                                    );
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 24, left: 18.5, right: 18.5, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 2.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                ),
                              ),
                              Text(
                                ' or continue with ',
                                style: TextStyle(color: Colors.grey.shade300),
                              ),
                              Expanded(
                                  child: Container(
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300))))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.5, right: 18.5, bottom: 18.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 30,
                              ),
                              Icon(
                                EvaIcons.twitter,
                                color: Colors.blue,
                                size: 30,
                              ),
                              Icon(
                                EvaIcons.google,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
