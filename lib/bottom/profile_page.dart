import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required String imagePath});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizee = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: ,
      body: Stack(
        children: [
          Container(
            height: sizee.height,
            width: sizee.width,
            decoration: BoxDecoration(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text(
                      //   "Login",
                      //   style: TextStyle(color: Colors.white, fontSize: 40),
                      // ),
                      // SizedBox(height: 10),
                      // Text(
                      //   "Welcome Back",
                      //   style: TextStyle(color: Colors.white, fontSize: 18),
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 70),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: userName,
                              decoration: InputDecoration(hintText: "Email"),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: userPass,
                              decoration: InputDecoration(hintText: "Password"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 130,
            top: 65,
            child: Container(
              height: 125,
              width: 125,
              padding: EdgeInsets.all(4), // Border width
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 92, 92),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(50), // Image radius
                  child: Image.asset(
                    'assets/images/user.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
