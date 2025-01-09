import 'dart:convert';
import '../models/joke.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<String>> getTypes() async {
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  static Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(
        Uri.parse('https://official-joke-api.appspot.com/jokes/$type/ten'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((j) => Joke.fromJson(j))
          .toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  static Future<Map<String, dynamic>> getRandomJoke() async {
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
