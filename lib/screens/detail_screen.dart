import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  static final routeName = 'detailScreen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      body: detailsView(),
    );
  }

  Widget detailsView() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('date goes here'),
          Text('image goes here'),
          Text('number goes here'),
          Text('location(long/lat) goes here'),
        ],
      ),
    );
  }
}