import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? imagePath;

  Future<void> selectImage() async {
    final picker = ImagePicker();
    XFile? pickerImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerImage != null) {
      setState(() {
        imagePath = pickerImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("사진 업로드"),
        leading: IconButton(
          icon: const Text("취소"),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Text("저장"),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: selectImage,
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 0.5,
                        color: const Color(0xFFAAAAAA),
                      ),
                    ),
                    child: imagePath != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.file(
                        File(imagePath!),
                        width: 300.0,
                        height: 300.0,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.upload,
                          size: 50.0,
                        ),
                        Text("고양이 사진 업로드"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
