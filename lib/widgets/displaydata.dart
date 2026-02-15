import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivoratechfe/profileprovider/profile_provider.dart';
import 'package:rivoratechfe/widgets/updatescreen.dart';

class DisplaData extends StatefulWidget {
  DisplaData({super.key});

  @override
  State<DisplaData> createState() => _DisplaDataState();
}

class _DisplaDataState extends State<DisplaData> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).fetchProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.profiles.isEmpty) {
            return const Center(child: Text("No profiles found"));
          }

          return ListView.builder(
            itemCount: provider.profiles.length,
            itemBuilder: (context, index) {
              final profile = provider.profiles[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(profile.name, style: TextStyle(color:Colors.white, fontSize: 20),),
                    subtitle: Text(profile.email, style: TextStyle(color:Colors.white),),
                    leading: IconButton(
                      onPressed: () async {
                        print("Passing ID: ${profile.id}");
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateScreen(profile: profile),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit, color: Colors.blue),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Delete Profile"),
                            content: Text(
                              "Are you sure you want to delete ${profile.name}?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await provider.deleteProfile(profile.id!);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Profile deleted Successfully"),
                              ),
                            );
                          }
                        }
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
