// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'donar_screen.dart'; // Import your DonarScreen
// // Import your Donar History Screen
// // import 'donar_history_screen.dart';
// // Import your NGO near you screen
// // import 'ngo_near_you_screen.dart';

// class DonarHomeScreen extends StatefulWidget {
//   @override
//   _DonarHomeScreenState createState() => _DonarHomeScreenState();
// }

// class _DonarHomeScreenState extends State<DonarHomeScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _widgetOptions = <Widget>[
//     DonarMainScreen(), // Main screen with donate food button
//     DonarHistoryScreen(), // Donar History Screen
//     NgoNearYouScreen(), // Ngo Near You Screen
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donar Home'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.food_bank),
//             label: 'Donate Food',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'Donation History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.location_on),
//             label: 'NGOs Near You',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.green,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class DonarMainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Ready to Donate Food?',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DonarScreen()), // Navigate to DonarScreen
//               );
//             },
//             child: Text('Donate Now'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DonarHistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Replace with your actual logic to fetch donation history from Firestore
//     return ListView(
//       children: [
//         ListTile(title: Text("Food: Example food 1, Status: Completed"),),
//         ListTile(title: Text("Food: Example food 2, Status: Pending"),),
//         ListTile(title: Text("Food: Example food 3, Status: Completed"),),
//       ],
//     );
//   }
// }

// class NgoNearYouScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Replace with your actual logic to fetch nearby NGOs from Firestore or a local list
//     return ListView(
//       children: [
//         ListTile(title: Text("NGO: Example NGO 1, Address: Example address 1"),),
//         ListTile(title: Text("NGO: Example NGO 2, Address: Example address 2"),),
//         ListTile(title: Text("NGO: Example NGO 3, Address: Example address 3"),),
//       ],
//     );
//   }
// }















import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonarHomeScreen(),
    );
  }
}

class DonarHomeScreen extends StatelessWidget {
  const DonarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Waste Management"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Donor Profile
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'), // Add your profile image here
                ),
                title: Text(
                  "Hi Mandeep",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("You are a Donor - Super Donor"),
                trailing: const Icon(Icons.verified, color: Colors.green),
              ),
            ),

            const SizedBox(height: 10),

            // Food Donation Details
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Food Donation",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Cooked Food"),
                        Text("Veg: 5 | Non-Veg: 5"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text("Expiration Date: 15 Feb 2023"),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Create More Donation"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Live Status
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Live Tracking",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text("Your agent is on the way!"),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: const Text("Ayush Pant"),
                      subtitle: const Text("Pickup Volunteer"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.blue),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.track_changes,
                                color: Colors.green),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Donation History
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Donation History",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: const Icon(Icons.history, color: Colors.orange),
                      title: const Text("Rice Bowl with Curry"),
                      subtitle: const Text("10 Plates | Non-Veg"),
                      trailing: const Icon(Icons.check_circle,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // NGOs Nearby
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NGOs Near You",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: const Icon(Icons.location_on,
                          color: Colors.blue),
                      title: const Text("NGO Name 1"),
                      subtitle: const Text("2.5 km away"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on,
                          color: Colors.blue),
                      title: const Text("NGO Name 2"),
                      subtitle: const Text("3 km away"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // FAQs
            ExpansionTile(
              title: Text("Who will pick up the food?",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "A registered volunteer will be assigned to pick up the food."),
                )
              ],
            ),

            ExpansionTile(
              title: Text("Can we perform one-time donations?",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Yes, you can donate food even if you are not a regular donor."),
                )
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}












