import 'package:flutter/material.dart';
import 'package:flutter_counter_app/pages/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("2nd page quick")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to first page"),
          onPressed: () {
            Navigator.pushNamed(context, '/firstpage');
          },
        ),
      ),
    );
  }
}
