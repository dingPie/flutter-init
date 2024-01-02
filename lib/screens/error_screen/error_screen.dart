import 'package:flutter/material.dart';
import 'package:flutter_init/config/build_context_extension.dart';
import 'package:flutter_init/constants/routes.dart';

import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.goRouterState,
  });

  final GoRouterState? goRouterState;

  @override
  Widget build(BuildContext context) {
    void onPressedBackButton() => context.pop();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray[200],
        title: Text(
          ROUTES.error.name,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ERROR!',
              style: context.textStyle.h1.copyWith(
                color: context.colors.warning,
                fontSize: 40,
              ),
            ),
            Text(
              '잘못된 접근입니다.',
              style: context.textStyle.body1.copyWith(
                color: context.colors.warning,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: onPressedBackButton,
              child: const Text(
                '돌아가기',
              ),
            )
          ],
        ),
      ),
    );
  }
}
