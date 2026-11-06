// ========================================================
// [LATIHAN 1.d] SCREEN UI UNTUK MENAMPILKAN DAFTAR POST
// ========================================================
import 'package:flutter/material.dart';
import 'package:rpl_keamanan2/config/dependency_injector.dart';
import 'package:rpl_keamanan2/models/post.dart';
import 'package:rpl_keamanan2/repositories/post_repository.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late PostRepository _repository;
  List<Post> _posts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Mengambil repository via Dependency Injection (Latihan 2)
    _repository = DependencyInjector.of(context).postRepository;
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final posts = await _repository.getPosts();
      if (mounted) {
        setState(() {
          _posts = posts;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Postingan (Latihan 1)'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(post.body),
                        leading: CircleAvatar(child: Text('${post.id}')),
                      ),
                    );
                  },
                ),
    );
  }
}
