// ========================================================
// [LATIHAN 1.c] IMPLEMENTASI CONCRETE POST REPOSITORY
// ========================================================
import 'package:rpl_keamanan2/models/post.dart';
import 'package:rpl_keamanan2/services/api_service.dart';
import 'package:rpl_keamanan2/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService _apiService;

  PostRepositoryImpl({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<List<Post>> getPosts() async {
    return await _apiService.getPosts();
  }
}
