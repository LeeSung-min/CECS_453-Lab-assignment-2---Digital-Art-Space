import 'package:flutter/material.dart';

void main() {
  runApp(const ArtSpace());
}

class ArtSpace extends StatefulWidget {
  const ArtSpace({super.key});

  @override
  State<ArtSpace> createState() {
    return ArtSpaceState();
  }
}

class ArtSpaceState extends State<ArtSpace> {
  int currentIndex = 0;

  final List<String> images = [
    'assets/images/art1.jpg',
    'assets/images/art2.jpg',
    'assets/images/art3.jpg',
    'assets/images/art4.jpg',
  ];

  final List<String> titles = [
    'Woman with a Parasol - Madame Monet and Her Son',
    'Arnolfini Portrait',
    'Sunflowers',
    'Napoleon Crossing the Alps',
  ];

  final List<String> artist = [
    'Claude Monet',
    'Jan van Eyck',
    'Vincent van Gogh',
    'Jacques-Louis David',
  ];

  final List<String> date = ['(1875)', '(1434)', '(1888)', '(1801)'];

  void nextArt() {
    setState(() {
      currentIndex++;

      if (currentIndex >= images.length) {
        currentIndex = 0;
      }
    });
  }

  void prevArt() {
    setState(() {
      currentIndex--;

      if (currentIndex < 0) {
        currentIndex = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 100),
                artWork(),
                SizedBox(height: 90),
                artTitle(),
                SizedBox(height: 40),
                buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget artWork() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black, blurRadius: 30, offset: Offset(3, 13)),
        ],
      ),
      child: Image.asset(
        images[currentIndex],
        width: 500,
        height: 600,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget artTitle() {
    return Column(
      children: [
        Container(
          height: 149,
          width: 500,
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(
            color: const Color.fromARGB(148, 124, 150, 223),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titles[currentIndex],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 23),
              Row(
                children: [
                  Text(
                    artist[currentIndex],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Text(date[currentIndex]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buttons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: prevArt,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 48, 77, 104),
                foregroundColor: Colors.white,
              ),
              child: const Text('Previous'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: nextArt,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 48, 77, 104),
                foregroundColor: Colors.white,
              ),
              child: const Text('Next', style: TextStyle(fontFamily: 'Roboto')),
            ),
          ],
        ),
      ],
    );
  }
}
