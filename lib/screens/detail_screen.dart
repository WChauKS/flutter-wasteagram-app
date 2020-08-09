import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/post.dart';

class DetailScreen extends StatelessWidget {
  static final routeName = 'detailScreen';
  final String date, imageUrl;
  final int quantity;
  final double longitude, latitude;
  DetailScreen({this.date, this.imageUrl, this.quantity, this.longitude, this.latitude});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: detailsView(),
    );
  }

  Widget detailsView() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            detailPadding(date,20.0),
            SizedBox(
              height: 375,
              // child: Image.network(imageUrl)
              child: loadImage(imageUrl)
              ),
            // Text(imageUrl.toString()),
            detailPadding(quantity.toString(),20.0),
            detailPadding('Longitude: ${longitude.toString()} / Latitude: + ${latitude.toString()}', 10.0),
          ],
        ),
      ),
    );
  }

  Widget loadImage(imageUrl) {
    return Stack(
      children: [
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: imageUrl)
        )
      ],
    );
  }
  

  Widget detailPadding(txt, size) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(txt, style: TextStyle(fontSize: size),)
    );
  }
}