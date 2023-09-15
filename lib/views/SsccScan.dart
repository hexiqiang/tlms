import 'package:flutter/material.dart';
import 'package:tlms/common/Common.dart';
import 'package:tlms/data/DataClass.dart';

class SsccScan extends StatefulWidget{

  const SsccScan({super.key});
  _SsccScan createState() => _SsccScan();
}

class _SsccScan extends State<SsccScan>{

  @override
  Widget build(BuildContext context){
    final CountCode countCode;
    if(ModalRoute.of(context)?.settings.arguments != null){
      countCode = ModalRoute.of(context)?.settings.arguments as CountCode;
    }else{
      countCode = CountCode(number: "", total: 0, count: 0, code: 0, msg: "");
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
                          child: Text("EAN条码：${countCode.number}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("外箱款号：${countCode.total}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("外箱货号：${countCode.count}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("未扫描：${countCode.count}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("扫描数据：${countCode.count}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("扫描结果：${countCode.count}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 200,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: CommonScan(title: "请扫码", uri: "/scan/loadingcar", isDesc: "car",),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFF3fd550),
                ),

                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("返回货物列表", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}