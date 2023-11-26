import 'package:flutter/material.dart';

class AddFriendsToHuddlePage extends StatefulWidget {
  const AddFriendsToHuddlePage({Key? key}) : super(key: key);

  @override
  _AddFriendsToHuddlePageState createState() => _AddFriendsToHuddlePageState();
}

class _AddFriendsToHuddlePageState extends State<AddFriendsToHuddlePage> {
  List<String> selectedFriends = [];

  List<Map<String, String>> allFriends = [
    {'name': 'Friend 1', 'image': 'assets/pf2.jpg'},
    {'name': 'Friend 2', 'image': 'assets/pf3.jpg'},
    {'name': 'Friend 3', 'image': 'assets/pf4.jpg'},
    {'name': 'Friend 4', 'image': 'assets/pf5.jpg'},
    {'name': 'Friend 5', 'image': 'assets/pf2.jpg'},
    {'name': 'Friend 6', 'image': 'assets/pf3.jpg'},
    {'name': 'Friend 7', 'image': 'assets/pf4.jpg'},
    {'name': 'Friend 8', 'image': 'assets/pf5.jpg'},
    {'name': 'Friend 9', 'image': 'assets/pf2.jpg'},
    {'name': 'Friend 10', 'image': 'assets/pf3.jpg'},
    {'name': 'Friend 11', 'image': 'assets/pf4.jpg'},
    {'name': 'Friend 12', 'image': 'assets/pf5.jpg'},
    {'name': 'Friend 13', 'image': 'assets/pf2.jpg'},
    {'name': 'Friend 14', 'image': 'assets/pf3.jpg'},
    {'name': 'Friend 15', 'image': 'assets/pf4.jpg'},
    {'name': 'Friend 16', 'image': 'assets/pf5.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friends to Huddle'),
        backgroundColor: Color.fromRGBO(7, 135, 125, 1.0), // Set the banner color
      ),
      body: Container(
        color: Color.fromRGBO(227, 235, 238, 1.0), // Set the background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: allFriends.length,
            itemBuilder: (context, index) {
              final friend = allFriends[index];
              final isSelected = selectedFriends.contains(friend['name']);

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(friend['image']!),
                ),
                title: Text(friend['name']!),
                trailing: isSelected
                    ? Icon(Icons.check, color: Color.fromRGBO(7, 135, 125, 1.0)) // Set the check mark color
                    : null,
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedFriends.remove(friend['name']);
                    } else {
                      selectedFriends.add(friend['name']!);
                    }
                  });
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
  // Navigate back to the home page when the checkmark is clicked
          Navigator.popUntil(context, ModalRoute.withName('/')); 
        },
        child: const Icon(Icons.check),
        backgroundColor: Color.fromRGBO(7, 135, 125, 1.0), // Set the FAB color
      ),
    );
  }
}
