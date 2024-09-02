import 'package:flutter/material.dart';
import 'package:untitled/services/firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final FirestoreService firestoreService=FirestoreService();

  final TextEditingController textController= TextEditingController();

  void openNoteBox(){
    showDialog(
      context:context,
      builder: (context)=> AlertDialog(
        content:TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(onPressed: (){
            firestoreService.addNote(textController.text);

            textController.clear();
  
            Navigator.pop(context);
          },
           child: const Text("Questions"))
        ],
      ),
    );
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
  backgroundColor: Colors.brown[200],
  appBar: AppBar(
    backgroundColor: Colors.brown[700],
    title: const Text("A I   F A R M I N G"),
  ),
  body: ListView(
    scrollDirection: Axis.vertical,
    children: [
      // ABOUT US Section
      Container(
        color: Colors.brown[600],
        padding: const EdgeInsets.all(16), // Add padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ABOUT US\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "This app is made to help farmers",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "wanna leave us a comment?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // Add spacing
            FloatingActionButton(
              onPressed: openNoteBox,
              child: const Icon(Icons.question_answer, size: 30), // Reduced icon size
            ),
          ],
        ),
      ),
      // Sign Up Section
      Container(
        color: Colors.brown[500],
        padding: const EdgeInsets.all(16), // Add padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Didn't Sign Up?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("The Sign Up Page"),
              ),
            ),
          ],
        ),
      ),
      // Login Section
      Container(
        color: Colors.brown[400],
        padding: const EdgeInsets.all(16), // Add padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text("The Login Page"),
              ),
            ),
          ],
        ),
      ),
      // OTP Section (moved out and separate)
      Container(
        color: Colors.brown[300],
        padding: const EdgeInsets.all(16), // Add padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign in by OTP\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/OtpPage');
                },
                child: const Text("Get OTP"),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
    );
    
  }
}

  
