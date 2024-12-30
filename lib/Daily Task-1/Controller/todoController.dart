import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/todoHelper.dart';
import '../Model/todoModel.dart';

class TodoController extends GetxController
{
  TodoHelper todoHelper =TodoHelper();
  late TodoModel todoModel;

  RxList<TodoModel> dataList = <TodoModel> [].obs;
  RxBool status=true.obs;
  RxBool theme=true.obs;

  Future<List<TodoModel>> getData() async {
    print('=================method called=========');
    List data=await todoHelper.fetchData();
    dataList.value = data.map((e) => TodoModel.fromJson((e),),).toList();
    return dataList;
  }

  Future<void> setStatus(bool view)
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('repeat', view);
  }

  Future<void> getStatus()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    status.value = prefs.getBool('repeat')!;
  }

  Future<void> setTheme(bool view)
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', view);
  }

  Future<void> getTheme()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    theme.value = prefs.getBool('theme')!;
  }

  TodoController()
  {
    getData();
    getStatus();
    getTheme();
  }
}