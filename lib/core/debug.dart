import 'package:intl/intl.dart';

printE(String dataToPrint) {
  print(DateFormat.Hms().format(DateTime.now()) + ' - ' + dataToPrint);
}
