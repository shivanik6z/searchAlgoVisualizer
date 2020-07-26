import 'package:searchvisualizer/models/search_model.dart';
import 'package:searchvisualizer/providers/search/search_provider.dart';

class LinearSearchProvider extends SearchProvider{
  @override
  void search({int value = 34})
  //TODO: try removing 34 too
  {
    super.search(value: value);
    _startSearch(numbers, value);
  }

  Future _startSearch(List<SearchModel> list, int target) async
  {
    for(var index=0; index<list.length; index++)
      {
        potentialNode(index);
        await pause();
        if(numbers[index].value == target)
          {
            foundNode(index);
            return;
          }
        else{
          discardNode(index);
        }
      }
    nodeNotFound();
  }
}