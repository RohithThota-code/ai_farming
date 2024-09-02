import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/mybutton.dart';
import 'package:untitled/components/mytextfield.dart';
import 'package:untitled/helper/helperfunctions.dart';

class Login extends StatefulWidget {


  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final TextEditingController emailController= TextEditingController();

 final TextEditingController passwordController= TextEditingController();

  //void 
  void login()async{
    showDialog(
      context:context,
      builder: (context)=> const Center(
        child:CircularProgressIndicator(),
        ),
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      if(context.mounted)Navigator.pop(context);


    }
    on FirebaseAuthException catch(e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
    }




  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          backgroundColor: Colors.brown[700],
          title: const Text("A I  F A R M I N G",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              const Icon(
                Icons.person,
                size:60,
              ),
              
              const SizedBox(height: 20,),
              
              MyTextField(
                hintText: "Email", 
                obscureText: false, 
                controller: emailController),
          
              const SizedBox(height:10,),

              MyTextField(
                hintText: "Password", 
                obscureText: true, 
                controller: passwordController),

              const SizedBox(height:10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?")
                ],
              ),

              const SizedBox(height: 25,),

              Mybutton(text: 
              "Login", onTap: login),

              const SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account?"),
                  ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, '/signup');
                    }, child: Text("Sign Up here")),

                ],
              )



             

          
            
          
          
            ],
          ),
        ),
      ),
    );
  }
}