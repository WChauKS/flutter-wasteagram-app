import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.documents.isNotEmpty) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 0), 
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              // buildlistitem(context, snapshot.data.documents[index])
              var post = snapshot.data.documents[index];
              return ListTile(
                title: Text(formatDate(post['date'])),
                subtitle: Text(post['quantity'].toString()),
                onTap: () {
                  Navigator.pushNamed(context, 'detailScreen');
                }
              );
            }
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  String formatDate(timestamp) {
    DateTime timeString = DateTime.parse(timestamp.toDate().toString());
    return DateFormat('MM/dd/yyyy - kk:mm').format(timeString);
  }
}