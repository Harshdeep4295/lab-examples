import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class ArchModule extends StatefulWidget {
  @override
  _ArchModuleState createState() => _ArchModuleState();
}

class _ArchModuleState extends State<ArchModule> {
  @override
  Widget build(BuildContext context) {
    Function hp = Screen(MediaQuery.of(context).size).hp;
    Function wp = Screen(MediaQuery.of(context).size).wp;

    final body = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppStyles.button("I am Rich", onClick: () {
            Navigator.pushNamed(context, '/rich_home');
          },
          radius: 0),
          SizedBox(
            height: wp(6),
          ),
        ],
      ),
    );

    return Scaffold(body: body);
  }
}
