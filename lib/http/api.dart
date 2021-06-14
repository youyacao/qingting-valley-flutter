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

  static InviteList(data) {
    return Request.post("/refer", data: data);
  }

  static TaskList() {
    return Request.post("/task/list");
  }

  static RecieveTask(task_id) {
    return Request.post("/task/receive", data: {'task_id': task_id});
  }

  static DownloadRecord(data) {
    return Request.post("/downloadList", data: data);
  }

  static AddDownloadRecord(vid) {
    return Request.post("/download", data: {'vid': vid});
  }

  static PlayRecord(data) {
    return Request.post("/video/historyList", data: data);
  }

  static LikeVideoList(data) {
    return Request.post("/like/me", data: data);
  }

  static UserList(data) {
    return Request.post("/user/search", data: data);
  }

  static Config(data) {
    return Request.post("/config", data: { 'key': data });
  }

  static VideoCommentsRecords(data) {
    return Request.post("/comment/me", data: data);
  }

  static VideoLikesList(data) {
    return Request.post("/like/me", data: data);
  }

  static Banner(int type) {
    return Request.post("/advert/list", data: { 'type': type });
  }

  static Agreement(data) {
    return Request.post("/system", data: { 'key': data });
  }
}
