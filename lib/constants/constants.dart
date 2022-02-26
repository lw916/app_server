/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: constants.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

class Constants{

  /// 跨域头设置
  static Map<String, String> overrideHeaders = {'ACCESS_CONTROL_ALLOW_ORIGIN': 'localhost', 'Content-Type': 'application/json;charset=utf-8'};

  /// 接口认证返回码
  static const int verifyNeeded = -1;// 需要认证(如未提供session、token等)

  static const int verifyFailed = -2;// 认证失败(如提供的session、token无效，过期，不可解析)

  static const int verifyNotNeeded = 0;// 无需认证(如静态页面，登录页面)

  static const int verifySuccess = 1;// 认证成功

  /// 接口请求返回码

 static const int httpSuccess = 1;// 请求成功

 static const int httpFail = 0;// 请求失败

 static const int httpUnCorrect = -1;// 请求有误

}