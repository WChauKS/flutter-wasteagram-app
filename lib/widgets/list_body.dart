import 'package:flutter/material.dart';

class PostListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 0), 
      itemCount: 1,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Test'),
          subtitle: Text('TEST'),
          onTap: () {
            Navigator.pushNamed(context, 'detailScreen');
          }
        );
      }
    );
  }
}