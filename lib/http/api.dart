import 'request.dart';

class Api {
  static Category() {
    return Request.post("/category");
  }

  static VideoList(data) {
    return Request.post("/video/list", data: data);
  }
}