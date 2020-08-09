import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WasteagramAppBar extends StatefulWidget {
  @override
  _WasteagramAppBarState createState() => _WasteagramAppBarState();
}

class _WasteagramAppBarState extends State<WasteagramAppBar> {
  String title = 'Wasteagram';
  int sum;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          sum = 0;
          for(var i=0; i<snapshot.data.documents.length; i++) {
            sum += snapshot.data.documents[i]['quantity'];
          }
          return AppBar(
            title: Text(title + ' : ' + sum.toString()),
            centerTitle: true,
          );
        }
      }
    );
  }
}