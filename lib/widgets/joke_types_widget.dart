import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';

class JokeTypes extends StatefulWidget {
  final List<String> jokeTypes;

  const JokeTypes({super.key, required this.jokeTypes});

  @override
  State<JokeTypes> createState() => _JokeTypesState();
}

class _JokeTypesState extends State<JokeTypes> {
  // List to store favorite jokes
  List<Joke> favoriteJokes = [];

  // Method to toggle the favorite status of a joke
  void toggleFavorite(Joke joke) {
    setState(() {
      if (favoriteJokes.contains(joke)) {
        favoriteJokes.remove(joke); // Remove from favorites
      } else {
        favoriteJokes.add(joke); // Add to favorites
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Getting the joke type passed through the route
    final String type = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text('$type Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No jokes available'));
          }

          final jokes = snapshot.data!;

          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              final joke = jokes[index];

              return Card(
                child: ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                  trailing: IconButton(
                    icon: Icon(
                      favoriteJokes.contains(joke)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favoriteJokes.contains(joke)
                          ? Colors.red
                          : null,
                    ),
                    onPressed: () {
                      toggleFavorite(joke); // Toggle favorite status for the joke
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
