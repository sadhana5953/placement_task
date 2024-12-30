import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Daily Task-1/Controller/todoController.dart';
import 'Daily Task-1/Views/splash_screen.dart';

void main()
{
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todo=Get.put(TodoController());
    return Obx(
      () =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: todo.theme.value==true?ThemeMode.light:ThemeMode.dark,
      ),
    );
  }
}
