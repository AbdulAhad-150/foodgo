import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bottom/add_page.dart';
import 'package:food_app/burger_section.dart';
import 'package:food_app/bottom/chat_page.dart';
import 'package:food_app/bottom/favorite_page.dart';
import 'package:food_app/bottom/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  String selectedCategory = 'All';

  // int selected = 0;
  // bool heart = false;
  // final controller = PageController();

  //for bottom navigation bar index number
  // int index = 0;
  int myindex = 0;

  @override
  // ignore: override_on_non_overriding_member
  // final items = [
  //   Icon(Icons.home_filled, size: 30, color: Colors.white),
  //   Icon(Icons.person, size: 30, color: Colors.white),
  //   Icon(Icons.add_rounded, size: 30, color: Colors.white),
  //   Icon(Icons.chat_rounded, size: 30, color: Colors.white),
  //   Icon(Icons.favorite, size: 30, color: Colors.white),
  // ];
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      // HomePage(),
      buildHomeContent(),
      ProfilePage(imagePath: 'assets/images/user.jpg'),
      AddPage(),
      ChatPage(),
      FavoritePage(),
    ];
    return Scaffold(
      // B O T T O M      N A V I G A T I O N
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.red,
        height: 60,

        // index: index,
        // items: items,
        // currentIndex :myindex,
        // onTap: (index) {
        //   //Handle button tap
        // },
        onTap: (Index) {
          setState(() {
            myindex = Index;
          });
        },
        index: myindex,

        items: [
          Icon(Icons.home_filled, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.add_rounded, size: 30, color: Colors.white),
          Icon(Icons.chat_rounded, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
        ],
        // onTap: (newIndex) {
        //   setState(() => index = newIndex);

        //   if (newIndex == 0) {
        //     // Stay on HomePage
        //   } else if (newIndex == 1) {
        //     // Navigate to profile page
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (_) =>
        //             ProfilePage(imagePath: 'assets/images/user.jpg'),
        //       ),
        //     );
        //   } else if (newIndex == 2) {
        //     // Navigate to add page
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (_) => AddPage()),
        //     );
        //   } else if (newIndex == 3) {
        //     // Navigate to chat page
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (_) => ChatPage()),
        //     );
        //   } else if (newIndex == 4) {
        //     // Navigate to favorite page
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (_) => FavoritePage()),
        //     );
        //   }
        //   // Add logic for other pages as needed
        // },
      ),

      // B O D Y           S E C T I O N
      backgroundColor: Colors.grey[100],
      body: IndexedStack(children: widgetList, index: myindex),
    );
  }

  Widget buildHomeContent() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //  T O P    B A R
            Padding(
              padding: EdgeInsets.all(2.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Foodgo",
                        style: TextStyle(
                          fontFamily: 'FontFoodGo',
                          letterSpacing: 2,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          // backgroundColor: Colors.amber,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfilePage(
                                  imagePath: 'assets/images/user.jpg',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Order Your Favourite Food!",
                    style: TextStyle(
                      color: Color(0xFF868686),
                      letterSpacing: 0.2,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            //  S E A R C H    C O N T A I N E R
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  S E A R C H   B A R  ( F O R  F O O D)
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Search for food...',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 15), // Spacing between search and filter
                // Filter Button
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.format_list_bulleted_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // HORIZONTAL LISTVIEW FOR SCROLLING
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50, // Set a height for horizontal ListView
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    textBox("All"),
                    textBox("Combos"),
                    textBox("Sliders"),
                    textBox("Classic"),
                    textBox("Fries"),
                    textBox("Soft drink"),
                    textBox("Slider"),
                    textBox("Classi"),
                  ],
                ),
              ),
            ),

            //  FOR BURGER SECTION
            Expanded(
              child: BurgerSection(
                searchQuery: searchQuery,
                selectedCategory: selectedCategory,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textBox(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedCategory == text ? Colors.red : Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: selectedCategory == text
                ? Colors.white
                : Color.fromARGB(255, 116, 115, 115),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
