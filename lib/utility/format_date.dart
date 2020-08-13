import 'package:intl/intl.dart';

String formatDate(timestamp) {
  if(timestamp is! DateTime){
    DateTime time = DateTime.parse(timestamp.toDate().toString());
    // formatting for the list screen
    return DateFormat('EEE, MM/dd/yyyy').format(time);
  } else {
    // formatting for the details screen
    return DateFormat('MM/dd/yyyy - kk:mm').format(timestamp);
  }
}