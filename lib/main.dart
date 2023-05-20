import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Home.dart';
import 'package:mobile/register.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(title: 'Game'),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.title});
  final String title;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  dynamic user;

  Future<void> getUserData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      user = prefs.getString('user');
    });
  }

  @override
  void initState(){
    super.initState();
    getUserData();
    Future.delayed(const Duration(seconds: 4)).then((value){
      if(user != null){
        Get.off(() => MyHomePage(), transition: Transition.downToUp, duration: const Duration(milliseconds: 750));
      }  else{
        Get.off(() => Register(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 750));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/splash.jpg'),
          fit: BoxFit.cover,
        ),
        color: Colors.blue,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        padding: EdgeInsets.only(left: 20, right: MediaQuery.of(context).size.width/4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 0,
              width: 0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/bg/bg2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: 0,
                width: 0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/bg/bg3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: 0,
                  width: 0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/bg/bg4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: 0,
                    width: 0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/bg/bg2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DefaultTextStyle(
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize:40,
                  height: 1,
                  decoration: TextDecoration.none,
                ),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText("LEARN"),
                  WavyAnimatedText("PLAY"),
                ],
              ),
            ),
            DefaultTextStyle(
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize:20,
                  decoration: TextDecoration.none,
                ),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Kim ilm yo‘lini tutsa, Alloh uni jannat yo‘liga yo‘llab qo‘yadi',
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
          ],
        )
      ),
    );
  }
}