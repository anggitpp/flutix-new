class Cinema {
  final int id;
  final String name;

  Cinema({
    required this.id,
    required this.name,
  });
}

final List<Cinema> dummyCinemas = [
  Cinema(
    id: 1,
    name: 'Paris Van Java',
  ),
  Cinema(
    id: 2,
    name: 'Bekasi Cyber Park',
  ),
  Cinema(
    id: 3,
    name: 'Grand Metropolitaan Mall',
  ),
];
