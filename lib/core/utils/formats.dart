import 'package:intl/intl.dart';


convertToCelcius(double temp) {
  final int celciusTemp = (temp - 273.15).toInt();
  return celciusTemp;
}

convertToTime(int time) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  final formattedTime = DateFormat('HH:mm').format(dateTime);
  return formattedTime;
}

convertToDate(int date) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
  final formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
  return formattedDate;
}
