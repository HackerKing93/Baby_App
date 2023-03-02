import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: SettingScreen.themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const Mode(),
          );
        });
  }
}

class Mode extends StatefulWidget {
  const Mode({Key? key}) : super(key: key);

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: IconButton(
            icon: Icon(SettingScreen.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,size: 60.0,),
            onPressed: () {
              SettingScreen.themeNotifier.value =
                  SettingScreen.themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
            },
          ),
        ),
        const SizedBox(height: 30,),
        Text(SettingScreen.themeNotifier.value == ThemeMode.light? 'Mode Light': 'Mode Dart',
          style:  Theme.of(context).textTheme.headline3,
        ),
      ],
    ));
  }
}


// IconButton(
// icon: Icon(SettingScreen.themeNotifier.value == ThemeMode.light?Icons.dark_mode:Icons.light_mode),
// onPressed: (){
// SettingScreen.themeNotifier.value = SettingScreen.themeNotifier.value == ThemeMode.light? ThemeMode.dark: ThemeMode.light;
//
// },
// ),


