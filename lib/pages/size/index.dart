import 'package:flutter/material.dart';
import 'package:notebook/common/fix/size_config.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      width: SizeConfig.blockSizeVertical * 20,
      height: SizeConfig.blockSizeHorizontal * 50,
      decoration: BoxDecoration(
        color: Color(0xff7c94b6),
        image: DecorationImage(
          image: ExactAssetImage(''),
          fit: BoxFit.fill
        ),
        border: Border.all(
            width: 2.0,
            color: Colors.black12
        )
      ),
    );
    return container;
  }
}