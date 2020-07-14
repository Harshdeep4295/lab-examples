import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/jobs.dart';

class JobListTile extends StatelessWidget {
  final Job job;
  final VoidCallback callback;

  JobListTile({Key key, @required this.job, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppStyles.textwidget(
        '${job.name}',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: callback,
    );
  }
}
