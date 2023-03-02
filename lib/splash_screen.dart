import 'dart:async';
import 'package:baby/home_screen.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    });
  }
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return const Scaffold(
      body: Image(image: AssetImage('image/img_9.png'),
      fit: BoxFit.fitHeight,
      height: double.infinity,),

    );

  }
}
