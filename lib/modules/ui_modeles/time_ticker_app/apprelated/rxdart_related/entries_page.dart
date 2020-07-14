import 'package:flutter/material.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/jobs/list_item_builder.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/rxdart_related/entries_bloc.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/rxdart_related/entries_list_tile.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/database.dart';
import 'package:provider/provider.dart';

class EntriesPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return Provider<EntriesBloc>(
      create: (_) => EntriesBloc(database: database),
      child: EntriesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entries'),
        elevation: 2.0,
      ),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    final bloc = Provider.of<EntriesBloc>(context);
    return StreamBuilder<List<EntriesListTileModel>>(
      stream: bloc.entriesTileModelStream,
      builder: (context, snapshot) {
        return ListItemBuilder<EntriesListTileModel>(
          snapshot: snapshot,
          itemWidgetBuilder: (context, model) => EntriesListTile(model: model),
        );
      },
    );
  }
}
