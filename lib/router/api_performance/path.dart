/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: path.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 下午1:43
 */

import 'package:app_performance_server/controller/api_performance/api_performance_package.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiPerformancePath {

  Router get router {

    /// 路由
    final Router router = Router();

    /// 路由表
    router.get('/query', (Request request) => Query().search(request) ); // 搜索请求

    router.all('/<ignored|.*>', (Request request) => Response.notFound('Page not found'));// 无关请求

    return router;

  }

}