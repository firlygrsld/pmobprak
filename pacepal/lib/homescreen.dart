import 'package:flutter/material.dart';
import 'package:pacepal/challengescreen.dart';
import 'package:pacepal/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 30, 71),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome back, Dian\nCheck your schedule',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ],
            ),
          ),
          SizedBox(height: 300),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChallengeScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                width: 300,
                height: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Challenge',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 187, 240, 189),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text('complete', textAlign: TextAlign.start),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Start',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.run_circle),
            label: 'Challenge',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 2, 30, 71),
        onTap: _onItemTapped,
      ),
    );
  }
}
