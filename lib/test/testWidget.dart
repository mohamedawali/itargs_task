import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itargs_task/translation/codegen_loader.g.dart';
import 'package:itargs_task/translation/local_keys.g.dart';
import 'package:itargs_task/view/mainHome.dart';
import 'package:itargs_task/view/more.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../view/home.dart';
import '../viewModel/themCubit/theme_cubit.dart';

void main() async {
  //
  // WidgetsFlutterBinding.ensureInitialized();
  //await EasyLocalization.ensureInitialized();
  group(' Pages Widget Tests', () {
    testWidgets('Test MainHome Page UI', (WidgetTester tester) async {
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale("en"), Locale("ar")],
          path: "assets/translation/",
          fallbackLocale: const Locale("en"),
          assetLoader: const CodegenLoader(),
          child: MaterialApp(
            home: MainHome(),
          ),
        ),
      );
      // Verify that the title "More" is present on the screen.

      expect(find.text(LocaleKeys.more.tr()), findsOneWidget);
      // Verify that the title "Home" is present on the screen.

      expect(find.text(LocaleKeys.home.tr()), findsOneWidget);
      // Verify that the  "purpleHome icon" is present on the screen.

      expect(find.byWidget(SvgPicture.asset('assets/icon/purpleHome.svg')),
          findsOneWidget);
      // Verify that the  "purpleMore icon" is present on the screen.
      expect(find.byWidget(SvgPicture.asset('assets/icon/purpleMore.svg')),
          findsOneWidget);
      // Verify that the  "blackHome icon" is present on the screen.
      expect(find.byWidget(SvgPicture.asset('assets/icon/blackHome.svg')),
          findsOneWidget);
      // Verify that the  "blackMore icon" is present on the screen.
      expect(find.byWidget(SvgPicture.asset('assets/icon/blackMore.svg')),
          findsOneWidget);
    });
    testWidgets('Test Home Page UI', (WidgetTester tester) async {
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale("en"), Locale("ar")],
          path: "assets/translation/",
          fallbackLocale: const Locale("en"),
          assetLoader: const CodegenLoader(),
          child: MaterialApp(
            home: Home(),
          ),
        ),
      );
// Verify that the title "Top Likes" is present on the screen.
      expect(find.text(LocaleKeys.topLikes.tr()), findsOneWidget);
// Verify that the title "Play This" is present on the screen.

      expect(find.text('Play This'), findsOneWidget);
      // Verify that the  "pause icon" is present on the screen.
      expect(find.byWidget(SvgPicture.asset('assets/icon/pause.svg')),
          findsOneWidget);
      // Verify that the  "play icon" is present on the screen.
      expect(find.byWidget(SvgPicture.asset('assets/icon/play.svg')),
          findsOneWidget);
      // Verify that the  "CircularProgressIndicator" is present on the screen.
      expect(find.byWidget(CircularProgressIndicator()), findsOneWidget);
    });
    testWidgets('Test More Page UI', (WidgetTester tester) async {
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale("en"), Locale("ar")],
          path: "assets/translation/",
          fallbackLocale: const Locale("en"),
          assetLoader: const CodegenLoader(),
          child: MaterialApp(
            home: BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
              child: More(),
            ),
          ),
        ),
      );

      // Verify that the title "Settings" is present on the screen.
      expect(find.text(LocaleKeys.setting.tr()), findsOneWidget);

      // Verify that the title"Dark Mode" tile is present on the screen.
      expect(find.text(LocaleKeys.dMode.tr()), findsOneWidget);

      // Verify that the title "Switch to Arabic"  is present on the screen.
      expect(find.text(LocaleKeys.arLang.tr()), findsOneWidget);
      // Verify that the "play icon"  on the screen.
      expect(find.byWidget(SvgPicture.asset('assets/icon/play.svg')),
          findsOneWidget);
      // Verify that the "toggle_off_outlined icon"  on the screen.
      expect(find.byIcon(Icons.toggle_off_outlined), findsOneWidget);
      // Verify that the "toggle_on_outlined icon"  on the screen.
      expect(find.byIcon(Icons.toggle_on_outlined), findsOneWidget);
    });
  });
}
