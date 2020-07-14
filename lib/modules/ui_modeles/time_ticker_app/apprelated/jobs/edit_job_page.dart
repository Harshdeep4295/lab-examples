import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_aware_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_exception_alert_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/jobs.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/database.dart';
import 'package:provider/provider.dart';

class EditJobPage extends StatefulWidget {
  final Database database;
  final Job job;
  EditJobPage({Key key, @required this.database, @required this.job})
      : super(key: key);

  static Future<void> show(
      BuildContext context, Job job, Database database) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => EditJobPage(
          database: database,
          job: job,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditJobPageState createState() => _EditJobPageState();
}

class _EditJobPageState extends State<EditJobPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  int _ratePerHour;

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _rateFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.job != null) {
      _name = widget.job.name;
      _ratePerHour = widget.job.ratePerHour;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: AppStyles.textwidget(
        'Edit Job',
        color: AppColors.white,
      ),
      centerTitle: true,
      actions: <Widget>[
        FlatButton(
          onPressed: () => _submit(),
          child: AppStyles.textwidget(
            'Save',
            fontSize: 18,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[200],
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildrenForForm(),
      ),
    );
  }

  List<Widget> _buildChildrenForForm() {
    return [
      TextFormField(
        initialValue: _name ?? "",
        focusNode: _nameFocusNode,
        decoration: InputDecoration(labelText: 'Job Name'),
        validator: (value) =>
            value.isNotEmpty ? null : 'Value should not be null',
        onSaved: (value) => _name = value,
        onEditingComplete: _nameComplete,
      ),
      TextFormField(
        initialValue: _ratePerHour.toString() ?? "",
        focusNode: _rateFocusNode,
        decoration: InputDecoration(labelText: 'Rate per hour'),
        keyboardType: TextInputType.number,
        onSaved: (value) => _ratePerHour = int.tryParse(value) ?? 0,
        onEditingComplete: () => _submit(),
      )
    ];
  }

  bool validateForm() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (validateForm()) {
      try {
        final jobs = await widget.database.jobsStream().first;
        final allNames = jobs.map((job) => job.name).toList();

        if (widget.job != null) {
          allNames.remove(widget.job.name);
        }
        final jobId = widget.job?.id ?? documentIdFromCurrentDate();
        await widget.database.setJob(
          Job(
            id: jobId,
            name: _name,
            ratePerHour: _ratePerHour,
          ),
        );

        Navigator.pop(context);
      } on Exception catch (ex) {
        final result = await PlatformExceptionAlertDialog(
          title: 'Operation Failed',
          exception: ex,
        ).show(context);
        print(result);
      }
    }
  }

  void _nameComplete() {
    FocusScope.of(context).requestFocus(_rateFocusNode);
  }
}
