import 'request.dart';

class Api {
  static Category() {
    return Request.post("/category");
  }
}