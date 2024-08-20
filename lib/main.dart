import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_responsive_sample/scenario/main_menu_page_type_b.dart';

import 'scenario/home_page.dart';
import 'scenario/main_menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Home Responsive Sample',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        home: const LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive sample App'),
      elevation: 4,),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Wrap(spacing: 25,
            direction: Axis.vertical,
            children: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: Text('HomePage'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainMenuPage()));
            },
            child: Text('Main Menu Page Type A'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainMenuPageTypeB()));
            },
            child: Text('Main Menu Page Type B'),
          )
        ]),
      ),
    );
  }
}
