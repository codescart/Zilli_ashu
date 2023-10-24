
class WithdrawCurrencyConvertModel {
  WithdrawCurrencyConvertModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  WithdrawCurrencyConvertModel.fromJson(dynamic json) {
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

class Data {
  Data({
    List<CurrencyConvertInfo>? currencyConvertInfo,}){
    _currencyConvertInfo = currencyConvertInfo;
  }

  Data.fromJson(dynamic json) {
    if (json['currency_convert_info'] != null) {
      _currencyConvertInfo = [];
      json['currency_convert_info'].forEach((v) {
        _currencyConvertInfo?.add(CurrencyConvertInfo.fromJson(v));
      });
    }
  }
  List<CurrencyConvertInfo>? _currencyConvertInfo;

  List<CurrencyConvertInfo>? get currencyConvertInfo => _currencyConvertInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_currencyConvertInfo != null) {
      map['currency_convert_info'] = _currencyConvertInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrencyConvertInfo {
  CurrencyConvertInfo({
    int? id,
    int? currencyId,
    int? parCurrency,
    String? coin,
    int? status,
    String? createdAt,
    String? updatedAt,
    Currency? currency,}){
    _id = id;
    _currencyId = currencyId;
    _parCurrency = parCurrency;
    _coin = coin;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
  }

  CurrencyConvertInfo.fromJson(dynamic json) {
    _id = json['id'];
    _currencyId = json['currency_id'];
    _parCurrency = json['par_currency'];
    _coin = json['coin'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  int? _id;
  int? _currencyId;
  int? _parCurrency;
  String? _coin;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  Currency? _currency;

  int? get id => _id;
  int? get currencyId => _currencyId;
  int? get parCurrency => _parCurrency;
  String? get coin => _coin;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Currency? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_id'] = _currencyId;
    map['par_currency'] = _parCurrency;
    map['coin'] = _coin;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    return map;
  }

}

class Currency {
  Currency({
    int? id,
    String? name,
    String? isoCode,
    String? symbol,
    dynamic fullUnitName,
    dynamic subUnitName,
    int? defaulty,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,}){
    _id = id;
    _name = name;
    _isoCode = isoCode;
    _symbol = symbol;
    _fullUnitName = fullUnitName;
    _subUnitName = subUnitName;
    _default = defaulty;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Currency.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isoCode = json['iso_code'];
    _symbol = json['symbol'];
    _fullUnitName = json['full_unit_name'];
    _subUnitName = json['sub_unit_name'];
    _default = json['default'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _isoCode;
  String? _symbol;
  dynamic _fullUnitName;
  dynamic _subUnitName;
  int? _default;
  int? _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get isoCode => _isoCode;
  String? get symbol => _symbol;
  dynamic get fullUnitName => _fullUnitName;
  dynamic get subUnitName => _subUnitName;
  int? get defaulty => _default;
  int? get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['iso_code'] = _isoCode;
    map['symbol'] = _symbol;
    map['full_unit_name'] = _fullUnitName;
    map['sub_unit_name'] = _subUnitName;
    map['default'] = _default;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}