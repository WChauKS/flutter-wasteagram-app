// MODEL CLASS FOR POST

import 'dart:html';

class Post {
  final DateTime date;
  final Url imageUrl;
  final int quantity;
  final int longitude;
  final int latitude;

  Post({this.date, this.imageUrl, this.quantity, this.latitude, this.longitude});
}