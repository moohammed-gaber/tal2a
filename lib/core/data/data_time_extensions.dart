import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String getFormattedMMDD([String? locale]) =>
      DateFormat('dd/MM', locale).format(this);

  String getFormattedYYMMDD([String? locale]) =>
      DateFormat('dd/MM/yy', locale).format(this);

  String formatPt() => DateFormat('dd-MM-yyyy').format(this);

  String formatEn() => DateFormat(
        'yyyy-MM-dd',
      ).format(this);

  String get dayName => DateFormat('EEEE').format(this);

  String formatHourly([String? locale]) =>
      DateFormat('yyyy-MM-dd hh:mm', locale).format(this);


  String toTime() => DateFormat(
        'HH:mm',
      ).format(this);

  String toTimePMAM() => DateFormat(
        'hh:mm a',
      ).format(this);
}
