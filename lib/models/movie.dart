import 'package:flutix/models/cast.dart';

class Movie {
  final int id;
  final String title;
  final String genre;
  final String language;
  final int star;
  final String image;
  final List<Cast> casts;
  final String storyline;
  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.language,
    required this.star,
    required this.image,
    required this.casts,
    required this.storyline,
  });
}

final List<Movie> dummyMovies = [
  Movie(
    id: 1,
    title: 'Avengers',
    genre: 'Action',
    language: 'English',
    star: 6,
    image: 'avengers.jpg',
    casts: dummyCast.where((element) => element.movieId == 1).toList(),
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    id: 2,
    title: 'Luca',
    genre: 'Drama',
    language: 'English',
    star: 9,
    image: 'luca.jpeg',
    casts: dummyCast.where((element) => element.movieId == 1).toList(),
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    id: 3,
    title: 'Mulan',
    genre: 'Music',
    language: 'English',
    star: 7,
    image: 'mulan.jpeg',
    casts: dummyCast.where((element) => element.movieId == 1).toList(),
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    id: 4,
    title: 'Pikachu',
    genre: 'Action',
    language: 'English',
    star: 7,
    image: 'pikachu.jpg',
    casts: dummyCast.where((element) => element.movieId == 1).toList(),
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    id: 5,
    title: 'Shang-Chi',
    genre: 'Action',
    language: 'English',
    star: 10,
    image: 'shangchi.jpeg',
    casts: dummyCast.where((element) => element.movieId == 1).toList(),
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
];
