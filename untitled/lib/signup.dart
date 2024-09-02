import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/mybutton.dart';
import 'package:untitled/components/mytextfield.dart';
import 'package:untitled/helper/helperfunctions.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // Function to send verification email
  Future<void> sendVerificationEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        displayMessage("Verification email has been sent. Please check your inbox.", context);
      }
    } catch (e) {
      displayMessage("Failed to send verification email: $e", context);
    }
  }

  // Sign up function
  void signup() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);
      displayMessage("Passwords don't match", context);
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);

      Navigator.pop(context); // Close the loading dialog
      
      // Send verification email after successful sign-up
      await sendVerificationEmail();

      // You can navigate to another screen or show a message here
      displayMessage("Sign up successful! Please check email.", context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          backgroundColor: Colors.brown[700],
          title: const Text(
            "A I  F A R M I N G",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              const Icon(
                Icons.login,
                size: 60,
              ),
              const SizedBox(height: 20,),
              MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameController),
              const SizedBox(height: 10,),
              MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController),
              const SizedBox(height: 10,),
              MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController),
              const SizedBox(height: 10,),
              MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmPwController),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?")
                ],
              ),
              const SizedBox(height: 25,),
              Mybutton(text: "Sign Up", onTap: signup),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account?"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("The Login Page"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
