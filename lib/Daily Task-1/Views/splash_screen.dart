import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/todoController.dart';
import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo=Get.put(TodoController());
    Timer(Duration(seconds: 2), () {
      todo.getData();
      Get.to(HomePage());
    },);
    return Scaffold(
      appBar: AppBar(title: Text('SplashScreen'),),
      // AppBar(
      //   title: Text('HomePage'),
      //   actions: [
      //     IconButton(onPressed: () {
      //       todo.theme.value=!todo.theme.value;
      //       todo.setTheme(todo.theme.value);
      //     }, icon: Obx(() =>  Icon((todo.theme.value==true)?Icons.dark_mode:Icons.light_mode))),
      //     IconButton(onPressed: () {
      //       todo.status.value=!todo.status.value;
      //       todo.setStatus(todo.status.value);
      //     }, icon: Obx(() =>  Icon((todo.status.value==true)?Icons.list_alt:Icons.grid_on))),
      //   ],
      // ),
        // body:Obx(
        //       () {
        //     return (todo.status.value==false)?GridView.builder(itemCount:todo.dataList.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), itemBuilder: (context, index) =>
        //         Card(
        //           child: ListTile(
        //             leading: Text(todo.dataList[index].id.toString()),
        //             title: Text(todo.dataList[index].title.toString()),
        //             subtitle: Container(color:todo.dataList[index].completed==true?Colors.green:Colors.red,child: Text(todo.dataList[index].completed.toString())),
        //             trailing: Text(todo.dataList[index].userId.toString()),
        //           ),
        //         ),):
        //     ListView.builder(itemCount:todo.dataList.length,itemBuilder: (context, index) =>
        //         Card(
        //           child: ListTile(
        //             leading: Text(todo.dataList[index].id.toString()),
        //             title: Text(todo.dataList[index].title.toString()),
        //             subtitle: Container(color:todo.dataList[index].completed==true?Colors.green:Colors.red,child: Text(todo.dataList[index].completed.toString())),
        //             trailing: Text(todo.dataList[index].userId.toString()),
        //           ),
        //         ),);
        //   },
        // )
    );
  }
}
