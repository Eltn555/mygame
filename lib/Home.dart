import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile/game/levels.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  dynamic user;
  dynamic score;
  dynamic finished;
  Future<void> getUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      score = prefs.getInt('score');
      user = prefs.getString('user');
      finished = prefs.getStringList('finished');
      if(finished == null) {
        prefs.setStringList('finished', <String>['a']);
        finished = prefs.getStringList('finished');
      }
    });
  }

  @override
  void initState(){
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(right: 15, left: 15),
        decoration: const BoxDecoration(
          color: Colors.white12,
        ),
        child: ListView(
          children:[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black12, style: BorderStyle.solid,)
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.settings_sharp),
                      iconSize: 25,
                      color: Colors.black45,
                      onPressed: () {
                        print('hey');
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width - 85,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.monetization_on),
                          onPressed: (){},
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "$score",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize:25,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child:Text(
                        textAlign: TextAlign.left,
                        "Let`s Play $user",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.pinkAccent,
                            fontSize:40,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        "Be the first!",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize:15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 165,
                      margin: const EdgeInsets.only(top:10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.pinkAccent,
                              Colors.redAccent
                            ]
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 2)
                              ),
                              child: const Icon(Icons.done, size: 25, color: Colors.white,),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child:Text(
                              'level 1',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize:25,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            alignment: Alignment.topLeft,
                            child:Text(
                              'Travel newbie',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize:35,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Get.off(() => Levels(1, 'Travel newbie', finished), transition: Transition.cupertino, duration: const Duration(milliseconds: 500));
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 165,
                      margin: const EdgeInsets.only(top:30),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.shade800,
                              Colors.lightBlueAccent.shade100,
                            ]
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 2)
                              ),
                              child: const Icon(Icons.done, size: 25, color: Colors.white,),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child:Text(
                              'level 2',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize:25,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            alignment: Alignment.topLeft,
                            child:Text(
                              'Continuing',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize:35,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Get.off(() => Levels(2, 'Continuing', finished), transition: Transition.cupertino, duration: const Duration(milliseconds: 500));
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 175,
                      margin: const EdgeInsets.only(top:30),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.deepPurpleAccent,
                              Colors.pink.shade100
                            ]
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 2)
                              ),
                              child: const Icon(Icons.done, size: 25, color: Colors.white,),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child:Text(
                              'level 3',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize:25,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            alignment: Alignment.topLeft,
                            child:Text(
                              'Experienced',
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize:35,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Get.off(() => Levels(3, 'Experienced', finished), transition: Transition.cupertino, duration: const Duration(milliseconds: 500));
                    },
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
