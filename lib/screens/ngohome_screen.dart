
import 'package:flutter/material.dart';

class NgoHomeScreen extends StatefulWidget {
  @override
  _NgoHomeScreenState createState() => _NgoHomeScreenState();
}

class _NgoHomeScreenState extends State<NgoHomeScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Smile Foundation'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            _buildUserInfo(),

            // Tab Bar Section
            _buildTabSection(),

            // Tab Content
            selectedTab == 0 ? _buildMyPosts() : _buildDonorsPosts(),

            // Food Donors Near You
            _buildFoodDonors(),

            // Community Section
            _buildCommunitySection(),

            // FAQs Section
            _buildFAQsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('You are a Receiver', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoBox('500', 'Orders Received'),
              _buildInfoBox('1000', 'Points Earned'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTabSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildTabItem(0, 'My Post'),
          _buildTabItem(1, 'Donor’s Posts'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: selectedTab == index ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (selectedTab == index)
              Container(
                width: 40,
                height: 3,
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyPosts() {
    return Center(
      child: Column(
        children: [
          Text('Nothing till now'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('+ Create Food Request'),
          ),
        ],
      ),
    );
  }

  Widget _buildDonorsPosts() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.food_bank),
          title: Text('Donor #1 has accepted your food request'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: () {}, child: Text('Reject', style: TextStyle(color: Colors.red))),
              TextButton(onPressed: () {}, child: Text('Approve', style: TextStyle(color: Colors.blue))),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Individual has accepted your food request'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: () {}, child: Text('Reject', style: TextStyle(color: Colors.red))),
              TextButton(onPressed: () {}, child: Text('Approve', style: TextStyle(color: Colors.blue))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFoodDonors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Food Donors Near You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        _buildDonorItem('Restaurant Name 1', '2.5km', '340 meals served till now'),
        _buildDonorItem('Restaurant Name 2', '2.5km', '340 meals served till now'),
      ],
    );
  }

  Widget _buildDonorItem(String name, String distance, String details) {
    return ListTile(
      leading: Icon(Icons.restaurant),
      title: Text(name),
      subtitle: Text('$distance\n$details'),
      trailing: ElevatedButton(onPressed: () {}, child: Text('Connect')),
    );
  }

  Widget _buildCommunitySection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Community', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCommunityPost(),
            _buildCommunityPost(),
          ],
        ),
      ],
    );
  }

  Widget _buildCommunityPost() {
    return Container(
      width: 150,
      height: 100,
      color: Colors.grey[300],
      child: Center(child: Text('Community Post')),
    );
  }

  Widget _buildFAQsSection() {
    return ExpansionTile(
      title: Text('FAQs'),
      children: [
        ListTile(title: Text('Who will pick up the food?')),
        ListTile(title: Text('Can we perform multiple food requests at once?')),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}