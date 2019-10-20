import 'package:communio/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'filter_form.dart';

class Filters extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<String>>(
      converter: (store) => store.state.content['current_filters'].toList(),
      builder: (context, filters){
        return Row(
          children: this.generateFilters(context, filters),
        );
      },
    );
  }

  generateFilters(BuildContext context, List<String> filters) {
    final List<Widget> currentFilters = List();
    currentFilters.add(this.generateNewFiltersButton(context));
    filters.forEach((filter) => currentFilters.add(
      Card(
        child: Text(filter),
      )
    ));
    return currentFilters;
  }

  Widget generateNewFiltersButton(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context){
          return FilterForm();
        }
      ),
      icon: Icon(Icons.library_add),
    );
  }
}
