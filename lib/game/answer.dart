import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'quiz.dart';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:mobile/game/reading.dart';
import 'package:get/get.dart';
import 'levels.dart';

dynamic answer;

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
      home: Answer(1, 1),
    );
  }
}

class Answer extends StatefulWidget {
  final int section;
  final int id;

  Answer(this.section, this.id);
  @override
  State<Answer> createState() => _AnswerState();
}

List shuffle(List array) {
  var random = Random(); //import 'dart:math';
  answer = array[0];
  // Go through all elementsof list
  for (var i = array.length - 1; i > 0; i--) {

    // Pick a random number according to the lenght of list
    var n = random.nextInt(i + 1);
    var temp = array[i];
    array[i] = array[n];
    array[n] = temp;
  }
  return array;
}

class _AnswerState extends State<Answer> {
  bool isPlaying = false;
  final controller = ConfettiController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  dynamic user;
  dynamic score;
  dynamic quests;
  dynamic answers;
  dynamic finished;
  int level = 1;

  party() async {
    controller.play();
    await Future.delayed(Duration(seconds: 2));
    controller.stop();
  }

  Future<void> addScore() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      dynamic finished = prefs.getStringList('finished');
      if(finished != Characters.empty){
        print('not empty');
        if(finished.contains(widget.id.toString())){
          print('this level finished');
          print(finished);
        }else{
          print('level not finished before');
          print(finished);
          finished.add(widget.id.toString());
          print(finished);
          // prefs.setStringList(key, value)
          score += 50;
          prefs.setStringList('finished', finished);
          prefs.setInt('score', score);
        }
      } else {
        print('characters empty');
        prefs.setStringList('finished', <String>[widget.id.toString()]);
      }
    });
  }

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
    answers = quests[widget.id]['answers'];

    shuffle(answers);
    super.initState();
    controller.addListener(() {
      isPlaying = controller.state == ConfettiControllerState.playing;
    });
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    'Score: $score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              quests[widget.id]['quest'],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  fontSize:18,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 385,
                          padding: EdgeInsets.only(top:5, right: 15, left: 15),
                          child: ListView.builder(
                            itemCount: answers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(right:5, left:5, top:10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    answers[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.notoSans(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize:18,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  if(answers[index] == answer){
                                    party();
                                    addScore();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          content: Stack(
                                            children: [
                                              Positioned(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Ajoyib',
                                                      ),
                                                      InkResponse(
                                                        child: CircleAvatar(
                                                          child: Icon(Icons.navigate_next),
                                                          backgroundColor: Colors.lightGreen,
                                                        ),
                                                        onTap: () {
                                                          if(quests.length > widget.id + 1){
                                                            Get.off(() => Reading(widget.section, widget.id + 1), transition: Transition.cupertinoDialog, duration: const Duration(milliseconds: 600));
                                                          } else {
                                                            Get.off(() => Levels(widget.section, 'Travel newbie', finished), transition: Transition.leftToRight, duration: const Duration(milliseconds: 500));
                                                          }
                                                        },
                                                      )
                                                    ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    );
                                  }
                                },
                              );
                            },
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
                        },
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: false,
          blastDirection:  -pi / 2,
          blastDirectionality: BlastDirectionality.explosive,

          emissionFrequency: 0,
          numberOfParticles: 100,
          minBlastForce: 200,
          maxBlastForce: 300,
        )
      ],
    );
  }
}
