/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: router.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */
import 'package:app_performance_server/router/api_performance/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';


/// 静态网站资源请放置与static文件夹下
/// 本路由由Router类挂载

class Service{

  Handler get handler {

    /// 路由
    final Router router = Router();

    /// 路由表
    router.mount('/api',ApiPerformancePath().router); // 挂载子路由表

    router.mount('/', createStaticHandler('static', defaultDocument: 'index.html'));// 挂载静态网页

    router.all('/<ignored|.*>', (Request request) => Response.notFound('Page not found!'));// 无关请求

    return router;

  }

}

