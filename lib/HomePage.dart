import 'package:flutter/material.dart';

class hompage extends StatelessWidget {
  const hompage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
              Text('Welcome to Home Page', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
