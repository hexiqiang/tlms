import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:tlms/data/DataClass.dart';


class ScanView extends StatefulWidget {
  _ScanView createState() => _ScanView();
}

class _ScanView extends State<ScanView> {
  @override
  Widget build(BuildContext context) {
    final List<PackDesc> packDescs= [];
    PackDesc packDesc = PackDesc(goodsNumber: "@141441", numberOfYards: 36, assignedAmount: 3, scannedNumber: 0);
    packDescs.add(packDesc);
    Code code = Code(number: "@141441", code: 1, msg: "扫描成功", packDesc: packDescs);
    if(ModalRoute.of(context)?.settings.arguments != null){
      code = ModalRoute.of(context)?.settings.arguments as Code;
    }
    return Scaffold(
      body:
          Column(
            children: [
              Container(
                height: 60,
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
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      '二维码值：${code.number}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    openQRScanPage();
                  },
                  child: Text(
                    "请扫描当前外箱内的任意一个鞋盒二维码",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),

    );
  }

  Future<void> openQRScanPage() async {
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

    final List<PackDesc> packDescs= [];
    PackDesc packDesc = PackDesc(goodsNumber: "@141441", numberOfYards: 36, assignedAmount: 3, scannedNumber: 0);
    packDescs.add(packDesc);
    Code code = Code(number: "@141441", code: 1, msg: "扫描成功", packDesc: packDescs);
    //扫描到的条形码或二维码内容
    print("条形码或二维码为: " + code.number);
    Navigator.of(context).pushNamed("/scan/view",arguments: code);
    //...处理后续逻辑，如授权登录
  }
}


