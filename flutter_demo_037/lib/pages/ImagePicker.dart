
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {

  File _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("image");

    _getTest();
  }

  _getTest() async{

       //下面为具体网址，需要自己修改
      String url = "http://192.168.122.2:8001/upload/test";
      var client = http.Client();
      http.Response response = await http.get(url);
      setState(() {
        final data = json.encode(response.body);
        print('data:'+data);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePicker"),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            RaisedButton(
              child: Text("拍照"),
              onPressed: _takePhone,
            ),

            SizedBox(height: 20,),

            RaisedButton(
              child: Text("相册"),
              onPressed: _openGallery,
            ),

            SizedBox(height: 20,),

            _buildImage(),
            
          ]
        )
      ),
    );
  }

  // 拍照
  _takePhone() async{

    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
    );

    setState(() {
      this._image = image;
    });

    this._uploadImage(this._image);

  }

  // 打开相册
  _openGallery() async{

    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400
    );

    setState(() {
      this._image = image;
    });

    this._uploadImage(this._image);

  }

  Widget _buildImage(){

    if (this._image == null) {
      return Text("请选择图片..");
    }

    print(this._image);

    return Image.file(this._image);
  }

  // 上传图片
  _uploadImage(File _imageDir) async{

    print("upload");

    var fileDir = _imageDir.path; 

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(fileDir,filename: "xxx.jpg")
    });

    var response = await Dio().post(
      "http://192.168.122.2:8001/upload/image", 
      data: formData,
    );

    print(response);
  }
}  