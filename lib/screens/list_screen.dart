import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../models/img_arg.dart';
import '../widgets/list_body.dart';

class PostListScreen extends StatefulWidget {

  static final routeName = '/';

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // if null return Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram + NUM'),
        centerTitle: true,
      ),
      floatingActionButton: cameraFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PostListBody(),
    );
  }

  Widget cameraFab() {
    return FloatingActionButton(
      // open gallery/take pic
      onPressed: () async {
        image = null;   // set to null in case user hits back after going to newPostScreen, which would mean that the user cancelled their upload
        await getImage();
        Navigator.pushNamed(
          context, 
          'newPostScreen',
          arguments: ImgArg(image: image)
        );
      },
      child: Icon(Icons.camera_alt),
    );
  }

  void pushNewPostScreen(context) {
    Navigator.pushNamed(context, 'newPostScreen');
  }
}