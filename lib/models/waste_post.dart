// Model Class

class WastePost {
  DateTime date;
  String imageUrl;
  int quantity;
  double longitude;
  double latitude;

  WastePost({this.date, this.imageUrl, this.quantity, this.latitude, this.longitude});
  
  Map<String, dynamic> toMap() {
    return {
      'date': this.date, 'imageUrl': this.imageUrl, 'quantity': this.quantity, 'longitude': this.longitude, 'latitude': this.latitude
    };
  }

  WastePost.firebaseData(post) {
    this.date = post['date'].toDate();
    this.imageUrl = post['imageUrl'];
    this.quantity = post['quantity'];
    this.longitude = post['longitude'];
    this.latitude = post['latitude'];
  }
}