import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../presentation/main_scaffold.dart';
import '../../features/receipt/presentation/pages/receipt_list_page.dart';
import '../../features/receipt/presentation/pages/receipt_detail_page.dart';
import '../../features/receipt/presentation/pages/add_receipt_page.dart';
import '../../features/receipt/presentation/pages/camera_page.dart';
import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/privacy_policy_page.dart';
import '../../features/settings/presentation/pages/terms_of_service_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainScaffold(
          currentIndex: 0,
          child: ReceiptListPage(),
        ),
      ),
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const MainScaffold(
          currentIndex: 1,
          child: AnalyticsPage(),
        ),
      ),
      GoRoute(
        path: '/camera',
        name: 'camera',
        builder: (context, state) => const CameraPage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const MainScaffold(
          currentIndex: 3,
          child: SettingsPage(),
        ),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const MainScaffold(
          currentIndex: 4,
          child: ProfilePage(),
        ),
      ),
      GoRoute(
        path: '/add-receipt',
        name: 'add-receipt',
        builder: (context, state) {
          final imagePath = state.extra as String?;
          return AddReceiptPage(imagePath: imagePath);
        },
      ),
      GoRoute(
        path: '/receipt/:id',
        name: 'receipt-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ReceiptDetailPage(receiptId: id);
        },
      ),
      GoRoute(
        path: '/privacy-policy',
        name: 'privacy-policy',
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: '/terms-of-service',
        name: 'terms-of-service',
        builder: (context, state) => const TermsOfServicePage(),
      ),
    ],
  );
});
