import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivoratechfe/model/profilemodel.dart';
import 'package:rivoratechfe/profileprovider/profile_provider.dart';
import 'package:rivoratechfe/services/profileservices.dart';

class InputsPage extends StatefulWidget {
  InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  final service = Profileservices();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  void addinfo() async {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    await provider.addProfile(
      Profilemodel(
        id: null, 
        name: namecontroller.text,
        email: emailcontroller.text,
      ),
    );
    print("Data added to DB");
    setState(() {
      namecontroller.clear();
      emailcontroller.clear();
    });
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: namecontroller,
            decoration: InputDecoration(label: Text("Enter your name:")),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 250,
          child: TextField(
            controller: emailcontroller,
            decoration: InputDecoration(label: Text("Enter your email:")),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: addinfo,
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
