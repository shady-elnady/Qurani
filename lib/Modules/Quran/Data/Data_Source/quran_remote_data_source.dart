import 'package:http/http.dart' as http;

import '../../../../App/API/api_constance.dart';
import '../../../../App/API/error_message_model.dart';
import '../../../../App/Exceptions/exceptions.dart';
import '../../../../App/Models/body_model.dart';
import '../Models/sora_model.dart';

abstract class BaseQuranRemoteDataSource {
  // Get All Departments
  Future<List<SoraModel>> getIndex();
  // Get One Department
}

class QuranRemoteDataSource implements BaseQuranRemoteDataSource {
  final http.Client client;

  QuranRemoteDataSource({required this.client});

  // Get All Departments Implementation
  @override
  Future<List<SoraModel>> getIndex() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.sora,
      ),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<dynamic> results = body.results;

      List<SoraModel> souarIndex = results.map(
        (dynamic sora) {
          return SoraModel.fromMap(sora);
        },
      ).toList();

      return souarIndex;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }
}
