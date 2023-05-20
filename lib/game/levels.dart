import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Home.dart';
import 'package:mobile/game/reading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'quiz.dart';
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
    );
  }
}

class Levels extends StatefulWidget {
  final int section;
  final String title;
  final List finished;
  Levels(this.section, this.title, this.finished);
  @override
  State<Levels> createState() => _LevelsState(finished);
}

class _LevelsState extends State<Levels> {
  final List finished;
  _LevelsState(this.finished);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  dynamic user;
  dynamic score;
  dynamic quests;
  int level = 1;
  Future<void> getUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      score = prefs.getInt('score');
      user = prefs.getString('user');
    });
  }

  Future<bool> _onWillPop() async{
    Get.off(() => MyHomePage(), transition: Transition.leftToRightWithFade, duration: const Duration(milliseconds: 500));
    return false;
  }

  @override
  void initState(){
    quests = myQuest(widget.section);
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg/bg2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 90,
                color: const Color.fromARGB(50, 255, 255, 255),
                child: Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 90,
                child: ListView.builder(
                  itemCount: quests.length,
                  itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  (widget.finished.contains(quests[index]['id'].toString())) ? Colors.lightGreen : Colors.blueAccent,
                                  Colors.cyan.shade200,
                                ]
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(top: 7, left: 7),
                                child: Text(
                                  quests[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        Get.to(() => Reading(widget.section, index), transition: Transition.cupertinoDialog, duration: const Duration(milliseconds: 600));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

