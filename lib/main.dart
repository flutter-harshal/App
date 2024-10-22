import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestion = [
    {
      "qustion": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elone Musk"],
      "correctAnswer": 1
    },
    {
      "qustion": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elone Musk"],
      "correctAnswer": 2
    },
    {
      "qustion": "Who is the founder of Tesla?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elone Musk"],
      "correctAnswer": 3
    },
    {
      "qustion": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elone Musk"],
      "correctAnswer": 0
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int currentScore = 0;
  bool questionPage = false;

  MaterialStateProperty<Color?> checkAnswer(int answerIndex) {
    print("answerIndex : $answerIndex");
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestion[currentQuestionIndex]["correctAnswer"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      }
      {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Widget isQuestionScreen() {
    if (questionPage == false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   width: 130,
                // ),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestion.length}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 100,
            ),
            SizedBox(
              height: 50,
              // width: 350,
              child: Text(
                allQuestion[currentQuestionIndex]["qustion"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 850,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 0;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "A. ${allQuestion[currentQuestionIndex]["options"][0]}",
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 850,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 1;
                      setState(() {});
                    }
                  },
                  child: Text(
                      "B. ${allQuestion[currentQuestionIndex]["options"][1]}")),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 850,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 2;
                      setState(() {});
                    }
                  },
                  child: Text(
                      "C. ${allQuestion[currentQuestionIndex]["options"][2]}")),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 850,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(3),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 3;
                      setState(() {});
                    }
                  },
                  child: Text(
                      "D. ${allQuestion[currentQuestionIndex]["options"][3]}")),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (currentQuestionIndex < allQuestion.length - 1) {
            // if (selectedAnswerIndex != -1) {
            //   if (currentQuestionIndex < allQuestion.length - 1) {
            //     currentQuestionIndex++;
            //   } else {
            //     questionPage = false;
            //   }
            //   selectedAnswerIndex = -1;
            //   setState(() {});
            // }
            /// SHOW next question
            if (selectedAnswerIndex != -1) {
              if (selectedAnswerIndex ==
                  allQuestion[currentQuestionIndex]['correctAnswer']) {
                currentScore++;
              }
              if (currentQuestionIndex < allQuestion.length - 1) {
                //check score

                print("Show next Question");
                currentQuestionIndex++;
                print("Current Question Index : $currentQuestionIndex");

                selectedAnswerIndex = -1;
                print("Selected Answer Index : $selectedAnswerIndex");
                setState(() {});
              } else {
                print("Answer Not Selected");
                questionPage = true;
                setState(() {});
              }
            } else {
              print("End Of Question");
            }

            // }
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
            size: 30,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Result App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://tse2.mm.bing.net/th?id=OIP.mHHBoJf7UsPMv9zYB6kUKQHaHL&pid=Api&P=0&h=180",
                  height: 200),
              const SizedBox(
                child: Text(
                  "Congratulations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                child: Text("Score : $currentScore/${allQuestion.length}"),
              )
            ],
          ),
        ),
      );
    }
  }
}
