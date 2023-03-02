import 'package:baby/video_list/videoFour.dart';
import 'package:baby/video_list/videoTwo.dart';
import 'package:baby/video_list/video_one.dart';
import 'package:flutter/material.dart';
import '../video_list/video_demo.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    List<Widget> image=[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: VideoDemo(),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const VideoOne(),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const VideoTwo(),
      ),
      Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const VideoFour(),
      ),

    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView(
          children: image,
          controller: controller,
          scrollDirection: Axis.vertical,
        ),
      ),

    );
  }
}
