# 服务端

### 使用的软件：

- dart: 2.14.4
- shelf 网络框架
- mongodb数据库
- redis数据库
- Docker（可选）


### 软件端口：

- 服务端端口：8080
- mongoDB服务器端口：27017
- redis服务器端口：6379



### 项目配置信息的修改

配置文件路径：本项目文件路径/lib/config/env/dev_config.yaml

本段将介绍配置文件对应的配置信息，如无配置将使用服务端默认配置

```yaml
environment_config:
  path: 'config/config.dart'
  class: DevConfig

  fields:
    # redis连接路径
    redisUrl:
      const: true
      static: true
      type: String
      default: '127.0.0.1'

    # redis连接端口
    redisPort:
      const: true
      static: true
      type: int
      default: 6379

    # redis缓存更新周期
    redisUpdateDuration:
      const: true
      static: true
      type: int
      default: 1

    # redis缓存清空周期
    redisFlushDuration:
      const: true
      static: true
      type: int
      default: 7

    # 芒果数据库连接路径
    mongoDbUrl:
      const: true
      static: true
      type: String
      default: '127.0.0.1'

    # 芒果数据库连接端口
    mongoDbPort:
      const: true
      static: true
      type: int
      default: 27017

    # 日志路径
    logUrl:
      const: true
      static: true
      type: String
      default: 'bin/log'

    # 服务器启动地址
    serverUrl:
      const: true
      static: true
      type: String
      default: '0.0.0.0'

    # 服务器启动端口
    serverPort:
      const: true
      static: true
      type: int
      default: 8080

    # 是否启用热重载
    hotReloaded:
      const: true
      static: true
      type: bool
      default: true

# Config：以下为服务端需要的配置信息
# redisUrl:连接redis数据库的地址
# redisPort:连接redis数据库的端口
# mongoDbUrl：连接芒果数据库的地址
# mongoDbPort：连接芒果数据库的端口
# logUrl：存放日志文件地址（一般不修改）
# ServerUrl:服务端启动指定ip地址
# ServerPort:服务端启动指定端口(本项需要注意，若使用docker修改端口需要同时修改启动参数)
如需修改参数，请在各项下的default内容中修改对应的值
```

当修改过配置文件后，需要运行以下命令配置参数

```shell
若为开发环境配置修改：
pub run environment_config:generate --config=lib/config/env/dev_config.yaml

若为测试环境配置修改：
pub run environment_config:generate --config=lib/config/env/test_config.yaml

若为正式环境配置修改：
pub run environment_config:generate --config=lib/config/env/prod_config.yaml
```



### 项目部署流程

#### 你有两种方法运行该服务端

直接运行：

```shell
$ cd 该项目的地址下
$ dart run bin/main.dart
该服务端将在8080端口监听并使用
```



使用Docker部署本服务器:
如需安装Docker，请通过Docker官方网站下载安装程序[Docker](https://www.docker.com/)
如果您的电脑中安装有Docker，可以使用以下命令部署本服务器程序至Docker镜像中

```shell
$ cd 本项目文件夹下
$ docker build . -t dart_server
$ docker run -itd -p 8080:8080 -v (本项目所处的文件夹路径):/app --name dart_server dart_server

如果需要连接其他容器(如mongodb、redis)，请使用--link命令

本服务端将在8080端口监听并使用
```



### 版本信息

- V1.0.0 Initial Version



### 参与贡献

- Simon
- Wayne
