import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';
import '../models/waste_post.dart';
import '../utility/format_date.dart';
import '../widgets/detail_text.dart';
import '../widgets/details_image.dart';

class DetailsBody extends StatelessWidget {
  final WastePost post;
  DetailsBody({this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Semantics(child: DetailText(txt: formatDate(post.date), size: 20.0), label: 'Date post was created on'),
            SizedBox(
              height: 375,
              child: Semantics(
                // child: loadImage(post.imageUrl),
                child: DetailsImage(imageUrl: post.imageUrl),
                image: true,
                label: 'Image from Firebase storage bucket'
                )
              ),
            Semantics(child: DetailText(txt: post.quantity.toString(), size: 20.0), label: 'Number of wasted donuts'),
            Semantics(child: DetailText(txt: 'Longitude: ${post.longitude.toString()} / Latitude: + ${post.latitude.toString()}', size: 15.0),
              label: 'Longitude and Latitude of where post was submitted',
            ),
          ],
        ),
      ),
    );
  }
}