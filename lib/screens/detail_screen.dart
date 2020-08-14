import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/details_body.dart';
import '../models/waste_post.dart';

class DetailScreen extends StatelessWidget {
  static final routeName = 'detailScreen';
  final WastePost post;
  DetailScreen({this.post});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: DetailsBody(post: post),
    );
  }
}