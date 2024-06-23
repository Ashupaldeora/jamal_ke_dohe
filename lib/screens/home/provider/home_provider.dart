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
  HomeProvider() {
    loadData();
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
