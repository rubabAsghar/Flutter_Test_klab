import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  final double width;
  final String title;
  final String body;

  const TravelCard({
    super.key,
    required this.width,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/road.jpg",
              width: width * 0.8,
              height: width * 0.9,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width * 0.8,
            height: width * 0.9,
            color: Colors.white.withOpacity(0.4),
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.68,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: const EdgeInsets.only(top: 15, left: 15),
                        padding: EdgeInsets.symmetric(
                          vertical: width * 0.02,
                          horizontal: width * 0.06,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/travel.png",
                              scale: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Travel",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          body,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        width: width - 100,
                        child: ListTile(
                          leading: Image.asset("assets/9.png"),
                          title: const Text(
                            "Meranda Khalan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            "STUTTGART",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: const Icon(Icons.thumb_up, color: Colors.white, size: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: const Icon(Icons.compare_arrows, color: Colors.white, size: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white.withOpacity(0.4),
                          child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
