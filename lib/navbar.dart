import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:rx_track/medications/medications.dart';
import 'package:rx_track/findprescribers.dart';
import 'package:rx_track/account.dart';
import 'package:rx_track/notes.dart';
import 'package:rx_track/medicationinsights.dart';


class NavBar extends StatefulWidget {
  final CameraDescription camera;
  const NavBar({super.key, required this.camera});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<String> _pageTitles = [
    'Medications',
    'Medication Insights',
    'Feedback and Notes',
    'Find Prescribers',
    'Account Details',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_pageTitles[_currentIndex]),
      ),
      body: _buildPage(_currentIndex), // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          // Update the selected tab index when tapped
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Medications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find Prescribers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  // Return page based on the selected tab index
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Medications(camera: widget.camera,);
      case 1:
        return const MedicationInsights();
      case 2:
        return const Notes();
      case 3:
        return const FindPrescribers();
      case 4:
        return const Account();
      default:
        return Container(); // Return an empty container as a fallback
    }
  }
}

