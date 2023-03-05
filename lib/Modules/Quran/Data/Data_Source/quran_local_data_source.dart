import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../App/Exceptions/exceptions.dart';
import '../../../../App/Utils/cached_preference.dart';
import '../Models/sora_model.dart';

abstract class QuranLocalDataSource {
  Future<List<SoraModel>> getCachedIndex();
  Future<Unit> cacheIndex(List<SoraModel> souarList);
}

class QuranLocalDataSourceImpl implements QuranLocalDataSource {
  final SharedPreferences sharedPreferences;

  QuranLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheIndex(List<SoraModel> souarList) {
    List souarListToJson =
        souarList.map<Map<String, dynamic>>((sora) => sora.toMap()).toList();
    sharedPreferences.setString(
      CachedPreference.cashedIndex,
      json.encode(souarListToJson),
    );
    return Future.value(unit);
  }

  @override
  Future<List<SoraModel>> getCachedIndex() {
    final jsonString = sharedPreferences.getString(
      CachedPreference.cashedIndex,
    );
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<SoraModel> jsonToSoraModel = decodeJsonData
          .map<SoraModel>((jsonSora) => SoraModel.fromMap(jsonSora))
          .toList();
      return Future.value(jsonToSoraModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
