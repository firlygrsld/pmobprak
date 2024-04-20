import 'package:flutter/material.dart';
import 'package:pacepal/loginscreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isCheckedRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/img/pacepal.jpg',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                  left: 100, top: 30, right: 100, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                Color.fromARGB(255, 2, 30, 71),
                          ),
                          child: Checkbox(
                            activeColor: Color.fromARGB(255, 2, 30, 71),
                            value: isCheckedRememberMe,
                            onChanged: (value) {
                              setState(() {
                                isCheckedRememberMe = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Remember me',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
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
                      backgroundColor: const Color.fromARGB(255, 255, 149, 0),
                    ),
                    child: Text(
                      'SET',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
