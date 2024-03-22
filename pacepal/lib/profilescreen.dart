import 'package:flutter/material.dart';
import 'package:pacepal/loginscreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 2, 30, 71),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/img/profile.jpg'),
                  radius: 50.0,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'no. telp',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: const Color.fromARGB(255, 255, 149, 0),
                  ),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: const Color.fromARGB(255, 255, 149, 0),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  icon: Icon(Icons.logout, color: Colors.black),
                  label: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
