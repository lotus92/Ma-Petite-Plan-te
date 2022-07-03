import 'package:exercicempp/Models/Item.dart';
import 'package:exercicempp/Routes/ItemRoute.dart';
import 'package:exercicempp/Routes/MainRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const MAINAPP = 'mainAPP';
const ITEMPAGE = 'itemPAGE';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Philosopher'),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0), //set desired text scale factor here
            child: Navigator(
                initialRoute: MAINAPP,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case MAINAPP:
                      return MaterialPageRoute(
                        builder: (context) => const MainRoute(),
                      );
                  }
                  return null;
                })));
  }
}
