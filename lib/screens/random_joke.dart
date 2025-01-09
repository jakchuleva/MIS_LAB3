import 'package:flutter/material.dart';

import '../models/joke.dart';
import '../services/api_service.dart';
import '../widgets/random_joke_widget.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({Key? key}) : super(key: key);

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  Joke joke = Joke(id: 0, punchline: "", setup: "", type: "");

  @override
  void initState() {
    super.initState();
    getRandomJoke();
  }

  Future<void> getRandomJoke() async {
    final joke1 = await ApiService.getRandomJoke();
    setState(() {
      joke = Joke.fromJson(joke1 as Map<String, dynamic>);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text("Random Joke"),
      ),
      body: RandomJokeWidget(joke: joke),
    );
  }
}
