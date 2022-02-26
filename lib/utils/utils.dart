/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: utils.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'dart:convert';
import 'dart:io';
import 'package:app_performance_server/constants/constants.dart';
import 'package:shelf/shelf.dart';

class Utils{

  // 返回json数据
  static Future<Response> responseJson( Request request, {int code = Constants.httpSuccess, String msg = 'Success!', Map<String,dynamic>? extraData, String type = 'ok'} ) async {
    Map<String, dynamic> returnData = {};
    if(extraData != null && extraData.isNotEmpty){
      returnData = { 'code': code, 'msg': msg };
      returnData.addAll(extraData);
    }else{
      returnData = { 'code': code, 'msg': msg };
    }
    switch(type){
      case 'ok':
        return Response.ok(jsonEncode(returnData), headers: { HttpHeaders.contentTypeHeader: 'application/json' } );
      case 'forbidden':
        return Response.forbidden(jsonEncode(returnData), headers: { HttpHeaders.contentTypeHeader: 'application/json' } );
      case 'notFound':
        return Response.notFound(jsonEncode(returnData), headers: { HttpHeaders.contentTypeHeader: 'application/json' } );
      default:
        return Response.ok(jsonEncode(returnData), headers: { HttpHeaders.contentTypeHeader: 'application/json' } );
    }
  }

}
