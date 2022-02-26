/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: auth_filter.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'package:app_performance_server/constants/constants.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';


/// 接口验证中间件
Middleware auth(){
  return (Handler handler){
    return (Request request){
      return Future.sync((){
        final int result = Auth.handle(request);
        switch(result){
          case Constants.verifyNeeded:
            return Response.forbidden('Token is not provided!'); // token未提供
          case Constants.verifyFailed:
            return Response.forbidden('Token is invalid or out of date!'); // token无效或过期
        }
        return handler(
          request
        );
      }).then((Response response){
        return response;
      });
    };
  };
}


abstract class Auth{

  // 定义接口是否进行验证
  static int handle(Request request){
    final String interface = request.url.toString();
    switch(interface){
      case 'login':
        return Constants.verifyNotNeeded;
      case '':
        return Constants.verifyNotNeeded;
      default:
        return verify(request);
    }
  }

  // 接口token验证
  static int verify(Request request){
    String token = '';
    try{
      if(request.headers['Authorization'] == null){
        return Constants.verifyNeeded;
      }else{
        token = request.headers['Authorization']!.replaceAll('Bearer', '');
        JWT.verify(token, SecretKey('123456'));
        return Constants.verifySuccess;
      }
    }catch(error){
      print(error);
      return Constants.verifyFailed;
    }
  }


}