// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String numberFormatter(double value) {
  final NumberFormat formatter = NumberFormat("#,###.##");
  return formatter.format(value);
}
