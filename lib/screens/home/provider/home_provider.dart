import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/dohas_data.dart';

class HomeProvider extends ChangeNotifier {
  CarouselController carouselController = CarouselController();
  List<DohaModel> data = [];
  Map<int, bool> favoriteStatus = {};
  int openedDohaIndex = 0;
  List<int> favoriteIndices = [];
  String selectedLanguage = "hindi";
  HomeProvider() {
    loadData();
  }

  void updateSelectedLanguage(String value) {
    selectedLanguage = value;
    notifyListeners();
  }

  updateFavouriteIndices() {
    favoriteIndices = favoriteStatus.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
    notifyListeners();
  }

  void removeFavourites(int index) {
    favoriteIndices.removeAt(index);
    notifyListeners();
  }

  void cancelFavouriteMap(int index) {
    favoriteStatus[index] = false;
    notifyListeners();
  }

  void changeFavourite(bool value, int index) {
    favoriteStatus[index] = !value;
    notifyListeners();
  }

  updateIndex(int index) {
    openedDohaIndex = index;
    notifyListeners();
  }

  Future<void> loadData() async {
    String json = await rootBundle.loadString('assets/json/dohe.json');
    final jsonData = jsonDecode(json);
    data = jsonData.map<DohaModel>((e) => DohaModel.fromJson(e)).toList();
  }
}
