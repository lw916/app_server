/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: backend.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

/// _id : "61075f6c4391a500163cce22"
/// appName : "SAIL OOCL"
/// userId : "CHENAC"
/// userName : "ACE CHEN (MBC-ISD-OOCLL/ZHA)"
/// guid : "4c171d70f33d11eb959433334349d3fc"
/// httpCode : "401"
/// payload : "DioError [DioErrorType.response]: Http status error [401]\n#0      DioMixin.assureDioError (package:dio/src/dio_mixin.dart:819:20)\n#1      DioMixin._dispatchRequest (package:dio/src/dio_mixin.dart:678:13)\n<asynchronous suspension>\n#2      DioMixin.fetch.<anonymous closure>.<anonymous closure> (package:dio/src/dio_mixin.dart)\n<asynchronous suspension>\n"
/// timeZone : "CST"
/// appVersion : "2.0.0(1)"
/// networkType : "WIFI"
/// deviceModel : "iPhone13,3-14.2.1"
/// api_performance : "https://irisuat.oocl.com/mobile/oauth/sales/agent/announcement/v1"
/// startTimeStamp : "1627873016007"
/// endTimeStamp : "1627873016158"
/// telecom : "{\"allowsVOIP\":true,\"carrierName\":null,\"isoCountryCode\":null,\"mobileCountryCode\":null,\"mobileNetworkCode\":null,\"mobileNetworkOperator\":\"\",\"networkGeneration\":null,\"radioType\":null}"
/// interval : "151"
/// endTime : "2021-08-02 02:56:56.158"
/// startTime : "2021-08-02 02:56:56.007"
/// __v : "0"

class Backend {
  Backend({
      String? id, 
      String? appName, 
      String? userId, 
      String? userName, 
      String? guid, 
      String? httpCode, 
      String? payload, 
      String? timeZone, 
      String? appVersion, 
      String? networkType, 
      String? deviceModel, 
      String? api, 
      String? startTimeStamp, 
      String? endTimeStamp, 
      String? telecom, 
      String? interval, 
      String? endTime, 
      String? startTime, 
      String? v,}){
    _id = id;
    _appName = appName;
    _userId = userId;
    _userName = userName;
    _guid = guid;
    _httpCode = httpCode;
    _payload = payload;
    _timeZone = timeZone;
    _appVersion = appVersion;
    _networkType = networkType;
    _deviceModel = deviceModel;
    _api = api;
    _startTimeStamp = startTimeStamp;
    _endTimeStamp = endTimeStamp;
    _telecom = telecom;
    _interval = interval;
    _endTime = endTime;
    _startTime = startTime;
    _v = v;
}

  Backend.fromJson(dynamic json) {
    _id = json['_id'];
    _appName = json['appName'];
    _userId = json['userId'];
    _userName = json['userName'];
    _guid = json['guid'];
    _httpCode = json['httpCode'];
    _payload = json['payload'];
    _timeZone = json['timeZone'];
    _appVersion = json['appVersion'];
    _networkType = json['networkType'];
    _deviceModel = json['deviceModel'];
    _api = json['api_performance'];
    _startTimeStamp = json['startTimeStamp'];
    _endTimeStamp = json['endTimeStamp'];
    _telecom = json['telecom'];
    _interval = json['interval'];
    _endTime = json['endTime'];
    _startTime = json['startTime'];
    _v = json['__v'];
  }
  String? _id;
  String? _appName;
  String? _userId;
  String? _userName;
  String? _guid;
  String? _httpCode;
  String? _payload;
  String? _timeZone;
  String? _appVersion;
  String? _networkType;
  String? _deviceModel;
  String? _api;
  String? _startTimeStamp;
  String? _endTimeStamp;
  String? _telecom;
  String? _interval;
  String? _endTime;
  String? _startTime;
  String? _v;

  String? get id => _id;
  String? get appName => _appName;
  String? get userId => _userId;
  String? get userName => _userName;
  String? get guid => _guid;
  String? get httpCode => _httpCode;
  String? get payload => _payload;
  String? get timeZone => _timeZone;
  String? get appVersion => _appVersion;
  String? get networkType => _networkType;
  String? get deviceModel => _deviceModel;
  String? get api => _api;
  String? get startTimeStamp => _startTimeStamp;
  String? get endTimeStamp => _endTimeStamp;
  String? get telecom => _telecom;
  String? get interval => _interval;
  String? get endTime => _endTime;
  String? get startTime => _startTime;
  String? get v => _v;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['_id'] = _id;
    map['appName'] = _appName;
    map['userId'] = _userId;
    map['userName'] = _userName;
    map['guid'] = _guid;
    map['httpCode'] = _httpCode;
    map['payload'] = _payload;
    map['timeZone'] = _timeZone;
    map['appVersion'] = _appVersion;
    map['networkType'] = _networkType;
    map['deviceModel'] = _deviceModel;
    map['api_performance'] = _api;
    map['startTimeStamp'] = _startTimeStamp;
    map['endTimeStamp'] = _endTimeStamp;
    map['telecom'] = _telecom;
    map['interval'] = _interval;
    map['endTime'] = _endTime;
    map['startTime'] = _startTime;
    map['__v'] = _v;
    return map;
  }

  Map<String, dynamic> query(){
    final Map<String, dynamic> queryMap = <String, dynamic>{};
    _id != null ? queryMap['_id'] = _id.toString() : null;
    _appName != null ? queryMap['appName'] = _appName : null;
    userId != null ? queryMap['userId'] = _userId : null;
    userName != null ? queryMap['userName'] = {r'$regex':_userName} : null;
    guid != null ? queryMap['guid'] = _guid : null;
    httpCode != null ? queryMap['httpCode'] = _httpCode : null;
    payload != null ? queryMap['payload'] = _payload : null;
    timeZone != null ? queryMap['timeZone'] = _timeZone : null;
    appVersion != null ? queryMap['appVersion'] = _appVersion : null;
    networkType != null ? queryMap['networkType'] = _networkType : null;
    deviceModel != null ? queryMap['deviceModel'] = _deviceModel : null;
    api != null ? queryMap['api_performance'] = _api : null;
    startTimeStamp != null ? queryMap['startTimeStamp'] = _startTimeStamp : null;
    endTimeStamp != null ? queryMap['endTimeStamp'] = _endTimeStamp : null;
    telecom != null ? queryMap['telecom'] = _telecom : null;
    interval != null ? queryMap['interval'] = _interval : null;
    endTime != null ? queryMap['endTime'] = _endTime : null;
    startTime != null ? queryMap['startTime'] = _startTime : null;
    _v != null ? queryMap['__v'] = _v : null;
    return queryMap;
  }

}