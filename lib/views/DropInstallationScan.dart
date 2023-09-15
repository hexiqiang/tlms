import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class DropInstallationScan extends StatefulWidget {
  _DropInstallationScan createState() => _DropInstallationScan();
}

class _DropInstallationScan extends State<DropInstallationScan> {
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
                  String uri = "/scan/drop/desc";
                  openQRScanPage(uri);
                  // Navigator.pushNamed(
                  //   context,
                  //   "/scan/pack/view",
                  // );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "请扫描订舱条码",
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

    Navigator.of(context).pushNamed(uri, arguments: qrcode);
    //扫描到的条形码或二维码内容
    print("条形码或二维码为: " + qrcode);
    //...处理后续逻辑，如授权登录
  }
}

class Code {
  final String number;
  final int code;
  final String msg;

  const Code({required this.number, required this.code, required this.msg});
}
