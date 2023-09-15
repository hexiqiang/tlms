import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:tlms/data/DataClass.dart';

class Scan extends StatefulWidget {
  _Scan createState() => _Scan();
}

class _Scan extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextButton(
                onPressed: () {
                  String uri = "/scan/pack/view";
                  openQRScanPage(uri);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "请扫描外箱sscc条码",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     openQRScanPage();
            //   },
            //   child: Text(
            //     "请扫描外箱sscc条码",
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 12),
            //   ),
            // ),
          ],
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


    final List<PackDesc> packDescs= [];
    PackDesc packDesc = PackDesc(goodsNumber: "@141441", numberOfYards: 36, assignedAmount: 3, scannedNumber: 0);
    packDescs.add(packDesc);
    Code code = Code(number: "@141441", code: 1, msg: "扫描成功", packDesc: packDescs);
    Navigator.of(context).pushNamed("${uri}", arguments: code);
    //扫描到的条形码或二维码内容
    print("条形码或二维码为: " + qrcode);
    //...处理后续逻辑，如授权登录
  }
}

