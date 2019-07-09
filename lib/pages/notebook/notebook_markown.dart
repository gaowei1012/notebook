import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const _markdownData = "hello";

class NotbookMarkdown extends StatefulWidget {
  @override
  _NotbookMarkdownState createState() => _NotbookMarkdownState();
}

class _NotbookMarkdownState extends State<NotbookMarkdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
        child: Markdown(data: _markdownData),
      ),
    );
  }
}