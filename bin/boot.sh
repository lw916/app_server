#!/bin/bash
#
# Copyright (c) 2021
# @ProjectName: app-performance-server
# @FileName: boot.sh
# @Author: wayne
# @LastModify:
# @LastModified: 2021/12/15 上午11:43
#
dart pub get
dart pub upgrade
dart run /app/bin/server.dart