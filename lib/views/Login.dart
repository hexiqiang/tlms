import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
      Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child:
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/login/view");
              },
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0x91C5FFBE),
                    radius: 30,
                    child: Icon(Icons.person, size: 50, color: Color(0xFF3fd550)),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

}