import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:tlms/data/DataClass.dart';


class PackView extends StatefulWidget {
  const PackView({super.key});

  _PackView createState() => _PackView();
}

class _PackView extends State<PackView> {

  @override
  Widget build(BuildContext context) {
    final List<PackDesc> packDescs= [];
    PackDesc packDesc = PackDesc(goodsNumber: "@141441", numberOfYards: 36, assignedAmount: 3, scannedNumber: 0);
    packDescs.add(packDesc);
    Code code = Code(number: "", code: 0, msg: "请扫描",packDesc: packDescs);
    if(ModalRoute.of(context)?.settings.arguments != null){
      code = ModalRoute.of(context)?.settings.arguments as Code;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "外箱SSCC：",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "货物款号",
                            style: TextStyle(color: Color(0xFF3fd550)),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "码数",
                            style: TextStyle(color: Color(0xFF3fd550)),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "分配数量",
                            style: TextStyle(color: Color(0xFF3fd550)),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "扫码数量",
                            style: TextStyle(color: Color(0xFF3fd550)),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: 50,
                            child: Text(
                              "操作",
                              style: TextStyle(color: Color(0xFF3fd550)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if(code.code == 1)
              Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              margin: EdgeInsets.all(8),
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
              child: Column(
                children: [
                  for(var i = 0; i < code.packDesc.length; i++)
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                              "${code.packDesc[i].goodsNumber}",
                              style: TextStyle(color: Colors.black),
                            )),
                        Flexible(
                            child: Text(
                              "${code.packDesc[i].numberOfYards}",
                              style: TextStyle(color: Colors.black),
                            )),
                        Flexible(
                            child: Text(
                              "${code.packDesc[i].assignedAmount}",
                              style: TextStyle(color: Colors.black),
                            )),
                        Flexible(
                            child: Text(
                              "${code.packDesc[i].scannedNumber}",
                              style: TextStyle(color: Colors.black),
                            )),
                        Flexible(
                          child: Container(
                            height: 30,
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
                              color: Colors.grey,
                            ),
                            child: TextButton(
                              onPressed: () {
                                final List<PackDesc> packDescs= [];
                                Code code = Code(number: "123412421", code: 0, msg: "成功", packDesc: packDescs);
                                //扫描到的条形码或二维码内容
                                Navigator.of(context).pushNamed("/scan/view",arguments: code);
                              },
                              child: Text(
                                "解除扫描",
                                style:
                                TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                  width: 140,
                  height: 80,
                  child: Container(
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
                      color: Color(0xFF3fd550),
                    ),
                    child: TextButton(
                      child: Text(
                        "打包确认",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // Action here
                      },
                    ),
                  ),
                )),
              ),
              Flexible(
                child: Align(
                    child: SizedBox(
                  width: 140,
                  height: 80,
                  child: Container(
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
                      color: Color(0xFF3fd550),
                    ),
                    child: TextButton(
                      child: Text(
                        "打包扫描",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // Action here
                        openQRScanPage();
                      },
                    ),
                  ),
                )),
              ),
            ],
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
    final List<PackDesc> packDescs= [];
    PackDesc packDesc = PackDesc(goodsNumber: "@141441", numberOfYards: 36, assignedAmount: 3, scannedNumber: 0);
    packDescs.add(packDesc);
    Code code = Code(number: "@141441", code: 1, msg: "扫描成功", packDesc: packDescs);
    Navigator.of(context).pushNamed("/scan/pack/view", arguments: code);
    //扫描到的条形码或二维码内容
    print("条形码或二维码为: " + qrcode);
    //...处理后续逻辑，如授权登录
  }
}

