import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ModToolsScreen extends StatelessWidget {
  final String name;
  const ModToolsScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  void navigateToEditCommunity(BuildContext context) {
    Routemaster.of(context).push('/edit-community/$name');
  }

  void navigateToAddMods(BuildContext context) {
    Routemaster.of(context).push('/add-mods/$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mod Tools'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Add Moderators"),
            leading: const Icon(Icons.add_moderator),
            iconColor: Colors.white,
            onTap: () {
              navigateToAddMods(context);
            },
          ),
          ListTile(
            title: const Text("Edit Community"),
            leading: const Icon(Icons.edit),
            iconColor: Colors.white,
            onTap: () {
              navigateToEditCommunity(context);
            },
          ),
        ],
      ),
    );
  }
}
