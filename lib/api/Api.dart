
import 'package:tlms/api/HttpApi.dart';

class Api {
  static login(String path, Map<String, String> params) {
    return Request().post(path, params: params, data: params);
  }

  static getColumn(String path, params){
    return Request().get(path, params: params);
  }
}