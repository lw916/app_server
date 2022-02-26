/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: main.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'dart:io';
import 'dart:isolate';
import 'package:app_performance_server/config/config.dart';
import 'package:app_performance_server/constants/constants.dart';
import 'package:app_performance_server/filter/auth_filter.dart';
import 'package:app_performance_server/router/router.dart';
import 'package:app_performance_server/task/update.dart';
import 'package:app_performance_server/utils/db.dart';
import 'package:app_performance_server/utils/log.dart';
import 'package:app_performance_server/utils/redis.dart';
import 'package:logging/logging.dart' as logging;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';


/// 本文件对应服务器最终启动入口
Future<void> main(List<String> args) async {

  /// 日志获取,打印及写日志
  logging.hierarchicalLoggingEnabled = true;
  logging.Logger.root.onRecord.listen((logging.LogRecord msg) async{
    (msg.level < logging.Level.SEVERE ? stdout : stderr)
        .write('${msg.time} ${msg.level.name} [${Isolate.current.debugName}] ${msg.loggerName}: ${msg.message}\n');
    LogUtil().log('${msg.time} ${msg.level.name} [${Isolate.current.debugName}] ${msg.loggerName}: ${msg.message}\n'); // 每条日志进行记录
    }
  );

  /// 启动server
  try{
    await RedisController().connect(); // 连接redis数据库
    await DataBaseController().connectDB(); // 连接芒果数据库
    await DbToRedis.storeData(); // 第一次启动服务器缓存redis数据库信息
    DbToRedis.createTask(); // 创建redis每日缓存任务
    final Service service = Service(); // 导入路由
    final Handler handler = const Pipeline()
        .addMiddleware(auth()) // 添加接口验证中间件
        .addMiddleware(logRequests()) // 添加日志中间件
        .addMiddleware(corsHeaders(headers: Constants.overrideHeaders)) // 添加跨域中间件
        .addHandler(service.handler); // 添加路由handler
    final HttpServer server = await serve(handler, DevConfig.serverUrl, DevConfig.serverPort); // 启动服务器
    server.autoCompress = true; // 启用压缩
    logging.Logger.root.info('服务器已启动，地址为 http://${server.address.host}:${server.port}'); // 日志提供启动时间
  } catch(error) {
    logging.Logger.root.info('服务器启动失败，请检查端口是否被占用或数据库连接\n报错信息为：$error'); // 报错打日志
    exit(0);
  }

}
