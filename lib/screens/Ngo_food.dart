

import 'package:flutter/material.dart';


class NGOFoodDisplayScreen extends StatefulWidget {
  @override
  _NGOFoodDisplayScreenState createState() => _NGOFoodDisplayScreenState();
}

class _NGOFoodDisplayScreenState extends State<NGOFoodDisplayScreen> {
  // Sample food data with registration requests (replace with actual data)
  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Rice',
      'quantity': '10 kg',
      'description': 'Long grain rice',
      'date': '2023-10-28',
      'requests': [
        {'ngoName': 'NGO A', 'accepted': null},
        {'ngoName': 'NGO B', 'accepted': null},
      ],
    },
    {
      'name': 'Vegetable Curry',
      'quantity': '50 packets',
      'description': 'Mixed vegetable curry',
      'date': '2023-10-29',
      'requests': [
        {'ngoName': 'NGO C', 'accepted': null},
      ],
    },
    // Add more food items here
  ];

  void _acceptRequest(int foodIndex, int requestIndex) {
    setState(() {
      foodItems[foodIndex]['requests'][requestIndex]['accepted'] = true;
    });
    // Implement backend logic to update request status
  }

  void _rejectRequest(int foodIndex, int requestIndex) {
    setState(() {
      foodItems[foodIndex]['requests'][requestIndex]['accepted'] = false;
    });
    // Implement backend logic to update request status
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Food Items'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade300, Colors.blue.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, foodIndex) {
            final item = foodItems[foodIndex];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text(item['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quantity: ${item['quantity']}'),
                    Text('Date: ${item['date']}'),
                  ],
                ),
                children: [
                  if (item['requests'] != null && item['requests'].isNotEmpty)
                    ...item['requests'].map((request) {
                      return ListTile(
                        title: Text('Request from: ${request['ngoName']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (request['accepted'] == null)
                              IconButton(
                                icon: Icon(Icons.check, color: Colors.green),
                                onPressed: () => _acceptRequest(foodIndex, item['requests'].indexOf(request)),
                              ),
                            if (request['accepted'] == null)
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () => _rejectRequest(foodIndex, item['requests'].indexOf(request)),
                              ),
                            if(request['accepted'] != null)
                              Icon(request['accepted'] == true ? Icons.check_circle : Icons.cancel, color: request['accepted'] == true ? Colors.green : Colors.red),
                          ],
                        ),
                      );
                    }).toList()
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No requests for this item.'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NGOHomeScreen()));
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NGOHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NGO Home')),
      body: Center(
        child: Text('Welcome to NGO Home!'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Food Items'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NGOFoodDisplayScreen()));
          }
          // Add profile and logout functionality here
        },
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class NGOFoodDisplayScreen extends StatefulWidget {
//   @override
//   _NGOFoodDisplayScreenState createState() => _NGOFoodDisplayScreenState();
// }

// class _NGOFoodDisplayScreenState extends State<NGOFoodDisplayScreen> {
//   // Sample food data with registration requests (replace with actual data)
//   final List<Map<String, dynamic>> foodItems = [
//     {
//       'name': 'Rice',
//       'quantity': '10 kg',
//       'description': 'Long grain rice',
//       'date': '2023-10-28',
//       'requests': [
//         {'ngoName': 'NGO A', 'accepted': null},
//         {'ngoName': 'NGO B', 'accepted': null},
//       ],
//     },
//     {
//       'name': 'Vegetable Curry',
//       'quantity': '50 packets',
//       'description': 'Mixed vegetable curry',
//       'date': '2023-10-29',
//       'requests': [
//         {'ngoName': 'NGO C', 'accepted': null},
//       ],
//     },
//     // Add more food items here
//   ];

//   void _acceptRequest(int foodIndex, int requestIndex) {
//     setState(() {
//       foodItems[foodIndex]['requests'][requestIndex]['accepted'] = true;
//     });
//     // Implement backend logic to update request status
//   }

//   void _rejectRequest(int foodIndex, int requestIndex) {
//     setState(() {
//       foodItems[foodIndex]['requests'][requestIndex]['accepted'] = false;
//     });
//     // Implement backend logic to update request status
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Available Food Items'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue.shade300, Colors.blue.shade500],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade100, Colors.blue.shade200],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView.builder(
//           itemCount: foodItems.length,
//           itemBuilder: (context, foodIndex) {
//             final item = foodItems[foodIndex];
//             return Card(
//               margin: EdgeInsets.all(8.0),
//               child: ExpansionTile(
//                 title: Text(item['name']),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Quantity: ${item['quantity']}'),
//                     Text('Date: ${item['date']}'),
//                   ],
//                 ),
//                 children: [
//                   if (item['requests'] != null && item['requests'].isNotEmpty)
//                     ...item['requests'].map((request) {
//                       return ListTile(
//                         title: Text('Request from: ${request['ngoName']}'),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             if (request['accepted'] == null)
//                               IconButton(
//                                 icon: Icon(Icons.check, color: Colors.green),
//                                 onPressed: () => _acceptRequest(foodIndex, item['requests'].indexOf(request)),
//                               ),
//                             if (request['accepted'] == null)
//                               IconButton(
//                                 icon: Icon(Icons.close, color: Colors.red),
//                                 onPressed: () => _rejectRequest(foodIndex, item['requests'].indexOf(request)),
//                               ),
//                             if(request['accepted'] != null)
//                               Icon(request['accepted'] == true ? Icons.check_circle : Icons.cancel, color: request['accepted'] == true ? Colors.green : Colors.red),
//                           ],
//                         ),
//                       );
//                     }).toList()
//                   else
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('No requests for this item.'),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NGOHomeScreen()));
//         },
//         child: Icon(Icons.home),
//         backgroundColor: Colors.blue,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

// class NGOHomeScreen extends StatelessWidget {
//   final String ngoDocId;

//   NGOHomeScreen({this.ngoDocId = ""});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('NGO Home')),
//       body: Center(
//         child: Text('Welcome to NGO Home!'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Food Items'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
//         ],
//         onTap: (int index) {
//           if (index == 0) {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => NGOFoodDisplayScreen()));
//           } else if (index == 1){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => NGOProfileScreen(ngoDocId: ngoDocId)));
//           }
//           // Add profile and logout functionality here
//         },
//       ),
//     );
//   }
// }

// class NGOProfileScreen extends StatelessWidget {
//   final String ngoDocId;

//   NGOProfileScreen({required this.ngoDocId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('NGO Profile')),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('ngos').doc(ngoDocId).get(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('NGO profile not found.'));
//           }

//           final ngoData = snapshot.data!.data() as Map<String, dynamic>;

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('NGO Name: ${ngoData['ngoName']}'),
//                 Text('Registration Number: ${ngoData['registrationNumber']}'),
//                 Text('Contact Person: ${ngoData['contactPerson']}'),
//                 Text('Phone Number: ${ngoData['phoneNumber']}'),
//                 Text('Email: ${ngoData['email']}'),
//                 Text('Address: ${ngoData['address']}'),
//                 Text('Area of Operation: ${ngoData['areaOfOperation']}'),
//                 // ... (display other fields)
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }





