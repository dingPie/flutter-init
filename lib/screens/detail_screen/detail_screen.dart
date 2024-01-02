import 'package:flutter/material.dart';
import 'package:flutter_init/config/build_context_extension.dart';
import 'package:flutter_init/constants/routes.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    this.goRouterState,
  });

  final GoRouterState? goRouterState;

  @override
  Widget build(BuildContext context) {
    var id = goRouterState?.pathParameters['id'];

    void onPressedBackButton() => context.pop();

    // goRouterState?.pathParameters -> dynamic route로 지정한 path 내애서 동적인 인자.
    // goRouterState?.uri.queryParameters -> query parameter로 넘긴 값

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray[200],
        title: Text(
          ROUTES.detail.name,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '동적 라우팅 디테일 페이지',
              style: context.textStyle.h1.copyWith(
                color: context.colors.primary,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '현재 페이지 아이디: $id',
              style: context.textStyle.body1,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: onPressedBackButton,
              child: const Text('뒤로가기'),
            )
          ],
        ),
      ),
    );
  }
}
