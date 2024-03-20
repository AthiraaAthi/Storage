import 'package:hive_flutter/adapters.dart';
part 'my_model.g.dart';

@HiveType(typeId: 1)
class MyModel {
  @HiveField(1)
  String name;
  MyModel({required this.name});
}
