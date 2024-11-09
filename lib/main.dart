import 'package:exam_hive/models/data_modelss.dart';
import 'package:exam_hive/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized;
 await Hive.initFlutter();

 Hive.registerAdapter(AssetAdapter());
  var box= await Hive.openBox<Asset>("sampleBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home:HomeScreen(),
      
    );
  }
}
