enum ROUTES {
  home(
    path: '/',
    name: '홈페이지',
  ),
  detail(
    // P_MEMO: home의 하위페이지로 설계되어 있어 /detail 처럼 설정하면 버그가 발생한다.
    path: 'detail/:id',
    name: '상세 페이지',
  ),
  my(
    path: '/my',
    name: '마이 페이지',
  ),
  error(
    path: '/error',
    name: '404 ERROR !',
  );

  final String path; // route 경로
  final String name;

  const ROUTES({
    required this.name,
    required this.path,
  });
}
