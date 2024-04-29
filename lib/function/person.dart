import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/wepDeveloper.dart';

class CardPage extends StatelessWidget {
  final String url;
  final String name;
  const CardPage({super.key, required this.url, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              image:
              DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
        ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class LearnButton extends StatelessWidget {
  final String CourseName;
  final String image;
  const LearnButton({super.key, required this.CourseName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15,bottom: 15),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/${image}.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide.none),
              shape: MaterialStateProperty.all(LinearBorder.none),
              elevation: MaterialStateProperty.all(0),
              fixedSize: MaterialStateProperty.all<Size>(
                const Size.fromWidth(double.infinity),
              ),
              backgroundColor:
              MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              image == "coding" ? Navigator.push(context, MaterialPageRoute(builder: (context) => const WebDeveloper(),),) : null;
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      CupertinoIcons.doc_text_fill,
                      color: Colors.deepPurpleAccent,
                    ),
                    Text(
                      "24 Lesson",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.play,
                      color: Colors.orange,
                    ),
                    Text(
                      "2Hr 30 min",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                  width: 20,
                ),
                
                Text(
                  CourseName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

