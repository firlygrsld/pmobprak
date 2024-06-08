import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pacepal/BarGraph/bar_graph.dart';
import 'package:pacepal/profilescreen.dart';
import 'package:pacepal/challengescreen.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<double> weeklySummary = [
    64.40,
    72.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];
  int _selectedIndex = 0;
  bool _isTimerRunning = false;
  int _secondsElapsed = 0;
  late Timer _timer;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 2, 30, 71),
        animationDuration: Duration(milliseconds: 200),
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.play_arrow, color: Colors.white),
        ],
        onTap: _onItemTapped,
      ),
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
                  'Welcome back,\nCheck your schedule',
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
            height: 40,
          ),
          if (_selectedIndex == 0)
            Column(
              children: [
                SizedBox(
                  height: 220,
                  child: MyBarGraph(
                    weeklySummary: weeklySummary,
                  ),
                ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
          if (_selectedIndex == 1)
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.5,
                      children: [
                        buildGridItem(Icons.access_time, "Time"),
                        buildGridItem(Icons.speed, "Speed"),
                        buildGridItem(Icons.favorite, "Heart Rate"),
                        buildGridItem(Icons.whatshot, "Burn Calories"),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 60,
                    right: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 32,
                              child: IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: () {
                                  setState(() {
                                    _isTimerRunning = true;
                                  });
                                  _startTimer();
                                },
                              ),
                            ),
                            Center(
                              child: Text(
                                _isTimerRunning
                                    ? '$_secondsElapsed seconds'
                                    : 'Timer stopped',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 32,
                              child: IconButton(
                                icon: Icon(Icons.stop),
                                onPressed: () {
                                  setState(() {
                                    _isTimerRunning = false;
                                    _secondsElapsed = 0;
                                  });
                                  _stopTimer();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildGridItem(IconData iconData, String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 50,
            color: Color.fromARGB(255, 2, 30, 71),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
