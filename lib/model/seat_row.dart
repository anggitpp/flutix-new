class Seat {
  final int id;
  final List<String> seats;
  Seat({
    required this.id,
    required this.seats,
  });
}

List<Seat> dummySeats = [
  Seat(
    id: 1,
    seats: [
      'A1',
      'A2',
      'A3',
    ],
  ),
  Seat(
    id: 2,
    seats: [
      'B1',
      'B2',
      'B3',
      'B4',
      'B5',
    ],
  ),
  Seat(
    id: 3,
    seats: [
      'C1',
      'C2',
      'C3',
      'C4',
      'C5',
    ],
  ),
  Seat(
    id: 4,
    seats: [
      'D1',
      'D2',
      'D3',
      'D4',
      'D5',
    ],
  ),
  Seat(
    id: 5,
    seats: [
      'E1',
      'E2',
      'E3',
      'E4',
      'E5',
    ],
  ),
];
