import 'dart:async';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final Uri url = Uri.parse("https://www.tiktok.com/@aayushacharya18");
  final Uri url1 = Uri.parse("https://www.facebook.com/aayush.acharya37853?mibextid=ZbWKwL");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text('Created By:',
                    style: TextStyle(fontSize: 30,
                        fontStyle: FontStyle.italic),),
                  SizedBox(width: 10,),
                  Text('Aayush Acharya',
                    style: TextStyle(fontSize: 25,
                        fontStyle: FontStyle.italic),),
                ],
              ),
              const SizedBox(height: 25,),
              const Text('Follow me on....',style: TextStyle(fontSize: 30,
                  fontStyle: FontStyle.italic,color: Colors.lightBlue),),
              Row(
                children: [
                  AnimatedIconButton(
                    size: 100,
                    onPressed: () {
                      Timer(const Duration(seconds: 2),(){
                        print('object');
                        launchUrl(url);
                      });
                    },
                    duration: const Duration(milliseconds: 500),
                    splashColor: Colors.transparent,
                    icons: const <AnimatedIconItem>[
                      AnimatedIconItem(
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                      AnimatedIconItem(
                        icon: Icon(Icons.tiktok, color: Colors.black),

                      ),
                    ],
                  ),
                  AnimatedIconButton(
                    size: 100,
                    onPressed: () {
                      Timer(const Duration(seconds: 2),(){
                        launchUrl(url1);
                      });
                    },
                    duration: const Duration(milliseconds: 500),
                    splashColor: Colors.transparent,
                    icons: const <AnimatedIconItem>[
                      AnimatedIconItem(
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                      AnimatedIconItem(
                        icon: Icon(Icons.facebook, color: Colors.blue),
                      ),
                    ],
                  ),


                ],
              )
            ],
          )

        ),
      ),
    );
  }
}
