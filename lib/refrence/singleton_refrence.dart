import 'package:get_storage/get_storage.dart';

class SingletonClass {
  late GetStorage getstorage;
  static SingletonClass? _instance;

  SingletonClass._internal() {
    getstorage = GetStorage();
  }

  factory SingletonClass() {
    return _instance ??= SingletonClass._internal();
  }
}
