/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: config.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

class DevConfig {
  static const String redisUrl = '127.0.0.1';

  static const int redisPort = 6379;

  static const int redisUpdateDuration = 1;

  static const int redisFlushDuration = 7;

  static const String mongoDbUrl = '127.0.0.1';

  static const int mongoDbPort = 27017;

  static const String logUrl = 'bin/log';

  static const String serverUrl = '0.0.0.0';

  static const int serverPort = 8080;

  static const bool hotReloaded = true;
}
