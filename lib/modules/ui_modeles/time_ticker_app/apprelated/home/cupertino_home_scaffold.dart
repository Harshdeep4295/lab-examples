import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/job_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/tab_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  final TabItem item;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> getWidgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;
  const CupertinoHomeScaffold(
      {Key key,
      this.item,
      this.onSelectTab,
      this.getWidgetBuilders,
      this.navigatorKeys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            _buildItem(TabItem.jobs),
            _buildItem(TabItem.enteries),
            _buildItem(TabItem.account)
          ],
          onTap: (value) => onSelectTab(TabItem.values[value]),
        ),
        tabBuilder: (context, index) {
          final item = TabItem.values[index];
          return CupertinoTabView(
              navigatorKey: navigatorKeys[item],
              builder: (value) => getWidgetBuilders[item](context));
        });
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    TabItemData data = TabItemData.allTabs[tabItem];
    final color = item == tabItem ? Colors.indigo : Colors.grey;
    return BottomNavigationBarItem(
      icon: Icon(
        data.iconData,
        color: color,
      ),
      title: Text(
        data.title,
        style: TextStyle(color: color),
      ),
    );
  }
}
