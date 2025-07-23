import 'package:flutter/material.dart';
import 'package:food_app/order_sucess.dart';

class BurgerBill extends StatelessWidget {
  final int portion;
  final double unitPrice;

  const BurgerBill({super.key, required this.portion, this.unitPrice = 4.12});

  @override
  Widget build(BuildContext context) {
    final double total = portion * unitPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '\$${total.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderSucess()),
              );
            },
            child: Text(
              'ORDER NOW',
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
