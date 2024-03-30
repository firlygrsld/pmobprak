import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  int? steps;
  DateTime? selectedDate;
  List<String> history = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Challenge',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 2, 30, 71)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                      onChanged: (value) {
                        setState(() {
                          steps = int.tryParse(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'How many steps for today?',
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 2, 30, 71)),
                        ),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 2, 30, 71)),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: const Text(
                            'Pick Date',
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 30, 71),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            if (steps != null && selectedDate != null) {
                              String entry =
                                  'Steps: $steps, Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
                              setState(() {
                                history.add(entry);
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please fill in all fields!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Set',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('History'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: history.asMap().entries.map((entry) {
                    int index = entry.key;
                    String data = entry.value;
                    return ListTile(
                      title: Text(data),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white),
                        onPressed: () {
                          _showDeleteConfirmationDialog(index);
                        },
                      ),
                    );
                  }).toList(),
                ),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close',
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 30, 71))),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.history, color: Color.fromARGB(255, 2, 30, 71)),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Entry',
              style: TextStyle(color: Color.fromARGB(255, 2, 30, 71))),
          content: Text('Are you sure you want to delete this entry?',
              style: TextStyle(color: Color.fromARGB(255, 2, 30, 71))),
          backgroundColor: Color.fromARGB(255, 2, 30, 71),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  history.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete',
                  style: TextStyle(color: Color.fromARGB(255, 2, 30, 71))),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: TextStyle(color: Color.fromARGB(255, 2, 30, 71))),
            ),
          ],
        );
      },
    );
  }
}
