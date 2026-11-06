// ========================================================
// [LATIHAN 1.b] INTERFACE POST REPOSITORY
// ========================================================
import 'package:rpl_keamanan2/models/post.dart';

abstract class PostRepository {
  /// Mengambil daftar semua postingan dari API.
  Future<List<Post>> getPosts();
}
