import 'package:flutter/material.dart';
import 'package:food_app/burger_page.dart';
import 'package:food_app/burger_page_quantity.dart';

class BurgerPageOne extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double rating;
  final double mins;
  final String textforburger;
  final String imgforburgersec;

  const BurgerPageOne({
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
  State<BurgerPageOne> createState() => _BurgerPageOneState();
}

class _BurgerPageOneState extends State<BurgerPageOne> {
  double _spiceLevel = 20;
  int _portion = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(widget.imgforburgersec, height: 190),
            Image.asset(widget.imgforburgersec, height: 190, fit: BoxFit.cover),

            //  Title + Subtitle
            Text(
              '${widget.title} ${widget.subtitle}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 5),

            //  Rating Row
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  '${widget.rating} - ${widget.mins.toInt()} mins',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 5),

            //  Burger Description
            Text(
              widget.textforburger,
              style: const TextStyle(fontSize: 13, wordSpacing: 2),
            ),
            const SizedBox(height: 10),

            //  Slider (mild andhot ) and Quantity Counter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Slider Column
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Spicy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        value: _spiceLevel,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            _spiceLevel = value;
                          });
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mild',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Hot',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Quantity Counter
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: PortionCounter(
                    onPortionChanged: (value) {
                      setState(() {
                        _portion = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            //  Bill Container
            BurgerBill(portion: _portion),
          ],
        ),
      ),
    );
  }
}
