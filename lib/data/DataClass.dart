class Code {
  final String number;
  final int code;
  final String msg;
  final List<PackDesc> packDesc;
  Code({required this.number, required this.code, required this.msg, required this.packDesc});
}


class PackDesc{
  final String goodsNumber;
  final int numberOfYards;
  final int assignedAmount;
  final int scannedNumber;

  PackDesc({
    required this.goodsNumber,
    required this.numberOfYards,
    required this.assignedAmount,
    required this.scannedNumber
  });
}

class CountCode{
  final String number;
  final int total;
  final int count;
  final int code;
  final String msg;

  CountCode({
    required this.number,
    required this.total,
    required this.count,
    required this.code,
    required this.msg,
  });
}

class CountCodeDesc{
  final String EANnumber; // EAN条码
  final String ItemNumber; // 外箱款号
  final String OuterBoxNumber; // 外箱货号
  final int CarTotal; // 订舱总件数
  final int NoCount; // 未扫描
  final int code; // 返回吗
  final String msg; // 返回信息

  CountCodeDesc({
    required this.EANnumber,
    required this.ItemNumber,
    required this.OuterBoxNumber,
    required this.CarTotal,
    required this.NoCount,
    required this.code,
    required this.msg,
  });
}

class Login{
  final String username;
  final String pwd;

  Login({required this.username, required this.pwd});
}

class UserData{
  final int id;
  final int rid;
  final String username;
  final String nickname;

  UserData({required this.id, required this.rid, required this.username, required this.nickname});
}

class ColumnData{
  final String name;
  final String action;
  final String url;
  final String background;
  final String icon;
  ColumnData({required this.name, required this.action, required this.url, required this.background, required this.icon});
}

