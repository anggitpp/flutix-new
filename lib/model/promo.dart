class Promo {
  final String title;
  final String subtitle;
  final int percent;
  Promo({
    required this.title,
    required this.subtitle,
    required this.percent,
  });
}

final List<Promo> dummyPromos = [
  Promo(
    title: 'Student Holiday',
    subtitle: 'Maximal only for two people',
    percent: 50,
  ),
  Promo(
    title: 'Family Club',
    subtitle: 'Minimal for three members',
    percent: 70,
  ),
  Promo(
    title: 'Weekend Deals',
    subtitle: 'Only valid in saturday and sunday',
    percent: 45,
  ),
];
