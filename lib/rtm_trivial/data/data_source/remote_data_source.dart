import 'package:dio/dio.dart';
import 'package:rtm/rtm_trivial/data/models/loginmodel.dart';
import 'package:rtm/url/baseurl.dart';

abstract class RemoteDataSource {
  Future<Loginmodel> getFetch();

  Future<Loginmodel> getPost(String name, String password);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<Loginmodel> getFetch() async {
    try {
      var result = await dio.get(Constants.baseUrl);
      return Loginmodel.fromJson(result.data);
    } catch (error) {
      print("Error: $error");
      throw Exception("Failed to load posts");
    }
  }

  @override
  Future<Loginmodel> getPost(String name, String password) async {
    print("ishlayapdi");
    dio.options.baseUrl = Constants.baseUrl;
    dio.options.headers.addAll({
      "Accept": "application/json",
    });

    var data = FormData.fromMap({
      'username': name,
      'password': password,
    });

    print(dio.options.baseUrl);
    try {
      var response = await dio.post("auth/token", data: data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data != null && response.data is Map<String, dynamic>) {
          return Loginmodel.fromJson(response.data);
        } else {
          throw Exception("Invalid response format");
        }
      } else {
        print(response.data);
        throw Exception("Failed to load posts");
      }
    } catch (error) {
      print("Error: $error");
      throw Exception("Failed to load posts");
    }
  }
}
