import 'package:firebase1/signPage/singnin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}


class _SignupState extends State<Signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  Future<void> _signup() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,

      );
      User? user = _auth.currentUser;
      user!.updateDisplayName(_firstnameController.text);
      user.updateDisplayName(_lastnameController.text);


      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signin()));
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up failed: $e')),
      );
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
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
                  controller: _firstnameController,

                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'Enter your first name',
                      labelText: 'First name',
                      prefixIcon: Icon(Icons.nest_cam_wired_stand),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      )
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _lastnameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(


                      hintText: 'Enter your last name',

                      labelText: 'Last name',
                      prefixIcon: Icon(Icons.nest_cam_wired_stand),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                      )

                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                      )

                  ),
                ),
                SizedBox(height: 15,),
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
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email and Password cannot be empty')),
                    );
                  } else {
                    _signup();
      }
                }, child: Text('Sign Up')),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                      style: TextStyle(fontSize: 15),),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => Signin()));
                    }, child: Text('Sign In'))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

