import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlms/api/Api.dart';
import 'package:tlms/data/DataClass.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  _LoginView createState() =>_LoginView();
}

class _LoginView extends State<LoginView>{
  String wl = "物流商";
  String ol = "";
  bool selected = false;
  var usercontroller = TextEditingController();
  var pwdcontroller = TextEditingController();

  // 表单数据
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  late FormState formState;
  var username;
  var passwd;
  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form != null) {
      _form.save();
      _login(username, passwd, ol);
    }
  }

  //保存数据
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formState = FormState();
    initFromCache();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(child: Scaffold(
      body: Form(
          key: _formKey,
          child:
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:Text("账户", style: TextStyle(fontSize: 20)),
                    ),
                    TextFormField(
                      controller: usercontroller,
                      key: Key("username"),
                      decoration: InputDecoration(
                        hintText: '账户',
                      ),
                      onSaved: (val){
                        username = val;
                        saveInfo("_username", username);
                      },
                    ),

                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topLeft,
                      child:Text("密码", style: TextStyle(fontSize: 20)),
                    ),
                    TextFormField(
                      controller: pwdcontroller,
                      key: Key("passwd"),
                      decoration: InputDecoration(
                        hintText: '密码',
                      ),
                      obscureText: true,
                      onSaved: (val){
                        passwd = val;
                        saveInfo("_passwd", passwd);
                      },
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        _showLogisticsDrawer(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${wl}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    // 登录按钮点击事件

                    _forSubmitted();
                    // _login();
                    // Navigator.pushNamed(context, "/home");
                  },
                  child: Text('登录', style: TextStyle(color: Colors.white, fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3fd550),
                    padding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ],
          )

      ),
    ));
  }

  void _showLogisticsDrawer(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        wl="物流商";
                      });
                    },
                    child: Text('取消', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  TextButton(
                    onPressed: () {
                      // 确定按钮点击事件
                      Navigator.pop(context);
                      setState(() {
                        wl=ol;
                      });
                      saveInfo("_ol", ol);
                    },
                    child: Text('确定', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ],
              ),
              ListTile(
                tileColor: Colors.white,

                title: Align(child: Text('BSHWL'),alignment: Alignment.center,),
                onTap: () {
                  // 选择BSHWL逻辑
                  setState(() {
                    ol="BSHWL";
                  });
                },
                selected: selected, // 初始选中状态
                selectedTileColor: Colors.green, //
              ),
              ListTile(
                tileColor: Colors.white,

                title:  Align(child: Text('JHWL'),alignment: Alignment.center,),
                onTap: () {
                  // 选择JHWL逻辑
                  setState(() {
                    ol="JHWL";
                  });
                },
                selected: selected, // 初始选中状态
                selectedTileColor: Colors.green, //
              ),
            ],
          ),
        );
      },
    );
  }

  void _login(username, passed, ol) async {
    Map<String, String> params = {
      'username': username,
      'passwd': passed,
      'wl': ol,
      // 添加其他参数...
    };
    var response = await Api.login("/login/login", params);

    if (response['code'] == 0){
      EasyLoading.showSuccess("登录成功");
      Future.delayed(const Duration(seconds: 1), () {
        //  关闭指示器
        EasyLoading.dismiss();
        EasyLoading.show(status: "页面跳转中...");
        Future.delayed(const Duration(seconds: 1), () {
          //  关闭指示器
          EasyLoading.dismiss();
          print(response['data']);
          UserData userData = UserData(id: response['data']['id'], rid: response['data']['rid'], username: response['data']['username'], nickname: response['data']['nickname']);
          Navigator.pushNamed(context, "/home",  arguments: userData);
        });
      });


    }
  }


  //从缓存中获取信息填充
  void initFromCache() async {
    //获取SharedPreferences对象
    final SharedPreferences prefs = await _prefs;
    //根据键（key）获取本地存储的值（value）
    final _username = prefs.getString("username");
    final _passwd = prefs.getString("passwd");
    final _ol = prefs.getString("ol");
    //获取到缓存中的值后，使用setState更新界面信息
    setState(() {
      usercontroller.text = (_username == null ? "" : _username);
      pwdcontroller.text = (_passwd == null ? "" : _passwd);
      this.username = (username == null ? "" : _username);
      this.passwd = (passwd == null ? "" : _passwd);
      this.ol = (_ol == null ? "" : _ol);
    });
  }

  //保存界面的输入选择信息
  void saveInfo(String key, String val)  async{
    final SharedPreferences prefs=await _prefs;
    prefs.setString(key, val);
  }
}