import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_task/view/mainHome.dart';
import 'package:itargs_task/constant/them.dart';

import 'translation/codegen_loader.g.dart';
import 'viewModel/MoreViewModel/more_cubit.dart';
import 'viewModel/moreViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale("en"), Locale("ar")],
    path: "assets/translation/",
    fallbackLocale: const Locale("en"),
    assetLoader: const CodegenLoader(),
    child: BlocProvider(
      create: (context) => MoreCubit(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

bool selectedMode=false;
  @override
  Widget build(BuildContext context) {
    MoreCubit moreCubit = BlocProvider.of(context);

    return BlocBuilder<MoreCubit, MoreState>(
      builder: (context, state) {
        if(state is ChangeThemeState){
          selectedMode=state.selected;}
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: LightTheme.lightTheme,
          darkTheme: DarkTheme.darkTheme,
          themeMode:selectedMode? ThemeMode.dark : ThemeMode.light,
          home: MainHome(),
        );
      },
    );
  }
}
