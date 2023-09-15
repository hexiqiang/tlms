import 'package:flutter/material.dart';
import 'package:tlms/common/Common.dart';
import 'package:tlms/data/DataClass.dart';

class Pdms extends StatefulWidget{

  const Pdms({super.key});
  _Pdms createState() => _Pdms();
}

class _Pdms extends State<Pdms>{

  @override
  Widget build(BuildContext context){
    final PackDesc packDesc;
    if(ModalRoute.of(context)?.settings.arguments != null){
      packDesc = ModalRoute.of(context)?.settings.arguments as PackDesc;
    }else{
      packDesc = PackDesc(goodsNumber: "请扫码", numberOfYards: 0, assignedAmount: 0, scannedNumber: 0);
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
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("二维码值：${packDesc.goodsNumber}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("货物款号：${packDesc.numberOfYards}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("码数：${packDesc.assignedAmount}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("数量：${packDesc.scannedNumber}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 500,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: CommonScan(title: "请扫码", uri: "/scan/pdms", isDesc: "pdms",),
            )
          ),
        ],
      ),
    );
  }
}