import 'package:flutter/material.dart';
import 'package:rivoratechfe/widgets/displaydata.dart';
import 'package:rivoratechfe/widgets/inputspage.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leads Sheet"),),
      body: Center(
        child: Column(
          children: [
            InputsPage(),
            SizedBox(height: 5,),
            Expanded(child: DisplaData()),
          ],
        ),
      ),
    ); }
}
