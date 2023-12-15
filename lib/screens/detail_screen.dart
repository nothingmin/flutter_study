import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webflix/models/webtoon_episode_model.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_model.dart';
import '../services/api_services.dart';
import '../widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;

  const DetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> detail;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences preferences;
  bool isLiked = false;

  Future initprefs() async {
    preferences = await SharedPreferences.getInstance();
    final likedToons = preferences.getStringList("likedToons");
    if (likedToons != null) {
      if (likedToons.contains(widget.webtoon.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await preferences.setStringList(('likedToons'), []);
    }
  }

  void onHeartPressed() async {
    final likedToons = preferences.getStringList("likedToons");
    if (isLiked) {
      likedToons?.remove(widget.webtoon.id);
    } else {
      likedToons?.add(widget.webtoon.id);
    }
    await preferences.setStringList(('likedToons'), likedToons!);
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
    detail = ApiService.getWebtoon(widget.webtoon.id);
    episodes = ApiService.getLatestEpisodesById(widget.webtoon.id);
    initprefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.webtoon.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(15, 15),
                              color: Colors.black.withOpacity(0.3),
                            )
                          ]),
                      child: Image.network(
                        widget.webtoon.thumb,
                        headers: const {
                          'Referer': 'https://comic.naver.com',
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                  future: detail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          FutureBuilder(
                              future: episodes,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var episode in snapshot.data!)
                                        Episode(
                                          episode: episode,
                                          webtoonId: widget.webtoon.id,
                                        )
                                    ],
                                  );
                                }
                                return Container();
                              })
                        ],
                      );
                    }
                    return const Text("...");
                  }),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onHeartPressed,
            icon: isLiked
                ? Icon(Icons.favorite_rounded)
                : Icon(Icons.favorite_outline_outlined),
          )
        ],
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Center(
          child: Text(
            widget.webtoon.title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
