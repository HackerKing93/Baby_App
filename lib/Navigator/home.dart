import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var imageUrl = 'https://images.pexels.com/photos/1973270/pexels-photo-1973270.jpeg?auto=compress&cs=tinysrgb&w=400';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
          SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontFamily: 'Bobbers',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('You know you’re in love when you can’t fall asleep because reality is finally better than your dreams.'),
                TyperAnimatedText('Take my hand, take my whole life too. For I can’t help falling in love with you.',),
                TyperAnimatedText('I need you like a heart needs a beat'),
                TyperAnimatedText('I have found the one whom my soul loves',),
              ],
              onTap: () {
              },
            ),
          ),
        ),
        const SizedBox(height: 70,),
        SizedBox(
          width: 250.0,
          child: TextLiquidFill(
            text: 'LOVE YOU♡',
            waveColor: Colors.red,
            waveDuration: const Duration(seconds: 1),
            loadDuration: const Duration(seconds: 10),
            boxBackgroundColor: const Color(0xFF5858C4),
            textStyle: const TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
        ),
            //Image.network(imageUrl,fit: BoxFit.cover,height: 450,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () async {
        int location = WallpaperManager.BOTH_SCREEN;
        var file = await DefaultCacheManager().getSingleFile(imageUrl);
        bool result = await WallpaperManager.setWallpaperFromFile(file.path, location); //provide image path
      },
          label: const Icon(Icons.wallpaper)),

    );
  }
}
