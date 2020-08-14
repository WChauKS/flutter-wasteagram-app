// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models/waste_post.dart';

void main() {
  // test for WastePost class
  test('Post created from map', () {
    final date = DateTime.parse('2020-01-01');
    final imageUrl = 'FAKE';
    final quantity  = 1;
    final longitude = 1.0;
    final latitude = 10.0;

    final wasteagramPost = WastePost(date: date, imageUrl: imageUrl, quantity: quantity, longitude: longitude, latitude: latitude);

    expect(wasteagramPost.date, date);
    expect(wasteagramPost.imageUrl, imageUrl);
    expect(wasteagramPost.quantity, quantity);
    expect(wasteagramPost.longitude, longitude);
    expect(wasteagramPost.latitude, latitude);

    // print(wasteagramPost);
    print('Model test was ran.');
  });
}
