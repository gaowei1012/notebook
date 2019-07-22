import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';


// void main() {
  
//   SystemChrome.setPreferredOrientations(
//     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
//   );

//   return runApp(
//     ChangeNotifierProvider<AppStateModel>(
//       // model: model,
//       builder: (context) => AppStateModel()..loadProducts(),
//       child: CupertionStoreApp(),
//     )
//   );
// }


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateModel>(
      builder: (context) => AppStateModel()..loadProducts(),
      child: CupertionStoreApp(),
    );
  }
}
