import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:food_app/home.dart';
import 'package:food_app/login.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();
  bool _obscuretext = true;

  @override
  Widget build(BuildContext context) {
    final sizee = MediaQuery.of(context).size;
    void toggle() {
      setState(() {
        _obscuretext = !_obscuretext;
      });
    }

    return Scaffold(
      // backgroundColor: ,
      body: Container(
        height: sizee.height,
        width: sizee.width,
        decoration: BoxDecoration(color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'FontFoodGo',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
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
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(199, 153, 153, 1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: userEmail,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Email or phone number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            // SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                obscureText: _obscuretext,
                                controller: userPass,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscuretext
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      toggle();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      // SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[500],
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.only(
                                bottom: 20,
                                top: 20,
                                left: 30,
                                right: 30,
                              ),
                              textStyle: TextStyle(
                                fontSize: 25,
                                // fontFamily: 'FontFoodGo',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                      email: userEmail.text,
                                      password: userPass.text,
                                    );
                                // to clear text fields
                                userEmail.clear();
                                userPass.clear();
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Close"),
                                        ),
                                      ],
                                      title: Text("Alert"),
                                      contentPadding: EdgeInsets.all(20),
                                      content: Text(
                                        "The password provided is too weak.\n (Atleast above 6 digits)",
                                      ),
                                    ),
                                  );
                                  // print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            userEmail.clear();
                                            userPass.clear();
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                      title: Text('Alert'),
                                      contentPadding: EdgeInsets.all(20),
                                      content: Text(
                                        'The account already exists for that email.',
                                      ),
                                    ),
                                  );

                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: Text(
                                  //       'The account already exists for that email.',
                                  //     ),
                                  //   ),
                                  // );
                                  // print(
                                  //   'The account already exists for that email.',
                                  // );
                                }
                              } catch (e) {
                                

                                // print("acount create");
                                // cleartext();
                              }
                            },
                            child: Text("Sign in"),
                          ),
                          // SizedBox(width: 70),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[500],
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.only(
                                bottom: 20,
                                top: 20,
                                left: 30,
                                right: 30,
                              ),
                              textStyle: TextStyle(
                                fontSize: 25,
                                // fontFamily: 'FontFoodGo',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text("Login in"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
