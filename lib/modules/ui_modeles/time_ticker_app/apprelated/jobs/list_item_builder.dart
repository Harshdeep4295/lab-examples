import 'package:flutter/material.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/empty_content.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemWidgetBuilder;

  const ListItemBuilder({Key key, this.snapshot, this.itemWidgetBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final List<T> items = snapshot.data;
      if (items.isNotEmpty) {
        return _buildList(items);
      }
      return EmptyContentWidget();
    } else if (snapshot.hasError) {
      return EmptyContentWidget(
        title: 'Something went wrong',
        message: 'Can\'t load items',
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: 0.5,
            ),
        itemCount: items.length + 2,
        itemBuilder: (context, index) {
          if (index == 0 || index == items.length + 1) {
            return Divider(
              height: 0.5,
            );
          }
          return itemWidgetBuilder(
            context,
            items[index-1],
          );
        });
  }
}
