import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../db/post_dto.dart';
import '../screens/detail_screen.dart';
import '../utility/format_date.dart';

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
        var post = snapshot.data.documents[index];
        return ListTile(
          title: Text(formatDate(post['date'])),
          trailing: Text(post['quantity'].toString()),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetailScreen(post: PostDTO.firebaseData(post)))
            );
          }
        );
      }
    );
  }
}