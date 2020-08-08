import 'package:flutter/material.dart';
import '../widgets/list_body.dart';

class PostListScreen extends StatelessWidget {

  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    // if null return Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram + NUM'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        // open gallery/take pic
        onPressed: () => pushNewPostScreen(context),
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PostListBody(),
    );
  }

  void pushNewPostScreen(context) {
    Navigator.pushNamed(context, 'newPostScreen');
  }
}