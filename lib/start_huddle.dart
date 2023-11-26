import 'package:flutter/material.dart';
import 'add_friends_to_huddle.dart'; // Assuming you named the file accordingly

class StartHuddlePage extends StatefulWidget {
  const StartHuddlePage({Key? key}) : super(key: key);

  @override
  _StartHuddlePageState createState() => _StartHuddlePageState();
}

class _StartHuddlePageState extends State<StartHuddlePage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0), // Add white space at the top
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen (HomePage)
                    },
                  ),
                  const Text(
                    'Start Huddle',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Place'),
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedDate != null
                            ? "${_selectedDate!.toLocal()}".split(' ')[0]
                            : 'Select Date',
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => _selectTime(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Time',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedTime != null
                            ? "${_selectedTime!.hour}:${_selectedTime!.minute}"
                            : 'Select Time',
                      ),
                      Icon(Icons.access_time),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(7, 135, 125, 1.0), // Set button background color
                    padding: EdgeInsets.all(20.0),
                  ),
                  onPressed: () {
                    // Navigate to the AddFriendsToHuddlePage when the button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddFriendsToHuddlePage()),
                    );
                  },
                  child: const Text('Start Huddle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
