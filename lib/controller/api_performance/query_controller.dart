/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: query_controller.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

part of api;

class Query {

  /// 搜索请求
  Future<Response> search(Request request) async {
    final String data = await request.readAsString();
    if(data.isEmpty){
      return Utils.responseJson(request, code: Constants.httpUnCorrect, msg: '请求为空');
    }
    final Backend backend = Backend.fromJson(data);
    final dynamic db = await DataBaseController().selectData('test', backend.query());
    if(db == null){
      return Utils.responseJson(request, code: Constants.httpSuccess, msg: '未查到相关信息');
    }else{
      final Map<String, dynamic> responseData = {};
      db.forEach((String key, String value) {
        if(key == 'telecom'){
          value = jsonDecode(value);
        }
        responseData[key] = value;
      });
      return Utils.responseJson(request, code: Constants.httpSuccess, msg: '查询成功', extraData: { 'data': responseData } );
    }
  }

}