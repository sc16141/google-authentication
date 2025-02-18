import 'package:firebase1/signPage/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void>_signin()async{

    try{
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => hompage()));
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign In failed: $e')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/image/3.png'),),
              Padding(padding: EdgeInsets.all(25)),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
              SizedBox(height:15 ,),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              ),
              SizedBox(height:15 ,),
              ElevatedButton(
                onPressed: (){
                  _signin();
                },
                child: Text('Sign In'),
              ),
              SizedBox(height:15 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                    },
                    child: Text('Sign Up'),
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
