import 'package:day9/widgets/card_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xFF1f1f1f),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://newsimg.sedaily.com/2023/11/17/29X9QV0EJS_1.jpg",
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFF1f1f1f),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Monday 16",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text(
                              "TODAY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(2, 0),
                              child: const Icon(
                                Icons.circle,
                                size: 15,
                                color: Color(0xFFb22580),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Text(
                          "${16 + index}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 40,
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: 15,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              children: [
                CardWidget(
                  color: Color(0xFFffed50),
                  todo: "DESIGN MEETING",
                  participants: [
                    "ALEX",
                    "HELENA",
                    "NANA",
                  ],
                  startTime: DateTime.now(),
                  endTime: DateTime.now(),
                ),
                CardWidget(
                  color: Color(0xFFa075d2),
                  todo: "DAILY PROJECT",
                  participants: [
                    "ME",
                    "RICHARD",
                    "CIRY",
                    "GWAK",
                    "BUM",
                    "GYU",
                    "AAA",
                  ],
                  startTime: DateTime.now(),
                  endTime: DateTime.now(),
                ),
                CardWidget(
                  color: Color(0xFF9bb249),
                  todo: "WEEKLY PLANNING",
                  participants: [
                    "DEN",
                    "NANA",
                    "MARK",
                  ],
                  startTime: DateTime.timestamp(),
                  endTime: DateTime.timestamp(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
