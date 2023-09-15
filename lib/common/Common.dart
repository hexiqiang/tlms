import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:tlms/data/DataClass.dart';


class CommonScan extends StatefulWidget{
  final String title;
  final String uri;
  final String isDesc;
  const CommonScan({super.key, required this.title, required this.uri, required this.isDesc});
  _CommonScan createState() => _CommonScan();
}

class _CommonScan extends State<CommonScan>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Container(
            height: 500,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  openQRScanPage();
                },
                child: Text("请扫描",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),

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

    var data;
    if (widget.isDesc == "pack"){
      final List<PackDesc> packDescs= [];
      PackDesc packDesc = PackDesc(goodsNumber: "@141441", numberOfYards: 36, assignedAmount: 3, scannedNumber: 0);
      packDescs.add(packDesc);
      data = Code(number: "@141441", code: 1, msg: "扫描成功", packDesc: packDescs);

    }else if(widget.isDesc == "pdms"){
      data = PackDesc(
          goodsNumber: qrcode,
          numberOfYards: 36,
          assignedAmount: 3,
          scannedNumber: 1
      );
    }else if(widget.isDesc == "car"){
      data = CountCode(number: "14124", total: 10, count: 5, code: 1, msg: "success");
    }

    Navigator.of(context).pushNamed("${widget.uri}", arguments: data);
    //扫描到的条形码或二维码内容
    print("条形码或二维码为: " + qrcode);
    //...处理后续逻辑，如授权登录
  }
}