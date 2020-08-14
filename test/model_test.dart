import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models/waste_post.dart';

void main() {
  // test for WastePost class
  group('Model Test', (){
    test('Post created with parameters', () {
    final date = DateTime.parse('2020-01-01');
    final imageUrl = 'FAKE';
    final quantity  = 1;
    final longitude = 1.0;
    final latitude = 10.0;

    final WastePost wasteagramPost = WastePost(date: date, imageUrl: imageUrl, quantity: quantity, longitude: longitude, latitude: latitude);

    expect(wasteagramPost.date, date);
    expect(wasteagramPost.imageUrl, imageUrl);
    expect(wasteagramPost.quantity, quantity);
    expect(wasteagramPost.longitude, longitude);
    expect(wasteagramPost.latitude, latitude);
    });

    test('Post created with no parameters and assigning a string to imageUrl', (){
      WastePost post = WastePost();

      post.imageUrl = 'TEST';

      expect(post.date, null);
      expect(post.imageUrl, 'TEST');
      expect(post.quantity, null);
      expect(post.longitude, null);
      expect(post.latitude, null);
    });
  });
}
