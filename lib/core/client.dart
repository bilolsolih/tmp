import 'dart:io';

import 'package:dio/dio.dart';
import 'package:recipe/core/interceptor.dart';
import 'package:recipe/data/models/create_review_model.dart';

import '../data/models/user_model.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.80:8888/api/v1',
        validateStatus: (status) => true,
      ),
    );

    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<T> genericGetRequest<T>(String path, {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(requestOptions: response.requestOptions, response: response);
    }
  }

  Future<T> genericPostRequest<T>(String path, Map<String, dynamic>? data) async {
    final response = await dio.post(path, data: data);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(requestOptions: response.requestOptions, response: response, error: response.statusMessage);
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    // return response.statusCode == 201 ? true : false;
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap(
      {"profilePhoto": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)},
    );

    var response = await dio.patch(
      '/auth/upload',
      data: formData,
      options: Options(
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createReview(CreateReviewModel model) async {
    final formData = FormData.fromMap(await model.toJson());
    final response = await dio.post('/reviews/create', data: formData);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchRecipesByCategory(int categoryId) async {
    var response = await dio.get('/recipes/list', queryParameters: {"Category": categoryId});
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/list?Category=$categoryId so'rovimiz o'xshamadi");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception("/recipes/detail/$recipeId so'rovimiz xato ketti");
    }
  }

  Future<dynamic> fetchTrendingRecipe() async {
    var response = await dio.get('/recipes/trending-recipe');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("/recipes/trending-recipe so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchYourRecipes({int? limit}) async {
    var response = await dio.get('/recipes/list?Order=title&Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/recipes/list?Limit=2 so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchCommunityRecipes({required String orderBy, required bool descending}) async {
    var response = await dio.get('/recipes/community/list?Order=$orderBy&Descending=$descending');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/community/list so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchTopChefsForHome({int? limit}) async {
    final response = await dio.get('/auth/top-chefs?Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/auth/top-chefs?Limit=${limit ?? ''} so'rovimiz xato ketti");
    }
  }

  Future<List<dynamic>> fetchRecentlyAddedRecipes({int? limit}) async {
    final response = await dio.get('/recipes/list?Order=date&Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/recipes/list?Order=date&Limit=${limit ?? ''} so'rovimiz xato ketti!");
    }
  }

  Future<Map<String, dynamic>> fetchRecipeForReviews(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("recipes/reviews/detail/$recipeId so'rovimiz xato ketti!");
    }
  }
}
