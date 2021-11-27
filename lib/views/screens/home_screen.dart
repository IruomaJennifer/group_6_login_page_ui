import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
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
                          child: Center(
                            child: Text(
                              'Food Is Ready!',
                              style: TextStyle(
                                  color: Colors.amber[800],
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))))
            ]));
  }
}
