import 'package:basic_flutter_app/db_card.dart';
import 'package:flutter/material.dart';

import 'db_model.dart';

class ChrsList extends StatelessWidget {
  final List<Chrs> doggos;
  ChrsList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, int) {
        return new ChrsCard(doggos[int]);
      },
    );
  }
}
