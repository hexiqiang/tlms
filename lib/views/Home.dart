import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlms/api/Api.dart';
import 'package:tlms/data/DataClass.dart';

List<dynamic> _icon = [
  {
    'icon': Icons.article_outlined,
  },
  {
    'icon': Icons.shopping_bag_outlined,
  },
  {
    'icon': Icons.view_carousel_outlined,
  },
  {
    'icon': Icons.account_balance_wallet_outlined,
  },
  {
    'icon': Icons.description_outlined,
  },
  {
    'icon': Icons.sort_outlined,
  },
  {
    'icon': Icons.airport_shuttle_sharp,
  },
  {
    'icon': Icons.print_outlined,
  },
  {
    'icon': Icons.verified_outlined,
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<dynamic> column = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFromCache();
  }



  //保存数据
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String nickname = "";
  String username = "";
  bool isLoggedIn = true;
  int id = 0;
  int rid = 0;

  @override
  Widget build(BuildContext context) {
    this._getColumn();
    UserData userData = UserData(id: id, rid: rid, username: username, nickname: nickname);
    if (isLoggedIn) {
      userData = ModalRoute.of(context)?.settings.arguments as UserData;
    } else {
      Navigator.pop(context);
    }
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: _getColumn(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return SingleChildScrollView(
              child: Column(children: [
                _HeaderContainter(userData: userData),
                _ContainerBox(column: column)
              ]),
            );
          }),
    );
  }

  Widget _HeaderContainter({required UserData userData}) {
    return Container(
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
        title: Text("${nickname}"),
        trailing: TextButton(
          child: Text(
            "退出",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            this.isLoggedIn = false;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _ContainerBox({required List<dynamic> column}) {
    return Container(
      height: 600,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2.0,
        children: [
          for (var i = 0; i < column.length; i++)
            Container(
              child: InkWell(
                onTap: () {
                  if (column[i]['action'] == "url") {
                    Navigator.pushNamed(context, "${column[i]['url']}");
                  } else {
                    openQRScanPage("${column[i]['url']}");
                  }
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
                        backgroundColor: Color(int.parse(column[i]['background'])),
                        radius: 26,
                        child: Icon(_icon[i]['icon'], size: 42, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '${column[i]['name']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
    if (qrcode == '') {
      Navigator.pop(context);
    }else{
      var data;

      Navigator.of(context).pushNamed("${uri}", arguments: data);
      //扫描到的条形码或二维码内容
      print("条形码或二维码为: " + qrcode);
    }


    //...处理后续逻辑，如授权登录
  }

  Future<dynamic> _getColumn() async {
    var response = await Api.getColumn("/column/getcolumn", {});
    if (response['code'] == 0) this.column = response['data'];
  }

  //从缓存中获取信息填充
  Future<void> initFromCache() async {
    //获取SharedPreferences对象
    final SharedPreferences prefs = await _prefs;
    //根据键（key）获取本地存储的值（value）
    final _nickname = prefs.getString("nickname");
    final _username = prefs.getString("username");
    final _isLoggedIn = prefs.getBool("isLoggedIn");
    final _id = prefs.getInt("id");
    final _rid = prefs.getInt("rid");
    print(_isLoggedIn);
    //获取到缓存中的值后，使用setState更新界面信息
    setState(() {
      this.nickname = (_nickname == null ? "" : _nickname);
      this.username = (_username == null ? "" : _username);
      this.isLoggedIn = (_isLoggedIn == false ? false : true);
      this.id = (_id == null ? 0 : _id);
      this.rid = (_rid == null ? 0 : _rid);
    });
  }
}
