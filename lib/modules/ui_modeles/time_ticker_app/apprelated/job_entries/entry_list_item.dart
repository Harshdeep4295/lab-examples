import 'package:flutter/material.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/job_entries/format.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/entry.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/jobs.dart';

class EntryListItem extends StatelessWidget {
  const EntryListItem({
    @required this.entry,
    @required this.job,
    @required this.onTap,
  });

  final Entry entry;
  final Job job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _buildContents(context),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final dayOfWeek = Format.dayOfWeek(entry.start);
    final startDate = Format.date(entry.start);
    final startTime = TimeOfDay.fromDateTime(entry.start).format(context);
    final endTime = TimeOfDay.fromDateTime(entry.end).format(context);
    final durationFormatted = Format.hours(entry.durationInHours);

    final pay = job!=null?job.ratePerHour * entry.durationInHours:0.0;
    final payFormatted = Format.currency(pay);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: <Widget>[
          Text(dayOfWeek, style: TextStyle(fontSize: 18.0, color: Colors.grey)),
          SizedBox(width: 15.0),
          Text(startDate, style: TextStyle(fontSize: 18.0)),
          // if (job.ratePerHour > 0.0)...<Widget>[
          Visibility(
            visible: job != null && job.ratePerHour > 0.0,
            child: Expanded(
              child: Container(),
            ),
          ),
          Visibility(
            visible: job != null && job.ratePerHour > 0.0,
            child: Text(
              payFormatted,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green[700],
              ),
            ),
          ),
          // ],
        ]),
        Row(children: <Widget>[
          Text('$startTime - $endTime', style: TextStyle(fontSize: 16.0)),
          Expanded(child: Container()),
          Text(durationFormatted, style: TextStyle(fontSize: 16.0)),
        ]),
        Visibility(
          visible: entry.comment.isNotEmpty,
          child: Text(
            entry.comment,
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class DismissibleEntryListItem extends StatelessWidget {
  const DismissibleEntryListItem({
    this.key,
    this.entry,
    this.job,
    this.onDismissed,
    this.onTap,
  });

  final Key key;
  final Entry entry;
  final Job job;
  final VoidCallback onDismissed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDismissed(),
      child: EntryListItem(
        entry: entry,
        job: job,
        onTap: onTap,
      ),
    );
  }
}
