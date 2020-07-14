import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_widget.dart';

class PlatformAwareDialog extends PlatformWidget {
  final String title;
  final String content;
  final String defaultText;
  final String cancelActionText;
  PlatformAwareDialog({
    @required this.title,
    @required this.content,
    @required this.defaultText,
    this.cancelActionText,
  })  : assert(title != null),
        assert(content != null);

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this,
          );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: AppStyles.textwidget(title),
      content: AppStyles.textwidget(content),
      actions: _buildContentActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: AppStyles.textwidget(title),
      content: AppStyles.textwidget(content,
          fontWeight: FontWeight.normal, fontSize: 18),
      actions: _buildContentActions(context),
    );
  }

  List<Widget> _buildContentActions(BuildContext context) {
    List<Widget> actions = [];

    if (cancelActionText != null) {
      actions.add(
        PlatformDialogActions(
          child: AppStyles.textwidget(
            cancelActionText,
            fontWeight: FontWeight.normal,
          ),
          onpresed: () => Navigator.pop(context, false),
        ),
      );
    }
    actions.add(
      PlatformDialogActions(
        child: AppStyles.textwidget(
          defaultText,
          fontWeight: FontWeight.normal,
        ),
        onpresed: () => Navigator.pop(context, true),
      ),
    );
    return actions;
  }
}

class PlatformDialogActions extends PlatformWidget {
  final Widget child;
  final VoidCallback onpresed;
  PlatformDialogActions({this.child, this.onpresed});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onpresed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onpresed,
    );
  }
}
