import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/screens/detail_screen.dart';

class PostListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.documents.isNotEmpty) {
          return postListView(snapshot);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget postListView(snapshot) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 0), 
      itemCount: snapshot.data.documents.length,
      itemBuilder: (context, index) {
        // buildlistitem(context, snapshot.data.documents[index])
        var post = snapshot.data.documents[index];
        print(post);
        return ListTile(
          title: Text(formatDate(post['date'])),
          subtitle: Text(post['quantity'].toString()),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => 
                DetailScreen(
                  date: formatDate(post['date']),
                  imageUrl: post['imageUrl'],
                  quantity: post['quantity'],
                  longitude: post['longitude'],
                  latitude: post['latitude']
                )
              )
            );// Navigator.pushNamed(context, 'detailScreen');
          }
        );
      }
    );
  }

  String formatDate(timestamp) {
    DateTime timeString = DateTime.parse(timestamp.toDate().toString());
    return DateFormat('MM/dd/yyyy - kk:mm').format(timeString);
  }
}