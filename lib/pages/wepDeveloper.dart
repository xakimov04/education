import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import '../data/names.dart';

class WebDeveloper extends StatefulWidget {
  const WebDeveloper({Key? key}) : super(key: key);

  @override
  State<WebDeveloper> createState() => _WebDeveloperState();
}

class _WebDeveloperState extends State<WebDeveloper> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Course Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Your action here
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: Image.asset("images/love.png"),
            ),
          )
        ],
      ),
      bottomNavigationBar: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(300, 60)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orange[800])),
              onPressed: () {},
              child: const Text(
                "Purchase Only - \$28",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple)),
                    onPressed: () {},
                    child: const Text(
                      "Playlist (27)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Descriptions"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: CourseDetails.details.length,
                itemBuilder: (context, index) {
                  var item = CourseDetails.details[index];
                  return _Course(select: item["select"], name: item["name"]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Course extends StatelessWidget {
  final bool select;
  final String name;

  const _Course({super.key, required this.select, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.play_circle_fill,
            color: select ? Colors.orange[900] : Colors.orangeAccent,
            size: 50,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "2 Min 43 sec",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(
            select ? CupertinoIcons.lock_open_fill : CupertinoIcons.lock_fill,
            color: select ? Colors.blue : Colors.lightBlueAccent,
            size: 30,
          ),
        ],
      ),
    );
  }
}
