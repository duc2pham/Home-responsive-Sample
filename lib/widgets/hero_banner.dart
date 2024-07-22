import 'package:flutter/material.dart';

import 'settings_column.dart';
import 'settings_row.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.sizeOf(context).width < MediaQuery.sizeOf(context).height;
    return isPortrait
        ? Column(children: <Widget>[
            const SettingsRow(),
            SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child:
                    const AspectRatio(aspectRatio: 3.88, child: _BigBanner()))
          ])
        : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Expanded(flex: 7, child: SettingsColumn()),
                Spacer(),
                Expanded(
                    flex: 90,
                    child: AspectRatio(aspectRatio: 3.88, child: _BigBanner()))
              ]);
  }
}

class _BigBanner extends StatelessWidget {
  const _BigBanner();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('BIG BANNER', style: TextStyle(fontSize: 40),)));
  }
}
