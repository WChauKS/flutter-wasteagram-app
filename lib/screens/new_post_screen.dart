import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../db/post_dto.dart';
import '../models/img_arg.dart';

class NewPostScreen extends StatefulWidget {
  static final routeName = 'newPostScreen';

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final formKey = GlobalKey<FormState>();
  final postDTO = PostDTO();
  LocationData locationData;
    
  @override
  Widget build(BuildContext context) {    
    final ImgArg arg = ModalRoute.of(context).settings.arguments;
    retrieveLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 375,
                child: arg.image == null ? Text('No Image Selected.') : Image.file(arg.image)
              )
            ),
            inputWasteField()
          ]
        )
      ),
      bottomNavigationBar: uploadButton(context, formKey, arg),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget inputWasteField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(hintText: 'Enter number of wasted items'),
        onSaved: (value) {
          postDTO.quantity = int.parse(value);
        },
        validator: (value) {
          if(value.isEmpty) {
            return 'Please enter the number of wasted Items';
          } else {
            return null;
          }
        },
      )
    );
  }

  Widget uploadButton(context, formKey, arg) {
    return SizedBox(
      height: 80,
      child:RaisedButton(
        onPressed: () async {
          if(formKey.currentState.validate()) {
            formKey.currentState.save();
            postDTO.date = DateTime.now();
            retrieveLocation();
            postDTO.imageUrl = arg.url;
            postDTO.longitude = locationData.longitude;
            postDTO.latitude = locationData.latitude;
            // print('upload to firebase');
            Firestore.instance.collection('posts').add(postDTO.toMap());
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.cloud_upload, size: 80,),
      )
    );
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
  }
}