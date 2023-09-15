import 'package:flutter/material.dart';

class NoScanPack extends StatefulWidget{
  const NoScanPack({super.key});


  _NoScanPack createState() => _NoScanPack();
}


class _NoScanPack extends State<NoScanPack>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 16),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text("总数：0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Flexible(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "外箱EAN",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Flexible(child: Align(
                        alignment: Alignment.center,
                        child: Text(
                            "外箱sscc",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 570,
              margin: EdgeInsets.all(16),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Flexible(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "124523523514",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Flexible(child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "512543634624234",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
          )
        ],
      )

    );
  }

}