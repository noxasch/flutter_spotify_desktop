import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: Row(
          children: [
            SideMenu(),
            // Playlist screen
          ],
        )),
        Container(
          width: double.infinity,
          height: 84.0,
          color: Colors.blue,
        )
      ],),
    );
  }
}
