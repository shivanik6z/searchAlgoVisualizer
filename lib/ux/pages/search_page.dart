
import 'package:searchvisualizer/providers/search/search_provider.dart';
import 'package:searchvisualizer/ux/widgets/search/search.dart';
import 'package:searchvisualizer/ux/widgets/search/search_indicator.dart';
import 'package:searchvisualizer/ux/widgets/search/search_message.dart';
import 'package:searchvisualizer/ux/widgets/search/search_speed.dart';
import 'package:searchvisualizer/ux/widgets/search/search_visualizer.dart';
import 'package:flutter/material.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {
  SearchPage({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    TextTheme mytheme = TextTheme(headline4: TextStyle(
      color: Colors.white
    ) );
    GlobalKey key = GlobalKey(debugLabel: title);
    return Stack(//todo: learn this
      key: key,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.merge(mytheme).headline4,
              ),//TODO: changed color
            ),
            const SizedBox(height: 24),
            //Below can not be constant
            Expanded(
              child: SearchVisualizer<T>(),
            ),
            SearchMessage<T>(),
            const SizedBox(height: 24),
            SearchSpeed<T>(),
            Search<T>(),
            const SizedBox(height: 24),
          ],
        ),
        SearchIndicator<T>(
          parentKey: key,
        ),
      ],
    );
  }
}