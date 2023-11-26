// home.dart
import 'package:flutter/material.dart';
import 'start_huddle.dart';
import 'friends.dart';
import 'upcoming_huddles.dart' as upcoming; // Import with a prefix
import 'past_huddles.dart' as past; // Import with a prefix

const String userProfilePicture = 'assets/pfp.jpg';
const String userName = 'Anish Reddy';
const String userEmail = 'anishr@gmail.com';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendsPage()),
                    );
                  },
                  child: Icon(Icons.group),
                  backgroundColor: Color.fromRGBO(7, 135, 125, 1.0),
                ),
                PopupMenuButton(
                  icon: CircleAvatar(
                    backgroundImage: AssetImage(userProfilePicture),
                    radius: 40,
                  ),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(userProfilePicture),
                          radius: 40,
                        ),
                        title: Text(userName),
                        subtitle: Text(userEmail),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('Logout'),
                        onTap: () {
                          // Placeholder for logout logic
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          _buildSectionWithViewAll(context, 'Upcoming Huddles', 'View all ➞', upcoming.AllUpcomingHuddlesPage()),
          _buildHuddleContainer('First Upcoming Huddle', Color.fromRGBO(7, 135, 125, 1.0)),
          _buildHuddleContainer('Second Upcoming Huddle', Color.fromRGBO(7, 135, 125, 1.0)),
          SizedBox(height: 20),
          _buildSectionWithViewAll(context, 'Past Huddles', 'View all ➞', past.AllPastHuddlesPage()),
          _buildHuddleContainer('First Past Huddle', Color.fromRGBO(7, 135, 125, 1.0)),
          _buildHuddleContainer('Second Past Huddle', Color.fromRGBO(7, 135, 125, 1.0)),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 35.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(7, 135, 125, 1.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(7, 135, 125, 1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartHuddlePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              child: const Text(
                'Start Huddle',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _buildSectionWithViewAll(BuildContext context, String heading, String viewAllButtonText, Widget destinationPage) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _buildViewAllButton(context, viewAllButtonText, destinationPage),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHuddleContainer(String huddleText, Color backgroundColor) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 80,
      child: Center(
        child: Text(
          huddleText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildViewAllButton(BuildContext context, String buttonText, Widget destinationPage) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
