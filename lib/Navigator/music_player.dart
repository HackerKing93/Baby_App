import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:baby/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with SingleTickerProviderStateMixin{
  late AnimationController iconController;
  bool showPlay = true;
  bool showPause = false;
  bool isAnimated = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconController = AnimationController(vsync:this, duration: const Duration(milliseconds: 1000) );

    //iconController.forward();
    player.open(Audio('image/Harayako.mp3'),autoStart: false,showNotification: true,);


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  Widget circularAudioPLayer(RealtimePlayingInfos realtimePlayingInfos, double screenWidth){
    Color primaryColor = const Color(0xff2f6f88) ;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 80,),
        CircularPercentIndicator(
          radius: screenWidth/3,
          backgroundColor: primaryColor,
          progressColor: Colors.white,
          percent: realtimePlayingInfos.currentPosition.inSeconds/realtimePlayingInfos.duration.inSeconds,
          lineWidth: 12,
          center: AnimatedRotation(
              turns: realtimePlayingInfos.currentPosition.inSeconds/realtimePlayingInfos.duration.inSeconds,
              duration: const Duration(seconds: 1),
              child: const CircleAvatar(backgroundImage: AssetImage(Assets.imageImg4),radius: 125,)),

        ),
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () { Reverse();  },
              icon:const Icon(CupertinoIcons.backward_fill),
              iconSize: 30,
            color: Colors.white,),
            const SizedBox(width: 7,),
            InkWell(
                onTap: (){
                  player.seekBy(const Duration(seconds: -10));
                },
                child: const Icon(CupertinoIcons.backward_end_alt,color: Colors.white,),),
            const SizedBox(width: 7,),
            GestureDetector(
              onTap: (){
                AnimationIcon();
              },
              child: AnimatedIcon(
                  size: 50,
                  icon: AnimatedIcons.play_pause,
                  progress: iconController,
                color: Colors.white,

              ),
            ),
            const SizedBox(width: 7,),
            InkWell(
              onTap: (){
                player.seekBy(const Duration(seconds: 10));
              },
              child: const Icon(CupertinoIcons.forward_end_alt,color: Colors.white,),),
            const SizedBox(width: 7,),
            IconButton(
              onPressed: () {
                Next();
                },
              icon:const Icon(CupertinoIcons.forward_fill),
              iconSize: 30,
            color: Colors.white,),
          ],
        ),
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/img.png'),
            fit: BoxFit.cover
          )
        ),
        alignment: Alignment.center,
        child: player.builderRealtimePlayingInfos(builder: (context, realtimePlayingInfos){
          if ( realtimePlayingInfos!= null){
            return circularAudioPLayer(realtimePlayingInfos, MediaQuery.of(context).size.width);
          }
          else{
            return Container();
          }
        }),
      ),
    );
  }

  void AnimationIcon(){
   setState(() {
     isAnimated = !isAnimated;

     if(isAnimated){
       iconController.forward();
       player.play();
     }else{
       iconController.reverse();
       player.pause();
     }
   });
  }


  void Play(){
    setState(() {
      showPause = true;
      iconController.forward();
    });
  }

  void Pause(){
    setState(() {
      showPlay = true;
      iconController.reverse();
    });
  }
  void Next(){
    setState(() {
      player.open(Audio('image/5_55.mp3'),showNotification: true,);
    });
  }
  void Reverse(){
    setState(() {
      player.open(Audio('image/Dhokabaj.mp3'),showNotification: true,);
    });
  }

}




// CircularPercentIndicator(
// radius: screenWidth/3,
// backgroundColor: primaryColor,
// progressColor: Colors.white,
// percent: realtimePlayingInfos.currentPosition.inSeconds/realtimePlayingInfos.duration.inSeconds,
//
// ),