import 'package:flutter/material.dart';

import '../widgets/hero_banner.dart';
import '../widgets/qcard.dart';
import '../widgets/recent_app.dart';
import '../widgets/shelf.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print('Constraints: ${constraints.maxHeight}, ${constraints.maxWidth}');
        return const Scaffold(
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                HeroBanner(),
                SizedBox(height: 24),
                QCard(),
                SizedBox(height: 24),
                RecentApp(),
                SizedBox(height: 24),
                Shelf(),
                SizedBox(height: 24),
                Shelf(),
              ]),
            ));
      },
    );
  }
}
