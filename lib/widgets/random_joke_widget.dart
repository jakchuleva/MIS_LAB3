import 'package:flutter/material.dart';

import '../models/joke.dart';

class RandomJokeWidget extends StatelessWidget {
  final Joke joke;
  const RandomJokeWidget({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    joke.setup,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    joke.punchline,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.purpleAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                ]),
          ),
        ));
  }
}
