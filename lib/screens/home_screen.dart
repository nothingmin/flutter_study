import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const threeSeconds = 3;
  static const totalGoal = 6;
  static const totalRounds = 2;
  int totalSeconds = threeSeconds;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoros = 0;
  int selected = 2;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        totalSeconds = selected + 1;
        timer.cancel();
      });
      if (totalPomodoros == totalGoal) {
        isRunning = false;
      } else {
        onStartPressed();
      }
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  void onPausePressed() {
    setState(() {
      isRunning = false;
    });
    timer.cancel();
  }

  void onTimeSelectorPressed(int index) {
    if (!isRunning) {
      setState(() {
        selected = index;
        totalSeconds = selected + 1;
        totalPomodoros = 0;
      });
    }
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "POMOTIMER",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          format(totalSeconds).substring(0, 2),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                        color: Color(0xfff0928a),
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          format(totalSeconds).substring(3, 5),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == selected) {
                          return TimeSelectWidget(
                            index: index,
                            backGroundColor: Colors.white,
                            textColor: Theme.of(context).colorScheme.background,
                            setSelected: onTimeSelectorPressed,
                          );
                        } else {
                          return TimeSelectWidget(
                            index: index,
                            backGroundColor:
                                Theme.of(context).colorScheme.background,
                            textColor: Colors.white.withOpacity(0.7),
                            setSelected: onTimeSelectorPressed,
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 0,
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Color(0xFFbf3a2b),
                  radius: 50,
                  child: IconButton(
                    iconSize: 70,
                    icon: isRunning
                        ? const Icon(
                            Icons.pause,
                          )
                        : const Icon(
                            Icons.play_arrow,
                          ),
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${(totalPomodoros / 3).floor()}/$totalRounds",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xf5a49d).withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "ROUND",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$totalPomodoros/$totalGoal",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xf5a49d).withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "GOAL",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setSelected(int index) {
    selected = index;
    setState(() {});
  }
}

class TimeSelectWidget extends StatelessWidget {
  final int index;
  final Color textColor;
  final Color backGroundColor;
  final Function(int index) setSelected;

  const TimeSelectWidget({
    super.key,
    required this.index,
    required this.textColor,
    required this.backGroundColor,
    required this.setSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          setSelected(index);
        },
        child: Center(
          child: Text(
            "${index + 1}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
