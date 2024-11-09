import 'package:hive/hive.dart';
part'data_modelss.g.dart';

@HiveType(typeId: 1)
class Asset {
  @HiveField(0)
  String name;
   @HiveField(1)
  String description;

  Asset({required this.name, required this.description});
}