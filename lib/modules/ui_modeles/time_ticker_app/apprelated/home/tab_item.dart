import 'package:flutter/material.dart';

enum TabItem { jobs, enteries, account }

class TabItemData {
  final String title;
  final IconData iconData;

  const TabItemData({this.title, this.iconData});

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.account:
        TabItemData(title: 'Account', iconData: Icons.account_balance),
    TabItem.jobs: TabItemData(title: 'Job', iconData: Icons.work),
    TabItem.enteries: TabItemData(title: 'enteries', iconData: Icons.event_note)
  };
}
