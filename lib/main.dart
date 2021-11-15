import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          //fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
                top: -250,
                left: -10,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.amber.shade800.withOpacity(1.0),
                          BlendMode.overlay),
                      image: AssetImage("images/spaghetti.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Image(
                    image: AssetImage('images/logo.jpg'),
                  ),
                )),
            Positioned(
              top: 500,
              left: 200,
              child: Container(
                height: 470,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('images/pizza.jpg'), fit: BoxFit.cover),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
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
                              ),
                              Expanded(
                                  child: Container(
                                      height: 40,
                                      child: Center(
                                          child: Text(
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Colors.amber[800]),
                                      ))))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.5, right: 18.5),
                        child: TextField(
                            cursorColor: Colors.grey.shade300,
                            decoration: InputDecoration(
                                hintText: 'Enter email or username',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.5, right: 18.5),
                        child: TextField(
                            obscureText: true,
                            cursorColor: Colors.grey.shade300,
                            decoration: InputDecoration(
                                counterText: 'Forgot Password?',
                                counterStyle: TextStyle(
                                  color: Colors.amber[800],
                                ),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.visibility_off,
                                    size: 15,
                                  ),
                                  onPressed: () {},
                                ),
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade300))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.5, right: 18.5),
                        child: Expanded(
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 24, left: 18.5, right: 18.5, bottom: 10),
                        child: Text(
                          '------------- or continue with ------------',
                          style: TextStyle(color: Colors.grey.shade300),
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
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
