import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/post_dto.dart';
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
            Semantics(child: detailPadding(formatDate(post.date),20.0), label: 'Date post was created on'),
            SizedBox(
              height: 375,
              child: Semantics(
                child: loadImage(post.imageUrl),
                image: true,
                label: 'Image from Firebase storage bucket'
                )
              ),
            Semantics(child: detailPadding(post.quantity.toString(),20.0), label: 'Number of wasted donuts'),
            Semantics(child: detailPadding('Longitude: ${post.longitude.toString()} / Latitude: + ${post.latitude.toString()}', 15.0),
              label: 'Longitude and Latitude of where post was submitted',
            ),
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