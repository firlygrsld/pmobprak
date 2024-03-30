import 'package:flutter/material.dart';
import 'package:pacepal/BarGraph/bar_graph.dart';
import 'package:pacepal/profilescreen.dart';
import 'package:pacepal/challengescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      MyBarGraph(
        weeklySummary: weeklySummary,
      ),
      Text(
        'Index 1: Start',
        style: optionStyle,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 220,
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          if (_selectedIndex ==
              0) // Menampilkan tombol "New Challenge" hanya di halaman utama
            SizedBox(height: 20),
          Center(
            child: GestureDetector(
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
                      SizedBox(height: 10),
                      Container(
                        width: 280,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 187, 240, 189),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            "Ready for a new challenge?",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 30, 71),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'New Challenge',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 2, 30, 71),
        onTap: _onItemTapped,
      ),
    );
  }
}
