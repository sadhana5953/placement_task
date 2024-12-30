import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/todoController.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   final todo=Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff512da6),
        centerTitle: true,
        title:  Text('All Todo List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
        actions: [
          IconButton(onPressed: () {
            todo.theme.value=!todo.theme.value;
            todo.setTheme(todo.theme.value);
          }, icon: Obx(() =>  Icon((todo.theme.value==true)?Icons.dark_mode:Icons.light_mode))),
          IconButton(onPressed: () {
            todo.status.value=!todo.status.value;
            todo.setStatus(todo.status.value);
          }, icon: Obx(() =>  Icon((todo.status.value==true)?Icons.list_alt:Icons.grid_on))),
        ],
      ),
      body:Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.indigo,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xff8e77c8),
              borderRadius: BorderRadius.circular(20),
            ),
            child:Obx(
                  () {
                return (todo.status.value==false)?GridView.builder(itemCount:todo.dataList.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), itemBuilder: (context, index) =>
                    Card(
                      child: ListTile(
                        leading: Text(todo.dataList[index].id.toString()),
                        title: Text(todo.dataList[index].title.toString()),
                        subtitle: Container(color:todo.dataList[index].completed==true?Colors.green:Colors.red,child: Text(todo.dataList[index].completed.toString())),
                        trailing: Text(todo.dataList[index].userId.toString()),
                      ),
                    ),):
                ListView.builder(itemCount:todo.dataList.length,itemBuilder: (context, index) =>
                    Column(
                      children: [
                        ListTile(
                          leading: Text(todo.dataList[index].id.toString(),style: TextStyle(color: Colors.white,fontSize: 15),),
                          title: Text(todo.dataList[index].title.toString(),style: TextStyle(color: Colors.white,fontSize: 17),),
                          subtitle: Text('UserId:${todo.dataList[index].userId}',style: TextStyle(color: Colors.white,fontSize: 15),),
                          trailing: Checkbox(value: todo.dataList[index].completed, onChanged: (value) {},activeColor: Colors.green),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.white,
                        )
                      ],
                    ),);
              },
            )
          ).marginOnly(top: 0),
        ],
      )
    );
  }
}
