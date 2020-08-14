import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsImage extends StatelessWidget {
  final imageUrl;
  DetailsImage({this.imageUrl});
  
  @override
  Widget build(BuildContext context) {
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
}