import 'package:flutter/material.dart';
import 'package:rivoratechfe/services/data.dart';
import 'package:rivoratechfe/services/profileservices.dart';

class DisplaData extends StatelessWidget {
  DisplaData({super.key});

  final service= Profileservices();

  void deleteprofile(String id){
    service.deleteProfile(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      itemCount: profileInfo.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.grey,
            title: Text(profileInfo[index]['name']!),
            subtitle: Text(profileInfo[index]['email']!),
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            trailing: IconButton(onPressed:(){
            }, icon: Icon(Icons.delete, color: Colors.red,),),
          ),
        );
      },
    ),
    ); 
  }
}
