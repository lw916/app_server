/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: update.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'dart:async';
import 'package:app_performance_server/config/config.dart';
import 'package:app_performance_server/utils/db.dart';
import 'package:app_performance_server/utils/redis.dart';
import 'package:logging/logging.dart';

class DbToRedis{

  // 创建定时任务
  static Future<void> createTask() async{
    createStream();
  }

  // 定时任务函数
  static Future<void> createStream() async{
    int count = 0;
    // 设置按天数每天更新redis缓存
    final Stream<int> stream = Stream<int>.periodic(const Duration(days: DevConfig.redisUpdateDuration), (int callBack){
      storeData();
      return count++;
    });

    stream.listen((int result){
      if(count == DevConfig.redisFlushDuration){
        count = 0;
      }
    });
  }

  // 存储数据函数
  static Future<void> storeData() async {
    DataBaseController().selectDataList('test',{})
        .then((dynamic value) => {
      RedisController().setValue('data', value).then((dynamic value) => {
        if(value != null) { Logger.root.warning('缓存失败') }})
    }
    );
  }

}




