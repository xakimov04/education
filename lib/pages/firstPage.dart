import 'package:flutter/material.dart';
import 'package:test/pages/homePage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FirstBody(),
    );
  }
}

class FirstBody extends StatelessWidget {
  const FirstBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.maxFinite,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/student.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
                bottomLeft: Radius.circular(150),
              ),
            ),
          ),
          const Text(
            "A Classical Education for the Future",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.greenAccent),
              elevation: MaterialStateProperty.all<double>(10),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              fixedSize: MaterialStateProperty.all<Size>(const Size(150, 60)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
