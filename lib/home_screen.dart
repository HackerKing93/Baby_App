import 'package:baby/Navigator/about.dart';
import 'package:baby/Navigator/home.dart';
import 'package:baby/Navigator/music_player.dart';
import 'package:baby/Navigator/photo.dart';
import 'package:baby/Navigator/secret.dart';
import 'package:baby/Navigator/setting.dart';
import 'package:baby/Navigator/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';


class HomeScreen extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
const primaryColor = Color(0xFFAB9435);
const canvasColor = Color(0x2FDAC017);
const scaffoldBackgroundColor = Color(0xFF5858C4);
class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
          builder: (context) {
            final isSmallScreen = MediaQuery.of(context).size.width < 600;
            return Scaffold(
                key: _key,
                appBar: isSmallScreen ? AppBar(
                  title: const Text('Baby'),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: (){
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ): null,
                drawer: SideBarXExample(controller: _controller,),
                body: Row(
                  children: [
                    if(!isSmallScreen) SideBarXExample(controller: _controller),
                    Expanded(child: Center(child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context,child){
                        switch(_controller.selectedIndex){
                          case 0: _key.currentState?.closeDrawer();
                          return const Home();
                          case 1: _key.currentState?.closeDrawer();
                          return const PhotoScreen();
                          case 2: _key.currentState?.closeDrawer();
                          return  VideoScreen();
                          case 3: _key.currentState?.closeDrawer();
                          return const MusicPlayer();
                          case 4: _key.currentState?.closeDrawer();
                          return const SecretScreen();
                          case 5: _key.currentState?.closeDrawer();
                          return const SettingScreen();
                          case 6: _key.currentState?.closeDrawer();
                          return const AboutScreen();
                          default:
                            return const Home();
                        }
                      },
                    ),))
                  ],
                )
            );
          }
      ),
    );
  }
}
class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller}) : _controller = controller,super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme:  const SidebarXTheme(
        decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(
          width: 250
      ),
      footerDivider: Divider(color:  Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context,extended){
        return const  SizedBox(
          height: 120,
          child:CircleAvatar(
            backgroundColor: Colors.black,
            radius: 70,
            child: CircleAvatar(
              backgroundImage: AssetImage('image/img_6.png'),
              radius: 55,
            ),
          ),                                   //Icon(Icons.person,size: 60,color: Colors.white,),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Home',),
        SidebarXItem(icon: Icons.photo, label: 'Photo'),
        SidebarXItem(icon: Icons.video_call, label: 'Video'),
        SidebarXItem(icon: Icons.music_video, label: 'Music'),
        SidebarXItem(icon: Icons.security_rounded, label: 'Secrate'),
        SidebarXItem(icon: Icons.settings, label: 'Settings'),
        SidebarXItem(icon: Icons.info, label: 'About'),
      ],
    );
  }
}
