import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/game/answer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'quiz.dart';
import 'package:get/get.dart';
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
      home: Reading(1, 1),
    );
  }
}

class Reading extends StatefulWidget {
  final int section;
  final int id;

  Reading(this.section, this.id);
  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  dynamic user;
  dynamic score;
  dynamic quests;
  dynamic finished;
  int level = 1;
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
    quests = myQuest(widget.section);
    super.initState();
    getUser();
  }

  Future<bool> _onWillPop() async{
    print('working');
    Get.off(() => Levels(widget.section, 'Travel newbie', finished), transition: Transition.leftToRight, duration: const Duration(milliseconds: 500));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/bg/bg3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 15),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: Color.fromARGB(50, 255, 255, 255),
                child: Text(
                    quests[widget.id]['title'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 170,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          quests[widget.id]['topic'],
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontSize:19,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          quests[widget.id]['extraTopic'],
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize:17,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 20, top: 10, bottom: 5),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow_rounded),
                      iconSize: 50,
                      color: Colors.white,
                      onPressed: () {
                        Get.to(() => Answer(widget.section, widget.id), transition: Transition.cupertinoDialog, duration: const Duration(milliseconds: 600));
                      },
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
