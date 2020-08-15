import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import '../models/img_arg.dart';
import '../widgets/fake_end_drawer.dart';
import '../widgets/list_body.dart';
import '../widgets/app_bar.dart';

class PostListScreen extends StatefulWidget {

  static final routeName = '/';

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  File image;
  String url;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    StorageReference storageReference = FirebaseStorage.instance.ref().child(Path.basename(pickedFile.path) + DateTime.now().toIso8601String());
    StorageUploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
    await uploadTask.onComplete;
    url = await storageReference.getDownloadURL();
    setState(() {
      image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: WasteagramAppBar(),
      ),
      endDrawer: FakeEndDrawerForTesting(),
      floatingActionButton: Semantics(
        child: cameraFab(),
        button: true,
        enabled: true,
        onTapHint: 'Select an image from gallery',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PostListBody(),
    );
  }

  Widget cameraFab() {
    return FloatingActionButton(
      onPressed: () async {
        image = null;   // set to null in case user hits back after going to newPostScreen, which would mean that the user cancelled their upload
        await getImage();
        Navigator.pushNamed(
          context, 
          'newPostScreen',
          arguments: ImgArg(image: image, url: url)
        );
      },
      child: Icon(Icons.camera_alt),
    );
  }

  void pushNewPostScreen(context) {
    Navigator.pushNamed(context, 'newPostScreen');
  }
}