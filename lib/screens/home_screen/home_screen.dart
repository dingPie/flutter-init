import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_init/apis/dio.dart';
import 'package:flutter_init/config/build_context_extension.dart';
import 'package:flutter_init/constants/routes.dart';

import 'package:flutter_init/models/person/person.dart';
import 'package:flutter_init/models/none_freeze_person.dart';

import 'package:flutter_init/providers/user.dart';
import 'package:flutter_init/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = context.read<AppTheme>().themeMode;
    var user = context.watch<User>();
    var dio = DioIn().dio;

    void toggleThemeMode() {
      // read는 변경사항을 수신하진 않지만 값을 반환한고 (set 가능)
      // watch는 변경값을 수신만 한다 ? -> 한번 더 확인 필요
      if (context.read<AppTheme>().themeMode == ThemeMode.dark) {
        context.read<AppTheme>().themeMode = ThemeMode.light;
      } else {
        context.read<AppTheme>().themeMode = ThemeMode.dark;
      }
    }

    void onPressedRouteButton(String path) {
      print('test $path');
      context.push(Uri(
        path: path,
        // P_MEMO: 두 값이 엄연히 다르다.
        // queryParameters: {
        //   'query-param-id': Random().nextInt(10).toString(),
        // },
      ).toString());
    }

    void onPressLogin() => user.login(uid: '11', accessToken: '222');

    void onPressLogout() => user.logout();

    void apiTest() async {
      try {
        var result = await dio.get('/today-test');
        print('결과 확인! ${result.toString()}');
      } catch (err) {
        print('ERROR: ${err.toString()}');
      }
    }

    void freezeTest() {
      Person person1 = Person(id: 1, name: 'Pie', age: 29);
      Person person2 = Person.fromJson({'id': 1, 'name': 'Pie', 'age': 29});
      NoneFreezePerson nfPerson1 =
          NoneFreezePerson(id: 1, name: 'Pie', age: 29);
      NoneFreezePerson nfPerson2 =
          NoneFreezePerson.fromJson({'id': 1, 'name': 'Pie', 'age': 29});

      print('person1: $person1');
      print('person2 string: ${person2.toString()}');
      print('person1 == person2: ${person1 == person2}');

      print('nfPerson1: $nfPerson1');
      print('nfPerson2 string: ${nfPerson2.toString()}');
      print('nfPerson1 == nfPerson2: ${nfPerson1 == nfPerson2}');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray[200],
        title: Text(
          ROUTES.home.name,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOME SCREEN',
              style: context.textStyle.h1
                  .copyWith(fontSize: 40, color: context.colors.primary),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => onPressedRouteButton(
                        '/detail/${Random().nextInt(10).toString()}',
                      ),
                      child: const Text('DETAIL'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      onPressed: () => onPressedRouteButton(ROUTES.my.path),
                      child: const Text('MY PAGE'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  // P_MEMO: 하위 컨테이너들이 width 100%라 여기서 조정이 안먹음
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: apiTest,
                          child: Text(
                            'API 호출 테스트',
                            style: context.textStyle.body1.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          onTap: freezeTest,
                          child: Text(
                            'Freeze 생성 테스트',
                            style: context.textStyle.body1.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onPressLogin,
                          child: Text(
                            '임시 로그인',
                            style: context.textStyle.body1.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          onTap: onPressLogout,
                          child: Text(
                            '로그아웃',
                            style: context.textStyle.body1.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleThemeMode,
        tooltip: 'toggle mode',
        child: Icon(
          themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }
}
