import 'package:flutter/material.dart';
import 'package:food_app/foodcard.dart';

class BurgerSection extends StatelessWidget {
  final String searchQuery;
  final String selectedCategory;

  const BurgerSection({
    super.key,
    required this.searchQuery,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> burgers = [
      {
        'title': 'Cheese burger',
        'subtitle': 'Wendy\'s Burger',
        'image': 'assets/images/cheeseburger.png',
        'rating': 4.9,
        'mins': 26,
        'imgforburgersec': 'assets/images/big_cheesse_burger.png',
        'textforburger':
            "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      },
      {
        'title': 'Veggie Hamburger',
        'subtitle': 'Veggie Burger',
        'image': 'assets/images/hamburger_veggie.png',
        'rating': 4.8,
        'mins': 14,
        'imgforburgersec': 'assets/images/big_veggie_burger.png',
        'textforburger':
            "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
      },
      {
        'title': 'Chicken Hamburger',
        'subtitle': 'Chicken Burger',
        'image': 'assets/images/hamburger_chiken.png',
        'rating': 4.6,
        'mins': 42,
        'imgforburgersec': 'assets/images/big_chicken_burger.png',
        'textforburger':
            "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      },
      {
        'title': 'Fried Chicken Hamburger',
        'subtitle': 'Fried Chicken Burger',
        'image': 'assets/images/hamburger_fried_chicken.png',
        'rating': 4.5,
        'mins': 14,
        'imgforburgersec': 'assets/images/big_friedchicken_burger.png',
        'textforburger':
            "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      },
      {
        'title': 'Cheese burger',
        'subtitle': 'Wendy\'s Burger',
        'image': 'assets/images/cheeseburger.png',
        'rating': 4.9,
        'mins': 26,
        'imgforburgersec': 'assets/images/big_cheesse_burger.png',
        'textforburger':
            "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      },
      {
        'title': 'Veggie Hamburger',
        'subtitle': 'Veggie Burger',
        'image': 'assets/images/hamburger_veggie.png',
        'rating': 4.8,
        'mins': 14,
        'imgforburgersec': 'assets/images/big_veggie_burger.png',
        'textforburger':
            "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
      },
      {
        'title': 'Chicken Hamburger',
        'subtitle': 'Chicken Burger',
        'image': 'assets/images/hamburger_chiken.png',
        'rating': 4.6,
        'mins': 42,
        'imgforburgersec': 'assets/images/big_chicken_burger.png',
        'textforburger':
            "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      },
      {
        'title': 'Fried Chicken Hamburger',
        'subtitle': 'Fried Chicken Burger',
        'image': 'assets/images/hamburger_fried_chicken.png',
        'rating': 4.5,
        'mins': 14,
        'imgforburgersec': 'assets/images/big_friedchicken_burger.png',
        'textforburger':
            "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      },
      {
        'title': 'Cheese burger',
        'subtitle': 'Wendy\'s Burger',
        'image': 'assets/images/cheeseburger.png',
        'rating': 4.9,
        'mins': 26,
        'imgforburgersec': 'assets/images/big_cheesse_burger.png',
        'textforburger':
            "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      },
      {
        'title': 'Veggie Hamburger',
        'subtitle': 'Veggie Burger',
        'image': 'assets/images/hamburger_veggie.png',
        'rating': 4.8,
        'mins': 14,
        'imgforburgersec': 'assets/images/big_veggie_burger.png',
        'textforburger':
            "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
      },
      {
        'title': 'Chicken Hamburger',
        'subtitle': 'Chicken Burger',
        'image': 'assets/images/hamburger_chiken.png',
        'rating': 4.6,
        'mins': 42,
        'imgforburgersec': 'assets/images/big_chicken_burger.png',
        'textforburger':
            "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      },
      {
        'title': 'Fried Chicken Hamburger',
        'subtitle': 'Fried Chicken Burger',
        'image': 'assets/images/hamburger_fried_chicken.png',
        'rating': 4.5,
        'mins': 14,
        'imgforburgersec': 'assets/images/big_friedchicken_burger.png',
        'textforburger':
            "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      },
    ];

    // 🔍 Apply Filters
    final filteredBurgers = burgers.where((burger) {
      final titleMatch = burger['title'].toString().toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final categoryMatch =
          selectedCategory == 'All' ||
          burger['subtitle'].toString().toLowerCase().contains(
            selectedCategory.toLowerCase(),
          );

      return titleMatch && categoryMatch;
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: filteredBurgers.isNotEmpty
          ? GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
              physics: const BouncingScrollPhysics(),
              children: filteredBurgers.map((burger) {
                return FoodCard(
                  title: burger['title'],
                  subtitle: burger['subtitle'],
                  imagePath: burger['image'],
                  rating: burger['rating'],
                  mins: burger['mins'],
                  textforburger: burger['textforburger'],
                  imgforburgersec: burger['imgforburgersec'],
                );
              }).toList(),
            )
          : Center(
              child: Text(
                'No items found!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
    );
  }
}

