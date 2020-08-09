import 'package:intl/intl.dart';

String formatDate(timestamp) {
  if(timestamp is! DateTime){
    DateTime time = DateTime.parse(timestamp.toDate().toString());
    return DateFormat('MM/dd/yyyy - kk:mm').format(time);
  } else {
    return DateFormat('MM/dd/yyyy - kk:mm').format(timestamp);
  }
}