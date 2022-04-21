import 'dart:io';

class User {
  final String name;
  final String email;
  final List<String> genres;
  final String language;
  final File image;
  User({
    required this.name,
    required this.email,
    required this.genres,
    required this.language,
    required this.image,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    List<String>? genres,
    String? language,
    File? image,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      genres: genres ?? [],
      language: language ?? '',
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, genres: $genres, language: $language, image: $image)';
  }
}
