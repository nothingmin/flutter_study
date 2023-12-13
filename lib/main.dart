import 'package:flutter/material.dart';
import 'package:webflix/widgets/Button.dart';
import 'package:webflix/widgets/currency_card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Hey, Selena',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            )),
                        Text("Welcome back",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            )),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Balnace",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "\$5 194 482",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          text: "Transfer",
                          bgColor: Color(0xFFF2B33A),
                          textColor: Colors.black,
                        ),
                        Button(
                          text: "Request",
                          bgColor: Color(0xFF1F2123),
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Wallets",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const CurrencyCard(
                  name: "Euro",
                  unit: "EUR",
                  amount: "6 428",
                  icon: Icons.euro_rounded,
                  isInverted: true,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const CurrencyCard(
                    name: "Dollar",
                    unit: "USD",
                    amount: "55622",
                    icon: Icons.monetization_on_rounded,
                    isInverted: false,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    name: "Rupee",
                    unit: "INR",
                    amount: "28981",
                    icon: Icons.currency_rupee_rounded,
                    isInverted: true,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
