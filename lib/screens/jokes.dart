import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';
import '../main.dart';

class JokeTypesScreen extends StatefulWidget {
  final String jokeType;

  const JokeTypesScreen({super.key, required this.jokeType});

  @override
  State<JokeTypesScreen> createState() => _JokeTypesScreenState();
}

class _JokeTypesScreenState extends State<JokeTypesScreen> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  Future<void> fetchJokes() async {
    final fetchedJokes = await ApiService.getJokesByType(widget.jokeType);
    setState(() {
      jokes = fetchedJokes;
    });
  }

  void toggleFavorite(Joke joke) {
    setState(() {
      joke.isFavorited = !joke.isFavorited;
      if (joke.isFavorited) {
        favoriteJokes.add(joke);
      } else {
        favoriteJokes.removeWhere((fav) => fav.id == joke.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.jokeType} Jokes'),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return Card(
            child: ListTile(
              title: Text(joke.setup),
              subtitle: Text(joke.punchline),
              trailing: IconButton(
                icon: Icon(
                  joke.isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: joke.isFavorited ? Colors.red : null,
                ),
                onPressed: () => toggleFavorite(joke),
              ),
            ),
          );
        },
      ),
    );
  }
}
