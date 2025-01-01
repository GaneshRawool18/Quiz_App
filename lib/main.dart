import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List allQuestion = [
    {
      "question":
          "Which method is used to change the state of a StatefulWidget in Flutter?",
      "option": [
        "updateState()",
        " setState()",
        "changeState()",
        "refreshState()"
      ],
      "correctOption": 1
    },
    {
      "question": "Which of the following is NOT a valid data type in Dart?",
      "option": ["int", "bool", "char", "double"],
      "correctOption": 2
    },
    {
      "question": "What is the correct way to define a function in Dart?",
      "option": [
        "func myFunction() {}",
        "void myFunction() {}",
        "def myFunction() {}",
        "function myFunction() {}"
      ],
      "correctOption": 1
    },
    {
      "question": "How do you declare a list in Dart?",
      "option": [
        "List myList = [];",
        "Array myList = [];",
        "Set myList = [];",
        "Map myList = {};"
      ],
      "correctOption": 0
    },
    {
      "question":
          "Which keyword is used to import external libraries or files in Dart?",
      "option": ["use", "include", "require", "import"],
      "correctOption": 3
    },
  ];

  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0;
 

  WidgetStateProperty <Color?> checkAnswer(int answerIndex){

    if (selectedAnswerIndex != -1){
      if(answerIndex == allQuestion[questionIndex]["correctOption"]){
      return const WidgetStatePropertyAll(Color.fromARGB(255, 8, 241, 15));
      }else if (selectedAnswerIndex == answerIndex){
        return const WidgetStatePropertyAll(Color.fromARGB(255, 243, 24, 12));
      }
      else{
        return const WidgetStatePropertyAll(null);

      }
    }else{
      return const WidgetStatePropertyAll(null);
    }
  }

  bool questionPage = true ;
  
  bool isQuizStarted = false;  

  bool reAttempted = false;
  int reAttempt = 0;

  @override
  Widget build(BuildContext context) {
    return isQuizStarted ? isQuestionScreen() : startScreen();  
  }

 
  Scaffold startScreen() {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 245, 214, 233),
      body: Center(
        
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            Image.network("https://www.sankara.ac.in/science-and-commerce/wp-content/uploads/2022/12/QUIZ-Image-01-01.png",
              height: 300,
              width: 400,
              ),
            const Text(
              "Welcome to the Quiz App!",
              
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isQuizStarted = true;  // Start the quiz
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 34, 62, 245),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Start Quiz",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Scaffold isQuestionScreen(){
    if (questionPage == true){
      return Scaffold(
       backgroundColor: const Color.fromARGB(255, 224, 247, 250),
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 36, 128, 219), 
      ),
      body: Center (
        child: Column(
        children: [
          const SizedBox(
            height: 50,
            width: 20,
          ),
          Row(
            children: [
              const SizedBox(
               
                width: 20,
              ),
              Text(
                "Question: ${questionIndex + 1} / ${allQuestion.length}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            const SizedBox(width: 15,),
          SizedBox(
            height: 100,
            width: 380,
            
            child: Text(
              allQuestion[questionIndex]["question"],
              
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ],),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            width: 375,
            child: ElevatedButton(
              
              style : ButtonStyle(
                backgroundColor: checkAnswer(0) ,
                
              ),
              onPressed: (){
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex=0;
                  setState(() {});
                }
            },
              child: Text(
                "A) ${allQuestion[questionIndex]["option"][0]}",
                style: const TextStyle(
                  
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
           
           
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            width: 375,
            child: ElevatedButton(
              style : ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: (){
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex=1;
                  setState(() {});
                }
            },
              
              
              child: Text(
                "B)  ${allQuestion[questionIndex]["option"][1]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            width: 375,
            child: ElevatedButton(
              style : ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: (){
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex=2;
                  setState(() {});
                }
            },
              
              
              child: Text(
                "C) ${allQuestion[questionIndex]["option"][2]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            width: 375,
            child: ElevatedButton(
              style : ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: (){
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex=3;
                  setState(() {});
                }
            },
              
              
              child: Text(
                "D) ${allQuestion[questionIndex]["option"][3]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      ),

      floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(selectedAnswerIndex != -1){
                if(selectedAnswerIndex == allQuestion[questionIndex]["correctOption"]){
                  score++;
                }
              if (questionIndex < allQuestion.length - 1) {
                questionIndex++;
              }
              else{
                questionPage =false;
              }
              
             
                selectedAnswerIndex = -1 ;
                setState(() {});
              
              }
            },
             backgroundColor: const Color.fromARGB(255, 255, 223, 0),
            child: const Icon(Icons.forward),
          ),
    );
      
      
    }else{
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Result",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://static.vecteezy.com/system/resources/previews/018/923/265/original/gold-trophy-award-png.png",
              height: 300,),
              const SizedBox(height: 30,),
              const Text("Congratulations",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.amber,
              ),
              ),
              const SizedBox(height: 30,),
              Text("Score : $score / ${allQuestion.length}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              ),
              
              if (reAttempted)
          Text(
            "Reattempt count: $reAttempt",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),


              const SizedBox(
                height: 20,
              ),
              Row (children: [

              const SizedBox(width: 152,),
              ElevatedButton (onPressed: 
              (){
                
                reAttempted = true;
                questionPage = true;
                isQuizStarted = false;
                questionIndex = 0 ;
                if (reAttempted) {
                  reAttempt ++;
                setState(() {});
                }
               
                score =0;
                setState(() {});
                
              }, 
              
              style: ElevatedButton.styleFrom(
                
                backgroundColor: Colors.amber,

              ),
              
              child: 
              const Text("Reattempt",
              )
              )
              
              
            ],
          ),
          ],
          ),
          ),
          
      );
      
    }
  }

}
