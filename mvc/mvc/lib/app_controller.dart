import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/model.dart';

class AppController extends MvcController<Favorites> {
  @override
  MvcView<MvcController> view() => HomeView();
  void add(int item) {
    model.addToFavorites(item);
    update();
  }

  void remove(int item) {
    model.removeFromFavorites(item);
    update();
  }

  List<int> get items => model.favorites;
}

class HomeModel {
  const HomeModel(this.title);
  final String title;
}

class HomeController extends MvcController<HomeModel> {
  @override
  MvcView<MvcController> view() => HomeView();
}

class HomeView extends MvcView<HomeController> {
  @override
  Widget buildView() {
    return const Placeholder();
  }
}
