/*
 * Copyright (c) 2021
 * @ProjectName: app-performance-server
 * @FileName: db.dart
 * @Author: wayne
 * @LastModify:
 * @LastModified: 2021/12/15 上午11:43
 */

import 'package:app_performance_server/config/config.dart';
import 'package:logging/logging.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DataBaseController{

  // 数据连接单例
  factory DataBaseController() => _controller;
  DataBaseController._internal(){
    init();
  }
  static final DataBaseController _controller = DataBaseController._internal();
  late Db db;
  late DbCollection collection;

  // 数据库初始化
  void init() {
    db = Db('mongodb://${DevConfig.mongoDbUrl}:${DevConfig.mongoDbPort}/data');
  }

  // 连接数据库
  Future<void> connectDB() async {
    try{
      await db.open(); // 连接数据库
    }catch(error){
      throw Exception(error);
    }
  }

  // 断连数据库
  Future<bool> disconnectDB() async {
    try{
      await db.close(); // 数据库断开
      return true;
    }catch(error){
      Logger.root.warning(error); // 报错打日志
      return false;
    }
  }

  // 判断数据库连接状态，断开重连
  Future<bool> isConnect() async{
    if(db.state != State.OPEN){
      try{
        await connectDB();
        return true;
      }catch(error){
        Logger.root.info(error);
        return false;
      }
    }else{
      return true;
    }
  }

  // 查询数据库数据，返回单个结果
  Future<dynamic> selectData( String collect, Map<String,dynamic> query ) async {
    if( await isConnect() ){
      collection = db.collection(collect);
      try{
        return await collection.findOne(query);
      }catch(error){
        Logger.root.warning(error); // 报错打日志
        return null;
      }
    }
  }

  // 查询数据库，返回结果列表
  Future<dynamic> selectDataList( String collect, Map<String,dynamic> query) async {
    if( await isConnect() ){
      collection = db.collection(collect);
      try{
        return await collection.find(query).toList();
      }catch(error){
        Logger.root.warning(error); //
      }
    }
  }

  // 数据插入数据库，数据一条
  Future<bool> insertData( String collect, Map<String, dynamic> insert) async {
    if( await isConnect() ){
      try{
        collection = db.collection(collect);
        final WriteResult query = await collection.insertOne(insert);
        if(query.isSuccess){
          return true;
        }else{
          Logger.root.warning(query.errmsg); // 插入失败报错信息
          return false;
        }
      }catch(error){
        Logger.root.warning(error);
        return false;
      }
    }else{
      return false;
    }
  }

  // 数据插入数据库，数据多条
  Future<bool> insertDataList( String collect, List<Map<String,dynamic>> insertList ) async{
   if( await isConnect() ){
     try{
       collection = db.collection(collect);
       final BulkWriteResult query = await collection.insertMany(insertList);
       if(query.isSuccess){
         return true;
       }else{
         Logger.root.warning(query.errmsg); // 插入失败报错信息
         return false;
       }
     }catch(error){
       Logger.root.warning(error);
       return false;
      }
    }else{
     return false;
    }
  }

  // 删除数据库数据
  Future<bool> deleteData( String collect, Map<String,dynamic> delete) async {
    if( await isConnect() ){
      try{
        collection = db.collection(collect);
        final WriteResult query = await collection.deleteOne(delete);
        if(query.isSuccess){
          return true;
        }else{
          Logger.root.warning(query.errmsg); // 插入失败报错信息
          return false;
        }
      }catch(error){
        Logger.root.warning(error);
        return false;
      }
    }else{
      return false;
    }
  }

  // 更新数据
  Future<bool> updateData( String collect, Map<String,dynamic> search, Map<String,dynamic> update ) async{
    if(await isConnect()){
      try{
        collection = db.collection(collect);
        await collection.update(search,modify.set(update.keys.toString(), update.values.toString()));
        return true;
      }catch(e){
        Logger.root.info(e);
        return false;
      }
    }else{
      return false;
    }
  }


}