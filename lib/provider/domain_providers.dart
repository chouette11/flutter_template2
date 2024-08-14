import 'package:flutter_template/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_template/page/root/root_page.dart';

final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);

final uuidProvider = Provider((_) => const Uuid());

/// ページ遷移のプロバイダ
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        redirect: (BuildContext context, GoRouterState state) async {
          final bool launched =
              await ref.read(userRepositoryProvider).getIsLaunch();
          if (!launched) {
            ref.read(isTutorialProvider.notifier).update((state) => true);
            return '/tutorial';
          }
          return null;
        },
        builder: (context, state) => const RootPage(),
      ),
    ],
  ),
);

CustomTransitionPage _buildPageWithAnimation(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
    transitionDuration: const Duration(milliseconds: 0),
  );
}

final isTutorialProvider = StateProvider((ref) => false);