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

  DependencyInjector({
    super.key,
    required super.child,
  })  : apiService = ApiService(),
        userRepository = UserRepositoryImpl(apiService: ApiService()),
        postRepository = PostRepositoryImpl(apiService: ApiService());

  static DependencyInjector of(BuildContext context) {
    final DependencyInjector? result =
        context.dependOnInheritedWidgetOfExactType<DependencyInjector>();
    assert(result != null, 'No DependencyInjector found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DependencyInjector oldWidget) => false;
}
