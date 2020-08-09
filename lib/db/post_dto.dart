class PostDTO {
  DateTime date;
  String imageUrl;
  int quantity;
  double longitude;
  double latitude;
  
  Map<String, dynamic> toMap() {
    return {
      'date': this.date, 'imageUrl': this.imageUrl, 'quantity': this.quantity, 'longitude': this.longitude, 'latitude': this.latitude
      // 'date': this.date, 'imageUrl': this.imageUrl, 'quantity': this.quantity
    };
  }
}