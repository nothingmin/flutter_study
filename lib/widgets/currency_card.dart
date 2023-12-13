import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name;
  final String unit;
  final String amount;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.unit,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isInverted ? Colors.black : Colors.white;
    final fontColor = isInverted ? Colors.white : Colors.black;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                          color: fontColor.withOpacity(0.8), fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(0, 12),
                  child: Icon(
                    icon,
                    color: fontColor,
                    size: 88,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
