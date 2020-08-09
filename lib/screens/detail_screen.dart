import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../db/post_dto.dart';
import '../utility/format_date.dart';

class DetailScreen extends StatelessWidget {
  static final routeName = 'detailScreen';
  final PostDTO post;
  DetailScreen({this.post});
  
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
            detailPadding(formatDate(post.date),20.0),
            SizedBox(
              height: 375,
              child: loadImage(post.imageUrl)
              ),
            detailPadding(post.quantity.toString(),20.0),
            detailPadding('Longitude: ${post.longitude.toString()} / Latitude: + ${post.latitude.toString()}', 15.0),
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