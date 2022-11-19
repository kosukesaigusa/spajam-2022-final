import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../pages/app_user_detail_page.dart';
import '../../pages/attending_chat_rooms_page.dart';
import '../../pages/chat_room_page.dart';
import '../../pages/create_memory_page.dart';
import '../../pages/main_page.dart';
import '../../pages/map_page.dart';
import 'app_route.dart';
import 'app_router_state.dart';

/// AppRoute インスタンスの一覧
/// 各ページのコンストラクタに引数を渡さない済むように、そのような場合は ProviderScope.override で
/// appRouterStateProvider の値をオーバーライドして、各画面を AppState をオーバーライドされた
/// Provider 経由で取得するようにする。
final appRoutes = <AppRoute>[
  AppRoute(
    path: MainPage.path,
    name: MainPage.name,
    builder: (context, state) => const MainPage(key: ValueKey(MainPage.name)),
  ),
  AppRoute(
    path: MapPage.path,
    name: MapPage.name,
    builder: (context, state) => const MapPage(key: ValueKey(MapPage.name)),
  ),
  AppRoute(
    path: CreateMemoryPage.path,
    name: CreateMemoryPage.name,
    builder: (context, state) => ProviderScope(
      overrides: <Override>[appRouterStateProvider.overrideWithValue(state)],
      child: const CreateMemoryPage(key: ValueKey(CreateMemoryPage.name)),
    ),
  ),
  AppRoute(
    path: AttendingChatRoomsPage.path,
    name: AttendingChatRoomsPage.name,
    builder: (context, state) => const AttendingChatRoomsPage(
      key: ValueKey(AttendingChatRoomsPage.name),
    ),
  ),
  AppRoute(
    path: ChatRoomPage.path,
    name: ChatRoomPage.name,
    builder: (context, state) => ProviderScope(
      overrides: <Override>[appRouterStateProvider.overrideWithValue(state)],
      child: const ChatRoomPage(key: ValueKey(ChatRoomPage.name)),
    ),
  ),
  AppRoute(
    path: AppUserDetailPage.path,
    name: AppUserDetailPage.name,
    builder: (context, state) => ProviderScope(
      overrides: <Override>[appRouterStateProvider.overrideWithValue(state)],
      child: const AppUserDetailPage(key: ValueKey(AppUserDetailPage.name)),
    ),
  ),
  AppRoute(
    path: AppUserDetailPage.path,
    name: AppUserDetailPage.name,
    builder: (context, state) => ProviderScope(
      overrides: <Override>[appRouterStateProvider.overrideWithValue(state)],
      child: const AppUserDetailPage(key: ValueKey(AppUserDetailPage.name)),
    ),
  ),
  // AppRoute(
  //   path: TodosPage.path,
  //   name: TodosPage.name,
  //   builder: (context, state) => const TodosPage(key: ValueKey(TodosPage.name)),
  // ),
  // AppRoute(
  //   path: GitHubReposPage.path,
  //   name: GitHubReposPage.name,
  //   builder: (context, state) => const GitHubReposPage(key: ValueKey(GitHubReposPage.name)),
  // ),
  // AppRoute(
  //   path: GitHubRepoDetailPage.path,
  //   name: GitHubRepoDetailPage.name,
  //   builder: (context, state) => ProviderScope(
  //     overrides: <Override>[appRouterStateProvider.overrideWithValue(state)],
  //     child: const GitHubRepoDetailPage(key: ValueKey(GitHubRepoDetailPage.name)),
  //   ),
  // ),
  // AppRoute(
  //   path: AboutPage.path,
  //   name: AboutPage.name,
  //   builder: (context, state) => const AboutPage(key: ValueKey(AboutPage.name)),
  // ),
  // AppRoute(
  //   path: NotFoundPage.path,
  //   name: NotFoundPage.name,
  //   builder: (context, state) => const NotFoundPage(key: ValueKey(NotFoundPage.name)),
  // ),
];
