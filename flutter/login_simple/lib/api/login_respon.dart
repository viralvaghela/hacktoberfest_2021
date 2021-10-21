class LoginRespon {
  bool error;
  String message;
  bool success;
  //String uid;
  //String username;

  LoginRespon.fromJsonMap(Map<String, dynamic> map)
      : error = map['error'],
        message = map['message'],
        success = map['success'];
  //uid = map['uid'],
  //username = map['username'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['message'] = message;
    data['success'] = success;
    //data['uid'] = uid;
    //data['username'] = username;
    return data;
  }
}
