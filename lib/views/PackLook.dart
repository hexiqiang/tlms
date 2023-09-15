import 'package:flutter/material.dart';
import 'package:tlms/common/Common.dart';
import 'package:tlms/data/DataClass.dart';

class PackLook extends StatefulWidget{

  const PackLook({super.key});
  _PackLook createState() => _PackLook();
}

class _PackLook extends State<PackLook>{

  @override
  Widget build(BuildContext context){
    final CountCode countCode;
    final CountCodeDesc countCodeDesc;
    if(ModalRoute.of(context)?.settings.arguments != null){
      countCode = ModalRoute.of(context)?.settings.arguments as CountCode;
    }else{
      countCode = CountCode(number: "", total: 0, count: 0, code: 0, msg: "");
      countCodeDesc = CountCodeDesc(EANnumber: "!231423", ItemNumber: "#325", OuterBoxNumber: "534523", CarTotal: 1, NoCount: 1, code: 1, msg: "success");
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
                          child: Text("条码号：${countCode.number}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("订舱总件数：${countCode.total}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("未扫描数量：${countCode.count}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                          child: Text("交期：${countCode.number}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("状态：${countCode.total}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("箱数：${countCode.count}"),
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
                      width: 300,
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
                            "查看未扫描详情",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            // Action here
                            Navigator.pushNamed(context, "/scan/pack/no");
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
}