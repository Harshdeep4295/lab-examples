import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_exception_alert_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/job_entries/entry_list_item.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/job_entries/entry_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/edit_job_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/list_item_builder.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/entry.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/jobs.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class JobEntriesPage extends StatelessWidget {
  const JobEntriesPage({@required this.database, @required this.job});
  final Database database;
  final Job job;

  static Future<void> show(BuildContext context, Job job) async {
    final Database database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => JobEntriesPage(database: database, job: job),
      ),
    );
  }

  Future<void> _deleteEntry(BuildContext context, Entry entry) async {
    try {
      await database.deleteEntry(entry);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation failed',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Job>(
        stream: database.jobStream(jobId: job.id),
        builder: (context, snapshot) {
          final Job job = snapshot.data;
          final jobName = job?.name ?? "";
          return Scaffold(
            appBar: AppBar(
              elevation: 2.0,
              title: Text(jobName),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => EditJobPage.show(context, job, database),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => EntryPage.show(
                      context: context, database: database, job: job),
                ),
              ],
            ),
            body: _buildContent(context, job),
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icons.add),
            // onPressed: () => EntryPage.show(
            //     context: context, database: database, job: job),
            // ),
          );
        });
  }

  Widget _buildContent(BuildContext context, Job job) {
    return StreamBuilder<List<Entry>>(
      stream: database.entriesStream(job: job),
      builder: (context, snapshot) {
        return ListItemBuilder<Entry>(
          snapshot: snapshot,
          itemWidgetBuilder: (context, entry) {
            return DismissibleEntryListItem(
              key: Key('entry-${entry.id}'),
              entry: entry,
              job: job,
              onDismissed: () => _deleteEntry(context, entry),
              onTap: () => EntryPage.show(
                context: context,
                database: database,
                job: job,
                entry: entry,
              ),
            );
          },
        );
      },
    );
  }
}
