import 'package:searchvisualizer/providers/search/binary_search_provider.dart';
import 'package:searchvisualizer/providers/search/linear_search_provider.dart';
import 'package:searchvisualizer/ux/pages/search_page.dart';
import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier{
  String categoryKey='Search';
  final _searchPages=[
    SearchPage<LinearSearchProvider>(title: 'Linear Search'),
    SearchPage<BinarySearchProvider>(title: 'Binary Search'),
  ];

  void changeKey(String key) {
    categoryKey = key;
    notifyListeners();
  }

  List<StatelessWidget> get pages
  {
    switch (categoryKey){
      case 'Search':
        return _searchPages;
        break;
      default:
        return _searchPages;
        break;

    }
  }
}