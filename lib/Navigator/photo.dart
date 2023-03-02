import 'package:baby/generated/assets.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    List<Widget> image=[
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg9),
          fit: BoxFit.fitHeight,
          height: double.infinity,),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg10),
          fit: BoxFit.fitHeight,
          height: double.infinity,),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg11),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg4),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg5),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg6),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg7),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg8),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(image: AssetImage(Assets.imageImg12),
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView(
          controller: controller,
          children: image,
        ),
      ),

    );
  }
}
