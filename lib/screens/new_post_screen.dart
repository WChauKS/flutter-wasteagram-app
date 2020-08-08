import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewPostScreen extends StatelessWidget {
  static final routeName = 'newPostScreen';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
      ),
      body: Form(
        key: null,
        child: newPostForm(),
      ),
      bottomNavigationBar: uploadButton(context),
    );
  }

  Widget newPostForm() {
    return Column(
      children: [
        imageDisplay(),
        inputWasteField()
      ],
    );
  }

  Widget imageDisplay() {
    return Center(
      child: SizedBox(
        height: 375,
        child: Text('image goes here')
      )
    );
  }

  Widget inputWasteField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(hintText: 'Enter number of wasted items'),
        onSaved: (value) { },
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

  Widget uploadButton(context) {
    return SizedBox(
      height: 80,
      child:RaisedButton(
        onPressed: () {
          print('validate -> save');
          print('upload to firebase');
          Navigator.of(context).pop();
        },
        child: Icon(Icons.cloud_upload, size: 80,),
      )
    );
  }
}