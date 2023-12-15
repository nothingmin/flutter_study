import 'package:flutter/material.dart';
import 'package:webflix/screens/detail_screen.dart';

import '../models/webtoon_model.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => DetailScreen(
                webtoon: webtoon,
              ),
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      offset: Offset(15, 15),
                      color: Colors.black.withOpacity(0.3),
                    )
                  ]),
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
