import 'package:searchvisualizer/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Search<T extends SearchProvider> extends StatefulWidget
{
  const Search({
    Key key,
}): super(key: key);

  @override
  _SearchState<T> createState()=> _SearchState<T>();
}
class _SearchState<T extends SearchProvider> extends State<Search<T>>
{
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<T>(context, listen: false).search(value: val);
      //because we don't want to create state again if user changes no to be
      //searched while algo is running
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Container(
      width: 100,
      child: TextField(
        style: TextStyle(
          color: Colors.white//TODO:added color
        ),
        controller: searchController,
        decoration: const InputDecoration(
          labelText: 'Enter Value',
          labelStyle: TextStyle(
            color: Colors.white38//TODO:changed label color
          ),
          hintStyle: TextStyle(
            color: Colors.white
          )

        ),
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
      ),
    ),
    Selector<T, bool>(
    selector: (_, provider) => provider.isSearching,
    builder: (_, isSearching, child) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ) ,
    color: Colors.lightBlue,//TODO:was blue
    disabledColor: Colors.lightBlueAccent.shade100,
    onPressed: isSearching ? null : _search,
    child: child,
    );
    },
    child: const Text('Search', style: TextStyle(color: Colors.white)),//TODO:was white
    )
      ],
    );
  }
}