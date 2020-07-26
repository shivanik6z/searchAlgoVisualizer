import 'package:flutter/material.dart';

enum SearchState { open, discard, search, searched, found}

class SearchModel
{
  SearchModel(this.value)
       : state = ValueNotifier(SearchState.open),
         color = Colors.white,
  //TODO:was black
        key= GlobalKey();


  final int value;
  ValueNotifier<SearchState> state;
  Color color;
  GlobalKey key;

  void reset()
  {
    state.value= SearchState.open;
    color= Colors.white;
    //TODO: was black

  }

  void potential()
  {
    state.value= SearchState.search;
    color= Colors.lightBlueAccent.shade100;
    //TODO: was blue
  }
  void discard()
  {
    state.value= SearchState.discard;
    color=Colors.redAccent;
  }
  void found()
  {
    state.value= SearchState.found;
    color=Colors.greenAccent;
  }
  void searched()
  {
    state.value= SearchState.searched;
  }

}