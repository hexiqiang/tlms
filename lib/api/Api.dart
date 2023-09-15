
import 'package:tlms/api/HttpApi.dart';

class Api {
  static login(String path, Map<String, String> params) {
    return Request().post(path, params: params, data: params);
  }
}