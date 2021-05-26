import 'request.dart';

class Api {
  static Category() {
    return Request.post("/category");
  }

  static VideoList(data) {
    return Request.post("/video/list", data: data);
  }

  static Login(data) {
    return Request.post("/login", data: data);
  }

  static UserInfo() {
    return Request.post("/user");
  }

  static CarmiExchange(data) {
    return Request.post("/cipher/receive", data: data);
  }

  static FansList(data) {
    return Request.post("/follow/fans", data: data);
  }

  static FollowList(data) {
    return Request.post("/follow/me", data: data);
  }

  static FollowUser(data) {
    return Request.post("/follow/on", data: data);
  }
}