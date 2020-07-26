import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchvisualizer/providers/search/linear_search_provider.dart';
import 'package:searchvisualizer/providers/search/binary_search_provider.dart';
import 'package:searchvisualizer/ux/pages/home/home.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black87
            //TODO:was teal
      ),
      title: 'Search Algorithms',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.black87,
          //TODO:was teal
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_)=> LinearSearchProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => BinarySearchProvider(),
              ),
            ],
            child: Home(),
          ),
        ),
      ),
    );
  }
}

