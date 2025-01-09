import 'package:flutter/material.dart';
import 'screens/favorite_jokes.dart';
import 'screens/home.dart';
import 'screens/jokes.dart';
import 'screens/random_joke.dart';
import 'models/joke.dart';

void main() => runApp(const MyApp());

List<Joke> favoriteJokes = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/random_joke': (context) => const RandomJoke(),
        '/favorites': (context) => const FavoriteJokes(),
      },
    );
  }
}
