import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/img_arg.dart';

class NewPostScreen extends StatelessWidget {
  static final routeName = 'newPostScreen';

  @override
  Widget build(BuildContext context) {
    final ImgArg arg = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
      ),
      body: Form(
        key: null,
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
      bottomNavigationBar: uploadButton(context),
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