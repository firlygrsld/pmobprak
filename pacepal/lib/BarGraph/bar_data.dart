import 'package:pacepal/BarGraph/individual_bar.dart';

class BarData {
  final double minAmount;
  final double senAmount;
  final double selAmount;
  final double rabAmount;
  final double kamAmount;
  final double jumAmount;
  final double sabAmount;

  BarData({
    required this.minAmount,
    required this.senAmount,
    required this.selAmount,
    required this.rabAmount,
    required this.kamAmount,
    required this.jumAmount,
    required this.sabAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: minAmount),
      IndividualBar(x: 1, y: senAmount),
      IndividualBar(x: 2, y: selAmount),
      IndividualBar(x: 3, y: rabAmount),
      IndividualBar(x: 4, y: kamAmount),
      IndividualBar(x: 5, y: jumAmount),
      IndividualBar(x: 6, y: sabAmount),
    ];
  }
}
