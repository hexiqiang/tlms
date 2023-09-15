import 'package:flutter/material.dart';
import 'package:tlms/common/Header.dart';

class LayoutBody extends StatefulWidget{

  final String title;
  final Widget body;
  final bool back;
  const LayoutBody({super.key, required this.body, required this.title, required this.back});
  _LayoutBody createState() => _LayoutBody();
}

class _LayoutBody extends State<LayoutBody>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: LayoutHeader(title: widget.title, back: widget.back),
      body: widget.body,
    );
  }

}