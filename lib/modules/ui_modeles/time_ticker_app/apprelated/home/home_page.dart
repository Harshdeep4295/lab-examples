import 'package:flutter/material.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/account/account.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/cupertino_home_scaffold.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/job_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/tab_item.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/rxdart_related/entries_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentItem = TabItem.jobs;
  void _select(TabItem value) {
    if (value == _currentItem) {
      navigatorKeys[_currentItem]
          .currentState
          .popUntil((route) => route.isFirst);
    }
    setState(() {
      _currentItem = value;
    });
  }

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.jobs: GlobalKey<NavigatorState>(),
    TabItem.enteries: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>()
  };

  Map<TabItem, WidgetBuilder> get getWidgetBuilders {
    return {
      TabItem.jobs: (_) => JobsPage(),
      TabItem.enteries: (_) => EntriesPage.create(context),
      TabItem.account: (_) => Accountpage()
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentItem].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        item: _currentItem,
        onSelectTab: _select,
        getWidgetBuilders: getWidgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
