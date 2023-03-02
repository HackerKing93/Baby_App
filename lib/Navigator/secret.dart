import 'dart:async';

import 'package:baby/Navigator/animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../secrate_page/secret_home.dart';

class SecretScreen extends StatefulWidget {
  const SecretScreen({Key? key}) : super(key: key);

  @override
  State<SecretScreen> createState() => _SecretScreenState();
}

class _SecretScreenState extends State<SecretScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testEmail = "aayushacharya@gmail.com";
  String testPassword = "123456";
  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllController() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("idleee");
  }

  void addHandsUpController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint("hand up");
  }

  void addHandsDownController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint("hand down");
  }

  void addSuccessController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerSuccess);
    debugPrint("Success");
    Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecreteHome()));
    });
  }

  void addFailController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerFail);
    debugPrint("Fail");
  }

  void addLookRightController() {
    removeAllController();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
    debugPrint("Righttt");
  }

  void addLookLeftController() {
    removeAllController();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
    debugPrint("Leftt");
  }

  void checkForPasswordFocuseNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerLookRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);

    rootBundle.load('image/login_animation.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocuseNodeToChangeAnimationState();
  }
  //For changing screen

  // void changeScreen(){
  //   Timer(const Duration(seconds: 3), (){
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
  //   });
  // }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        addSuccessController();
        //changeScreen();
      } else {
        addFailController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: riveArtboard == null
                    ? const SizedBox.shrink()
                    : Rive(artboard: riveArtboard!),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        validator: (value) =>
                            value != testEmail ? "Wrong email" : null,
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              value.length < 16 &&
                              !isLookingLeft) {
                            addLookLeftController();
                          } else if (value.isNotEmpty &&
                              value.length > 16 &&
                              !isLookingRight) {
                            addLookRightController();
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                        focusNode: passwordFocusNode,
                        validator: (value) =>
                            value != testPassword ? "Wrong password" : null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 8,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            passwordFocusNode.unfocus;
                            validateEmailAndPassword();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
