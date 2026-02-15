import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivoratechfe/widgets/mainpage.dart';
import 'package:rivoratechfe/profileprovider/profile_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>ProfileProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}