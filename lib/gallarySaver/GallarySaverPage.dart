import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class GallarySaverPage extends StatefulWidget {
  const GallarySaverPage({Key? key}) : super(key: key);

  @override
  _GallarySaverPageState createState() => _GallarySaverPageState();
}

class _GallarySaverPageState extends State<GallarySaverPage> {
  String firstButtonText = 'Take photo';
  String secondButtonText = 'Record video';
  double textSize = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: _takePhoto,
                  child: Text(firstButtonText,
                      style:
                          TextStyle(fontSize: textSize, color: Colors.white)),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
                child: SizedBox.expand(
              child: TextButton(
                //onPressed: saveNetworkVideo,
                onPressed: _recordVideo,
                child: Text(secondButtonText,
                    style:
                        TextStyle(fontSize: textSize, color: Colors.blueGrey)),
              ),
            )),
            flex: 1,
          )
        ],
      ),
    );
  }

  void _takePhoto() async {
    // ignore: invalid_use_of_visible_for_testing_member
    ImagePicker.platform
        .getImage(source: ImageSource.camera)
        .then((recordedImage) {
      if (recordedImage != null && recordedImage.path.isNotEmpty) {
        setState(() {
          firstButtonText = 'saving in progress...';
        });
        GallerySaver.saveImage(recordedImage.path).then((value) {
          setState(() {
            firstButtonText = 'save image';
          });
        });
      }
    });
  }

  void _recordVideo() {
    // ignore: invalid_use_of_visible_for_testing_member
    ImagePicker.platform.getVideo(source: ImageSource.camera).then((value) {
      if (value != null && value.path.isNotEmpty) {
        setState(() {
          secondButtonText = 'saving in progress...';
        });
        GallerySaver.saveVideo(value.path).then((value) {
          setState(() {
            secondButtonText = 'Video save';
          });
        });
      }
    });
  }

  void saveNetworkVideo() {
    String path =
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4';
    GallerySaver.saveVideo(path).then((value) {
      if (kDebugMode) {
        print("Video Save..");
      }
    });
  }

  void saveNetwotkImage() {
    String path =
        'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';

    GallerySaver.saveImage(path).then((value) {
      if (kDebugMode) {
        print('Image Save');
      }
    });
  }
}
