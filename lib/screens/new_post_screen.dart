import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/waste_post.dart';
import '../models/img_arg.dart';

class NewPostScreen extends StatefulWidget {
  static final routeName = 'newPostScreen';

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final formKey = GlobalKey<FormState>();
  final wastePost = WastePost();
  LocationData locationData;
    
  @override
  Widget build(BuildContext context) {    
    final ImgArg arg = ModalRoute.of(context).settings.arguments;
    // retrieveLocation();
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
              child: Semantics(
                child: SizedBox(
                  height: 375,
                  child: arg.image == null ? Text('No Image Selected.') : Image.file(arg.image)
                ),
                image: true,
                label: 'Image previously chosen from gallery',
              )
            ),
            Semantics(
              child: inputWasteField(),
              textField: true,
              enabled: true,
            )
          ]
        )
      ),
      bottomNavigationBar: Semantics(
        child: uploadButton(context, formKey, arg),
        button: true,
        enabled: true,
        onTapHint: 'Upload new post to Firebase',
      ),
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
          wastePost.quantity = int.parse(value);
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
      child: RaisedButton(
        onPressed: () async {
          if(formKey.currentState.validate()) {
            formKey.currentState.save();
            wastePost.date = DateTime.now();
            locationData = await retrieveLocation();
            wastePost.imageUrl = arg.url;
            wastePost.longitude = locationData.longitude;
            wastePost.latitude = locationData.latitude;
            Firestore.instance.collection('posts').add(wastePost.toMap());
            Navigator.of(context).pop();
          }
        },
        child: Icon(Icons.cloud_upload, size: 80,),
      )
    );
  }

  Future<LocationData> retrieveLocation() async {
    var locationService = Location();
    return await locationService.getLocation();
  }
}