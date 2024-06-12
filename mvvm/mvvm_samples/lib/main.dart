import 'package:flutter/material.dart';
import 'package:mvvm_plus/mvvm_plus.dart';
import 'package:bilocator/bilocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
      home: AppViewWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppViewWidget extends ViewWidget<AppViewModel> {
  AppViewWidget({super.key})
      : super(location: Location.tree, builder: () => AppViewModel());

  @override
  Widget build(BuildContext context) {
    return HomeWidget();
  }
}

class AppViewModel extends ViewModel {
  List<int> favorites = [];
  add(int item) {
    favorites.add(item);
    buildView();
  }

  remove(int item) {
    favorites.remove(item);
    buildView();
  }
}

class HomeWidget extends ViewWidget<AppViewModel> {
  HomeWidget({super.key})
      : super(location: Location.tree, builder: () => AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (
            context,
            index,
          ) {
            return Center(
              child: ListTile(
                  title: Text(index.toString()),
                  trailing: ItemViewWidget(index)),
            );
          }),
    );
  }
}

class FavoritePage extends ViewWidget<AppViewModel> {
  FavoritePage({super.key})
      : super(location: Location.tree, builder: () => AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back))),
      body: ListView.builder(
          itemCount: viewModel.favorites.length,
          itemBuilder: (
            context,
            index,
          ) {
            return Center(
              child: ListTile(
                  title: Text(index.toString()),
                  trailing: RemoveButtonViewWidget(index)),
            );
          }),
    );
  }
}

class ItemViewWidget extends ViewWidget<AppViewModel> {
  final int index;
  ItemViewWidget(this.index, {super.key})
      : super(location: Location.tree, builder: () => AppViewModel());
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          viewModel.favorites.contains(index)
              ? viewModel.remove(index)
              : viewModel.add(index);
        },
        icon: Icon(viewModel.favorites.contains(index)
            ? Icons.favorite
            : Icons.favorite_outline));
  }
}

class RemoveButtonViewWidget extends ViewWidget<AppViewModel> {
  final int index;
  RemoveButtonViewWidget(this.index, {super.key})
      : super(location: Location.tree, builder: () => AppViewModel());

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          viewModel.remove(index);
        },
        icon: const Icon(Icons.close));
  }
}
