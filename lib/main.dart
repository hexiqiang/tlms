import 'package:flutter/material.dart';
import 'package:tlms/common/Layout.dart';
import 'package:tlms/views/DropDesc.dart';
import 'package:tlms/views/DropInstallationScan.dart';
import 'package:tlms/views/DropScan.dart';
import 'package:tlms/views/Home.dart';
import 'package:tlms/views/LoadingCar.dart';
import 'package:tlms/views/LoadingCarDesc.dart';
import 'package:tlms/views/Login.dart';
import 'package:tlms/views/LoginView.dart';
import 'package:tlms/views/NoScanPack.dart';
import 'package:tlms/views/PackLook.dart';
import 'package:tlms/views/PackView.dart';
import 'package:tlms/views/Pdms.dart';
import 'package:tlms/views/Scan.dart';
import 'package:tlms/views/ScanView.dart';
import 'package:tlms/views/SsccScan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/home': (context) => LayoutBody(body: HomePage(), title: "TLMS管理", back: false), //首页
          '/login': (context) => LayoutBody(body: LoginPage(), title: "登录", back: false), //登录
          '/login/view': (context) => LayoutBody(body: LoginView(), title: "登录", back: false), // 登录
          '/scan': (context) => LayoutBody(body: Scan(), title: "sscc扫描", back: true), // 扫码
          '/scan/view': (context) => LayoutBody(body: ScanView(), title: "解除打包", back: true), // 解除打包
          '/scan/pack/view': (context) => LayoutBody(body: PackView(), title: "包装明细", back: true), //
          '/scan/pdms': (context) => LayoutBody(body: Pdms(), title: "PDMS", back: true),
          '/scan/loadingcar': (context) => LayoutBody(body: LoadingCar(), title: "订舱条码扫描", back: true),
          '/scan/loadingcar/desc': (context) => LayoutBody(body: LoadingCarDesc(), title: "订舱明细", back: true),
          '/scan/sscc': (context) => LayoutBody(body: SsccScan(), title: "sscc条码扫描", back: true),
          '/scan/pack/look': (context) => LayoutBody(body: PackLook(), title: "打包查询", back: true),
          '/scan/pack/no': (context) => LayoutBody(body: NoScanPack(), title: "查看未扫描明细", back: true),
          '/scan/drop':(context) => LayoutBody(body: DropInstallationScan(), title: "落装扫描", back: true),
          '/scan/drop/desc':(context) => LayoutBody(body: DropDesc(), title: "落装明细", back: true),
          '/scan/drop/scan':(context) => LayoutBody(body: DropScan(), title: "sscc扫描", back: true),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LayoutBody(body: LoginPage(), title: "登录", back: false),
    );
  }
}

