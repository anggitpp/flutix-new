class Cast {
  final int id;
  final int movieId;
  final String name;
  final String imageURL;
  Cast({
    required this.id,
    required this.movieId,
    required this.name,
    required this.imageURL,
  });
}

final List<Cast> dummyCast = [
  Cast(
    id: 1,
    movieId: 1,
    name: 'Robert Downey Jr',
    imageURL: 'avengers.jpg',
  ),
  Cast(
    id: 2,
    movieId: 1,
    name: 'Thor',
    imageURL: 'avengers.jpg',
  ),
  Cast(
    id: 3,
    movieId: 1,
    name: 'Robert Downey Jr',
    imageURL: 'avengers.jpg',
  ),
  Cast(
    id: 4,
    movieId: 1,
    name: 'Robert Downey Jr',
    imageURL: 'avengers.jpg',
  ),
  Cast(
    id: 5,
    movieId: 1,
    name: 'Robert Downey Jr',
    imageURL: 'avengers.jpg',
  ),
];
