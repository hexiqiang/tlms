import 'package:flutter/material.dart';
import 'package:tlms/common/Common.dart';
import 'package:tlms/data/DataClass.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
class DropDesc extends StatefulWidget{

  const DropDesc({super.key});
  _DropDesc createState() => _DropDesc();
}

class _DropDesc extends State<DropDesc>{

  @override
  Widget build(BuildContext context){
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
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                        height: 34,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("订舱条码号：14124", style: TextStyle(fontSize: 18),),
                        ),
                      ),
                      SizedBox(
                        height: 34,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("落装总想数：412412", style: TextStyle(fontSize: 18),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(var i = 0; i < 10; i++)
                    ListTile(
                      title: Text("外箱SSCC:            ${i}", style: TextStyle(fontSize: 18),),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shadowColor: Colors.white,
        height: 80,
        notchMargin: 0,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Align(
                    child: SizedBox(
                      width: 320,
                      height: 80,
                      child:
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF3fd550),
                        ),
                        child: TextButton(
                          child: Text(
                            "SSCC条码扫描",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            // Action here
                            Navigator.pushNamed(context, "/scan/drop/scan");

                          },
                        ),
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
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