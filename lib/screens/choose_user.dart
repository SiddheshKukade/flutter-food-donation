import 'package:flutter/material.dart';
import 'package:flutterapk/screens/ngo_screen.dart';

import 'donar_screen.dart';

class chooseUser extends StatefulWidget {
  const chooseUser({super.key});

  @override
  State<chooseUser> createState() => _chooseUserState();
}

class _chooseUserState extends State<chooseUser> {
  void _showInfoDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Light background color
      appBar: AppBar(
        title: Text('Food Waste Management'),
        backgroundColor: Colors.green[700], // Nice green shade
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Your Role',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50), // Spacing below text

            // Donor Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonarScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
              ),
              child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.volunteer_activism, color: Colors.white),
                      SizedBox(width: 10),
                      Text('Donor', style: TextStyle(fontSize: 22, color: Colors.white)),
                  ],
              ),
            ),

            SizedBox(height: 20), // Space between buttons

            // NGO Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NgoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.group, color: Colors.white), // Icon
                  SizedBox(width: 10),
                  Text('NGO', style: TextStyle(fontSize: 22, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}