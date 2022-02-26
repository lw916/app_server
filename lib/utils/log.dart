/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: log.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'dart:io';
import 'package:app_performance_server/config/config.dart';

class LogUtil {

  // log单例
  factory LogUtil() => _logUtil;
  LogUtil._internal() {
    init();
  }
  static final LogUtil _logUtil = LogUtil._internal();
  late final Directory dict; // log路径
  late final File file; // log文件


  // 初始化函数
  void init() {
    dict = Directory(DevConfig.logUrl);
    file = File('${dict.path}/development.log');
  }


  // log日志写入文件
  void log(String log) {
    if(file.existsSync()){
      file.writeAsStringSync(log, mode: FileMode.append);
    }
  }


}