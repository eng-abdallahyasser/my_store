import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:my_store/core/constants.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Repo.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16, color: MyColors.gray),
        ),
      ),
      initialRoute: MyRoutes.splashScreen,
      // getPages: getPages,
      routes: routes,
    );
  }
}
void uploadProducts() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  for (var product in Repo.testProducts) {
    await firestore.collection("products").doc(product["id"]).set(product);
  }

  log("✅ Products uploaded successfully!");

  }
