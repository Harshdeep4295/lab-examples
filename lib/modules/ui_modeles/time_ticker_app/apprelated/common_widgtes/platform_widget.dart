import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class PlatformWidget extends StatelessWidget {
  Widget buildMaterialWidget(BuildContext context);
  Widget buildCupertinoWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? buildCupertinoWidget(context)
        : buildMaterialWidget(context);
  }
}
