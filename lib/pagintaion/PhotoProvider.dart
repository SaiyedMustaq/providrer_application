// ignore_for_file: unnecessary_getters_setters, file_names

import 'package:flutter/material.dart';

import '../network/NetworkCall.dart';
import 'Photos.dart';

class PhotoProvider extends ChangeNotifier {
  int _page = 1;
  int get page => _page;

  set page(int value) {
    _page = value;
    notifyListeners();
  }

  List<Photos> _photos = <Photos>[];

  List<Photos> get photos => _photos;

  set photos(List<Photos> value) {
    _photos = value;
  }

  Future<void> callPhotoApi() async {
    await NetworkCall().getPhotos(_page, 'nature').then((response) {
      _page = _page + 1;

      addPhotosToList(PhotoModel.fromJson(response).photos!);
    });
    notifyListeners();
  }

  void addPhotosToList(List<Photos> photoData) {
    _photos.addAll(photoData);
    notifyListeners();
  }
}
