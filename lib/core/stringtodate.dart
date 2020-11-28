DateTime dateTimeFromBRString(String dateString) {
  String day = dateString.substring(0, 2);
  String month = dateString.substring(3, 5);
  String year = dateString.substring(6, 10);
  print('$year-$month-$day');
  return DateTime.tryParse('$year-$month-$day');
}