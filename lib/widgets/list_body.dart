import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/waste_post.dart';
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
        return Semantics(
          child: ListTile(
            title: Text(formatDate(post['date']), style: TextStyle(fontSize: 18)),
            trailing: Text(post['quantity'].toString(), style: TextStyle(fontSize: 25),),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => DetailScreen(post: WastePost.firebaseData(post)))
              );
            }
          ),
          label: '${post['quantity'].toString()} donuts were wasted on ${formatDate(post['date'])}',
          onTapHint: 'View details of post created on ${formatDate(post['date'])}',
        );
      }
    );
  }
}