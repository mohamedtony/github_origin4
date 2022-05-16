import 'dart:io';

import 'package:flutter/material.dart';

class ShowImagePage extends StatefulWidget {
  final String url;
  const ShowImagePage({required this.url,Key? key}) : super(key: key);

  @override
  State<ShowImagePage> createState() => _ShowImagePageState();
}

class _ShowImagePageState extends State<ShowImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:widget.url.contains('http')?Image.network(widget.url):Image.file(File(widget.url)) ),
    );
  }
}
