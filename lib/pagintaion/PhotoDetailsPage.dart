import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class PhotoDetails extends StatefulWidget {
  PhotoDetails({
    Key? key,
    required this.tag,
    required this.url,
  }) : super(key: key);
  String tag;
  String url;

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _imageFile;
  int _progress = 0;

  List<File> _mulitpleFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _downloadImage(widget.url);
        },
        child: const Icon(Icons.download),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: widget.tag,
            child: Image.network(
              widget.url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: AppBar(
            title: const Text("Transparent AppBar"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
                tooltip: 'Share',
              ),
            ],
          ))
        ],
      ),
    );
  }

  Future<void> _downloadImage(
    String url, {
    AndroidDestinationType? destination,
    bool whenError = false,
    String? outputMimeType,
  }) async {
    String? fileName;
    String? path;
    int? size;
    String? mimeType;
    try {
      String? imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(url,
                outputMimeType: outputMimeType)
            .catchError((error) {
          if (error is PlatformException) {
            String? path = "";
            if (error.code == "404") {
              if (kDebugMode) {
                print("Not Found Error.");
              }
            } else if (error.code == "unsupported_file") {
              if (kDebugMode) {
                print("UnSupported FIle Error.");
              }
              path = error.details["unsupported_file_path"];
            }
            setState(() {
              _message = error.toString();
              _path = path ?? '';
            });
          }

          if (kDebugMode) {
            print(error);
          }
        }).timeout(const Duration(seconds: 10), onTimeout: () {
          if (kDebugMode) {
            print("timeout");
          }
          return;
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(
            url,
            outputMimeType: outputMimeType,
          );
        } else {
          imageId = await ImageDownloader.downloadImage(
            url,
            destination: destination,
            outputMimeType: outputMimeType,
          );
        }
      }

      if (imageId == null) {
        return;
      }
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      setState(() {
        _message = error.message ?? '';
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      var location = Platform.isAndroid ? "Directory" : "Photo Library";
      _message = 'Saved as "$fileName" in $location.\n';
      _size = 'size:     $size';
      _mimeType = 'mimeType: $mimeType';
      _path = path ?? '';

      if (!_mimeType.contains("video")) {
        _imageFile = File(path!);
      }
      return;
    });
  }
}
