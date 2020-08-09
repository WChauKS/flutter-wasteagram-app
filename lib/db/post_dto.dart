class PostDTO {
  DateTime date;
  // Url imageUrl;
  int quantity;
  // int longitude;
  // int latitude;
  
  // String toString() {
  //   return 'date: $date, imageUrl: $imageUrl, quantity: $quantity, longitude: $longitude, latitude: $latitude';
  // }
  Map<String, dynamic> toMap() {
    return {
      // 'date': this.date, 'imageUrl': this.imageUrl, 'quantity': this.quantity, 'longitude': this.longitude, 'latitude': this.latitude
      'date': this.date,  'quantity': this.quantity
    };
  }
}