import 'package:flutter/material.dart';

class PortionCounter extends StatefulWidget {
  final Function(int) onPortionChanged;

  const PortionCounter({super.key, required this.onPortionChanged});

  @override
  State<PortionCounter> createState() => _PortionCounterState();
}

class _PortionCounterState extends State<PortionCounter> {
  int portion = 1;

  void incrementPortion() {
    setState(() {
      portion++;
      widget.onPortionChanged(portion);
    });
  }

  void decrementPortion() {
    if (portion > 1) {
      setState(() {
        portion--;
        widget.onPortionChanged(portion);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Portion',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _roundedButton(icon: Icons.remove, onTap: decrementPortion),
            const SizedBox(width: 16),
            Text('$portion', style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 16),
            _roundedButton(icon: Icons.add, onTap: incrementPortion),
          ],
        ),
      ],
    );
  }

  Widget _roundedButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFF3D00),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
