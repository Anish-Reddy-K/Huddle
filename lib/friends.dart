import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        backgroundColor: Color.fromRGBO(7, 135, 125, 1.0),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                FriendListItem(name: 'Friend 1', image: 'assets/pf1.jpg'),
                FriendListItem(name: 'Friend 2', image: 'assets/pf2.jpg'),
                FriendListItem(name: 'Friend 3', image: 'assets/pf3.jpg'),
                // Add more FriendListItem widgets as needed
              ],
            ),
          ),
          SizedBox(
            height: 80, // Increased the vertical size
            width: 200, // Adjust the width as needed
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showSearchDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add, size: 24),
                    const SizedBox(width: 8),
                    const Text(
                      'Add Friends',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(7, 135, 125, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Friends'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Enter friend\'s name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Placeholder for search logic
                // You can handle searching for friends here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Search'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class FriendListItem extends StatelessWidget {
  final String name;
  final String image;

  const FriendListItem({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(name),
    );
  }
}
