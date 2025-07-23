import 'package:flutter/material.dart';
import 'package:food_app/burger_page_one.dart';

class FoodCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double rating;
  final double mins;
  final String textforburger;
  final String imgforburgersec;

  const FoodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.rating,
    required this.mins,
    required this.textforburger,
    required this.imgforburgersec,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BurgerPageOne(
              title: widget.title,
              subtitle: widget.subtitle,
              imagePath: widget.imagePath,
              rating: widget.rating,
              mins: widget.mins,
              textforburger: widget.textforburger,
              imgforburgersec: widget.imgforburgersec,
            ),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.imagePath,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 2),
            Text(
              widget.subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFF9633), size: 18),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Icon(Icons.favorite_border),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
