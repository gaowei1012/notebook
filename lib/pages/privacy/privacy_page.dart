import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('私密日记'),),
      body: Container(
        child: Center(
          child: Text(
            '糟糕，被发现了👿',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}