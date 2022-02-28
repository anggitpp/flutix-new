class Movie {
  final String title;
  final String genre;
  final String language;
  final int star;
  final String image;
  // final List<Cast> casts;
  final String storyline;
  Movie({
    required this.title,
    required this.genre,
    required this.language,
    required this.star,
    required this.image,
    // required this.casts,
    required this.storyline,
  });
}

final List<Movie> dummyMovies = [
  Movie(
    title: 'Avengers',
    genre: 'Action',
    language: 'English',
    star: 6,
    image: 'avengers.jpg',
    // casts: Cast,
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    title: 'Luca',
    genre: 'Drama',
    language: 'English',
    star: 9,
    image: 'luca.jpeg',

    // casts: Cast,
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    title: 'Mulan',
    genre: 'Music',
    language: 'English',
    star: 7,
    image: 'mulan.jpeg',
    // casts: Cast,
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    title: 'Pikachu',
    genre: 'Action',
    language: 'English',
    star: 7,
    image: 'pikachu.jpg',
    // casts: Cast,
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
  Movie(
    title: 'Shang-Chi',
    genre: 'Action',
    language: 'English',
    star: 10,
    image: 'shangchi.jpeg',
    // casts: Cast,
    storyline:
        'The near future, a time when both hope and hard ships drive humanity to look to the stars and beyond while a mysterious.\nNick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth. His squad of superheroes put their minds together to accomplish the task.',
  ),
];
