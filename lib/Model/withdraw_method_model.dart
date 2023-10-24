/// success : true
/// message : "Get Data Successfully !"
/// data : {"withdraw_method":[{"id":1,"name":"Paypal","minimum_amount":1000,"image":"back-end/img/Withdraw_method_image/16564984192789.jpg","status":1,"created_at":"2022-06-29T06:26:59.000000Z","updated_at":"2022-09-20T01:29:26.000000Z"}]}

class WithdrawMethodModel {
  WithdrawMethodModel({
      bool? success,
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  WithdrawMethodModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// withdraw_method : [{"id":1,"name":"Paypal","minimum_amount":1000,"image":"back-end/img/Withdraw_method_image/16564984192789.jpg","status":1,"created_at":"2022-06-29T06:26:59.000000Z","updated_at":"2022-09-20T01:29:26.000000Z"}]

class Data {
  Data({
      List<WithdrawMethod>? withdrawMethod,}){
    _withdrawMethod = withdrawMethod;
}

  Data.fromJson(dynamic json) {
    if (json['withdraw_method'] != null) {
      _withdrawMethod = [];
      json['withdraw_method'].forEach((v) {
        _withdrawMethod?.add(WithdrawMethod.fromJson(v));
      });
    }
  }
  List<WithdrawMethod>? _withdrawMethod;

  List<WithdrawMethod>? get withdrawMethod => _withdrawMethod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withdrawMethod != null) {
      map['withdraw_method'] = _withdrawMethod?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Paypal"
/// minimum_amount : 1000
/// image : "back-end/img/Withdraw_method_image/16564984192789.jpg"
/// status : 1
/// created_at : "2022-06-29T06:26:59.000000Z"
/// updated_at : "2022-09-20T01:29:26.000000Z"

class WithdrawMethod {
  WithdrawMethod({
      int? id, 
      String? name, 
      int? minimumAmount, 
      String? image, 
      int? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _minimumAmount = minimumAmount;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  WithdrawMethod.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _minimumAmount = json['minimum_amount'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  int? _minimumAmount;
  String? _image;
  int? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  int? get minimumAmount => _minimumAmount;
  String? get image => _image;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['minimum_amount'] = _minimumAmount;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}