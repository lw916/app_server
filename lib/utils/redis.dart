/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: redis.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'dart:convert';
import 'package:app_performance_server/config/config.dart';
import 'package:logging/logging.dart';
import 'package:redis/redis.dart';


class RedisController {

  // Redis控制器单例
  factory RedisController() => _controller;
  RedisController._internal();
  static final RedisController _controller = RedisController._internal();

  final RedisConnection conn = RedisConnection();
  late Command redisConnect;

  // 连接redis
  Future<void> connect() async{
    try{
      redisConnect = await conn.connect(DevConfig.redisUrl, DevConfig.redisPort);
    }catch(error){
      throw Exception(error);
    }
  }

  // 断连redis
  Future<void> disconnect() async{
    try{
      await conn.close();
    }catch(error){
      throw Exception(error);
    }
  }

  // 获取value
  Future<dynamic> getValue(String key) async{
    try{
      return await redisConnect.send_object(['GET',key]);
    }catch(error){
      Logger.root.warning(error); // 报错打日志
      return false;
    }
  }

  // 设置key value
  Future<dynamic> setValue(String key, List value) async{
    try{
      await redisConnect.send_object(['SET', key, jsonEncode({'data':value})]).then((var value){
        if(value == 'OK'){
          return true;
        }else{
          Logger.root.warning(value); // 无法写入打日志
          return false;
        }
      });
    }catch(error){
      Logger.root.warning(error); // 报错打日志
      return false;
    }
  }

  // 快速插入多行数据
  Future<bool> fastValue(Map<String, dynamic> data) async {
    try{
      redisConnect.pipe_start();
      data.forEach((String key, dynamic value) {
        redisConnect.send_object(['SET', key, value]).then((value){
          if(value != 'ok'){
            Logger.root.warning(value);
          }
        });
      });
      redisConnect.pipe_end();
      return true;
    }catch(error){
      Logger.root.warning(error);
      return false;
    }
  }


}