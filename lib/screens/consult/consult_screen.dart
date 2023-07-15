import 'package:flutter/material.dart';

import 'components/selectable_page.dart';

class ConsultScreen extends StatelessWidget {
  static String routeName = "/consult";

  @override
  Widget build(BuildContext context) {
    return Container(child: SelectableTextPage());
  }
}
