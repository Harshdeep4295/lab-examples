import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_aware_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_exception_alert_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/job_entries/job_entries_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/add_job.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/edit_job_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/empty_content.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/job_list_tile.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/list_item_builder.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/jobs.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/database.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBase = Provider.of<AuthBase>(context, listen: false);
    final AppBar appBar = AppBar(
      title: AppStyles.textwidget(
        'Jobs',
        color: AppColors.white,
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => AddJob.show(context),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: _buildContents(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => AddJob.show(context),
      //   child: Icon(Icons.add),
      // ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemBuilder<Job>(
          snapshot: snapshot,
          itemWidgetBuilder: (context, item) => Dismissible(
            key: Key('job-${item.id}'),
            background: Container(
              color: AppColors.pinkDarkColor,
            ),
            onDismissed: (direction) => _delete(context, item),
            direction: DismissDirection.endToStart,
            child: JobListTile(
              job: item,
              callback: () => JobEntriesPage.show(context, item),
            ),
          ),
        );
      },
    );
  }


  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final databse = Provider.of<Database>(context, listen: false);
      await databse.deleteJob(job);
    } on PlatformException catch (e) {
      final result = await PlatformExceptionAlertDialog(
        title: 'Operation Failed',
        exception: e,
      ).show(context);
      print(result);
    }
  }
}
