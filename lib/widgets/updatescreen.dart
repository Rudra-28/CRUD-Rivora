import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivoratechfe/model/profilemodel.dart';
import 'package:rivoratechfe/profileprovider/profile_provider.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key, required this.profile});
  final Profilemodel profile;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  void updatepro() async {
    if (widget.profile.id == null) {
      print("Error: Profile ID is null");
      return;
    }

    final provider = Provider.of<ProfileProvider>(context, listen: false);

    print("Updating ID: ${widget.profile.id}");
    
    await provider.updateProfile(
      widget.profile.id!,
      Profilemodel(
        id: widget.profile.id!,
        name: nameController.text,
        email: emailController.text,
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile updated successfully")),
      );
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile.name);
    emailController = TextEditingController(text: widget.profile.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update your details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                 height: 75,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(label: Text("Enter your name:")),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                 height: 75,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(label: Text("Enter your email:")),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updatepro,
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}