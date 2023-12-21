import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  final String todo;
  final List<String> participants;
  final DateTime startTime;
  final DateTime endTime;
  CardWidget({
    super.key,
    required this.color,
    required this.todo,
    required this.participants,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    var parse = DateFormat('Hm').parse('14:23:01');
    print(parse);
    return Flexible(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 30,
              bottom: 5,
              right: 40,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      DateFormat.Hm().format(startTime).split(":")[0],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      DateFormat.Hm().format(startTime).split(":")[1],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      DateFormat.Hm().format(endTime).split(":")[0],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      DateFormat.Hm().format(endTime).split(":")[1],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (String participant in participants)
                              Text(
                                participant,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
