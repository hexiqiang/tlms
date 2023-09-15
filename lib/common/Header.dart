import 'package:flutter/material.dart';

class LayoutHeader extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  final bool back;
  const LayoutHeader({super.key, required this.title, required this.back});

  _LayoutHeader createState() => _LayoutHeader();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _LayoutHeader extends State<LayoutHeader>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.back,
        backgroundColor: Color(0xFF3fd550),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),
    );
  }

}