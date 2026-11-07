// ========================================================
// [LATIHAN 2.a] DEPENDENCY INJECTOR MENGGUNAKAN INHERITEDWIDGET
// ========================================================
import 'package:flutter/material.dart';
import 'package:rpl_keamanan2/services/api_service.dart';
import 'package:rpl_keamanan2/repositories/user_repository.dart';
import 'package:rpl_keamanan2/repositories/user_repository_impl.dart';
import 'package:rpl_keamanan2/repositories/post_repository.dart';
import 'package:rpl_keamanan2/repositories/post_repository_impl.dart';

class DependencyInjector extends InheritedWidget {
  final ApiService apiService;
  final UserRepository userRepository;
  final PostRepository postRepository;

  //[PERBAIKAN ARSITEKTUR]: Membuat static factory method untuk membuat instance ApiService terlebih dahulu
  factory DependencyInjector({
    Key? key,
    required Widget child,
  }) {
    final sharedApiService = ApiService(); // ✅ Membuat 1 objek ApiService (Shared Resource)
    
    return DependencyInjector._internal(
      key: key,
      child: child,
      apiService: sharedApiService,
      userRepository: UserRepositoryImpl(apiService: sharedApiService), // ✅ Memakai objek yang sama
      postRepository: PostRepositoryImpl(apiService: sharedApiService), // ✅ Memakai objek yang sama
    );
  }

  // Konstruktor internal untuk menetapkan nilai ke variabel final
  const DependencyInjector._internal({
    super.key,
    required super.child,
    required this.apiService,
    required this.userRepository,
    required this.postRepository,
  });

  static DependencyInjector of(BuildContext context) {
    final DependencyInjector? result =
        context.dependOnInheritedWidgetOfExactType<DependencyInjector>();
    assert(result != null, 'No DependencyInjector found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DependencyInjector oldWidget) => false;
}
