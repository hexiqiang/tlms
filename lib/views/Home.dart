import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:tlms/api/Api.dart';
import 'package:tlms/data/DataClass.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    UserData userData = UserData(id: 0, rid: 0, username: "", nickname: "");
    if(ModalRoute.of(context)?.settings.arguments != null){
      userData = ModalRoute.of(context)?.settings.arguments as UserData;
    }else{
      Navigator.pop(context);
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(4),
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
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0x91C5FFBE),
                radius: 26,
                child: Icon(Icons.person, size: 42, color: Color(0xFF3fd542)),
              ),
              title: Text("${userData.nickname}"),
              trailing: TextButton(
                child: Text("退出", style: TextStyle(color: Colors.black),),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/scan");
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x911eebcd),
                        radius: 26,
                        child: Icon(Icons.article_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '收货扫描',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/scan/pdms");
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x9108caf0),
                        radius: 26,
                        child: Icon(Icons.shopping_bag_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '打包扫描',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/scan/loadingcar");
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x911ce6dd),
                        radius: 26,
                        child: Icon(Icons.view_carousel_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '装车扫描',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {
                  openQRScanPage("/scan/pack/look");
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x91a88dfe),
                        radius: 26,
                        child: Icon(Icons.account_balance_wallet_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '打包查询',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/scan/drop");
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x91fe6fa8),
                        radius: 26,
                        child: Icon(Icons.description_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '落装扫描',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x852ed14d),
                        radius: 26,
                        child: Icon(Icons.sort_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '收货打板',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x91ffc435),
                        radius: 26,
                        child: Icon(Icons.airport_shuttle_sharp,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '出仓扫描',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Flexible(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x911296db),
                        radius: 26,
                        child: Icon(Icons.print_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '收货打板',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
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
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x9147cdfb),
                        radius: 26,
                        child: Icon(Icons.verified_outlined,
                            size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '入库上架',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Flexible(

                child: Text(""),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> openQRScanPage(String uri) async {
    var options = ScanOptions(
        android: AndroidOptions(aspectTolerance: 0.5, useAutoFocus: true),
        //(默认已配)添加Android自动对焦
        autoEnableFlash: false,
        //true打开闪光灯, false关闭闪光灯
        strings: {
          'cancel': '退出',
          'flash_on': '开闪光灯',
          'flash_off': '关闪光灯'
        } //标题栏添加闪光灯按钮、退出按钮
    );
    var result = await BarcodeScanner.scan(options: options);
    String qrcode = result.rawContent;
    if (qrcode == "") Navigator.pop(context);

    var data;

    Navigator.of(context).pushNamed("${uri}", arguments: data);
    //扫描到的条形码或二维码内容
    print("条形码或二维码为: " + qrcode);
    //...处理后续逻辑，如授权登录
  }
}

