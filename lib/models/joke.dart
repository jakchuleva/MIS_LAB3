class Joke {
  int id;
  String type;
  String setup;
  String punchline;
  bool isFavorited;

  Joke(
      {required this.id,
        required this.type,
        required this.setup,
        required this.punchline,
        this.isFavorited = false, });

  Joke.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        type = data['type'],
        setup = data['setup'],
        punchline = data['punchline'],
        isFavorited = false;


  Map<String, dynamic> toJson() =>
      {'id': id, 'type': type, 'setup': setup, 'punchline': punchline, 'isFavorited': isFavorited, };
}
