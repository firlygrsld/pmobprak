import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Challenge',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Color.fromARGB(255, 2, 30, 71),
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 235, 235, 235),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color.fromARGB(255, 2, 30, 71),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'steps',
                    ),
                    Tab(
                      text: 'kilometers',
                    ),
                  ],
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'How many steps for today?',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                              },
                              child: const Text(
                                'Pick Date',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 30, 71),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                          ),
                          child: Text(
                            'Set',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text('Kilometers Content Here'),
            ),
          ],
        ),
      ),
    );
  }
}
