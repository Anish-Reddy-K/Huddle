// past_huddles.dart
import 'package:flutter/material.dart';

class Huddle {
  final String name;
  final String place;
  final String date;
  final String time;
  final List<User> attendees; // List of people attending (users)

  Huddle({
    required this.name,
    required this.place,
    required this.date,
    required this.time,
    required this.attendees,
  });
}

class User {
  final String username;
  final String imagePath; // Asset path for the user's image

  User({
    required this.username,
    required this.imagePath,
  });
}

class AllPastHuddlesPage extends StatelessWidget {
  final List<Huddle> pastHuddles = [
    Huddle(
      name: 'Past Huddle 1',
      place: 'Conference Room B',
      date: '2023-11-25',
      time: '10:30',
      attendees: [
        User(username: 'User7', imagePath: 'assets/pf2.jpg'),
        User(username: 'User8', imagePath: 'assets/pf4.jpg'),
        User(username: 'User9', imagePath: 'assets/pf3.jpg'),
      ],
    ),
    Huddle(
      name: 'Past Huddle 2',
      place: 'Auditorium',
      date: '2023-11-20',
      time: '14:00',
      attendees: [
        User(username: 'User10', imagePath: 'assets/pf5.jpg'),
        User(username: 'User11', imagePath: 'assets/pf3.jpg'),
        User(username: 'User12', imagePath: 'assets/pf2.jpg'),
      ],
    ),
    // Add more past Huddles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Past Huddles'),
      ),
      body: ListView.builder(
        itemCount: pastHuddles.length,
        itemBuilder: (context, index) {
          return _buildHuddleCard(pastHuddles[index]);
        },
      ),
    );
  }

  Widget _buildHuddleCard(Huddle huddle) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          huddle.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Place: ${huddle.place}'),
            Text('Date: ${huddle.date}'),
            Text('Time: ${huddle.time}'),
            SizedBox(height: 8),
            _buildAttendeesIcons(huddle.attendees),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendeesIcons(List<User> attendees) {
    return Row(
      children: attendees
          .map(
            (user) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(user.imagePath),
                radius: 20,
              ),
            ),
          )
          .toList(),
    );
  }
}
