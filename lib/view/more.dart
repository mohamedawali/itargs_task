import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:itargs_task/translation/local_keys.g.dart';
import 'package:itargs_task/viewModel/MoreViewModel/more_cubit.dart';


class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool selectedMode=false ;
  bool isDark=false ;
  MoreCubit? moreCubit;

  @override
  void initState() {
    moreCubit = BlocProvider.of<MoreCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(LocaleKeys.more.tr()),
        ),
        child: SafeArea(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 15, right: 15),
                          child: Text(LocaleKeys.setting.tr(),
                              style: CupertinoTheme
                                  .of(context)
                                  .textTheme
                                  .textStyle
                                  .copyWith(fontSize: 20, fontWeight: FontWeight
                                  .w600)),
                        ),
                        Divider(
                          thickness: .2,
                          color: CupertinoColors.systemGrey4,
                        ),
                        CupertinoListTile(
                          title: Text(LocaleKeys.dMode.tr()),
                          trailing: BlocBuilder<MoreCubit, MoreState>(
  builder: (context, state) {
    if(state is ChangeThemeState){
    selectedMode=state.selected;}
    return ElevatedButton(
                            child: selectedMode
                                ? Icon(
                              Icons.toggle_on_outlined,
                              color:
                              CupertinoColors.systemIndigo.highContrastColor,
                              size: 40,
                            )
                                : Icon(
                              Icons.toggle_off_outlined,
                              color:
                              CupertinoColors.systemIndigo.highContrastColor,
                              size: 40,
                            ),
                            onPressed: () {
                              moreCubit!.changeTheme(selectedMode);
                            },
                          );
  },
),
                        ),
                        Divider(
                          thickness: .2,
                          color: CupertinoColors.systemGrey4,
                        ),
                        BlocBuilder<MoreCubit, MoreState>(
  builder: (context, state) {
    if(state is ChangeLanguageState){
      isDark=state.selected;}
    return CupertinoListTile(
                          title: Text(LocaleKeys.arLang.tr()),
                          trailing: CupertinoButton(
                            child: isDark
                                ? Icon(
                              Icons.toggle_on_outlined,
                              color:
                              CupertinoColors.systemIndigo.highContrastColor,
                              size: 40,
                            )
                                : Icon(
                              Icons.toggle_off_outlined,
                              color:
                              CupertinoColors.systemIndigo.highContrastColor,
                              size: 40,
                            ),
                            onPressed: () async {
                          moreCubit!.changeLanguage(isDark);
                              if (context.locale.languageCode == 'en') {
                                await context.setLocale(const Locale('ar'));
                              } else {
                                await context.setLocale(const Locale('en'));
                              }
                            },
                          ),
                        );
  },
),
                        const Divider(
                          thickness: .2,
                          color: CupertinoColors.systemGrey4,
                        )
                      ],
    )

                
              ),
            )
          //     CustomScrollView(
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: Padding(
          //         padding: const EdgeInsets.only(
          //             top: 20, bottom: 10, left: 15, right: 15),
          //         child: Text(LocaleKeys.setting.tr(),
          //             style: CupertinoTheme.of(context)
          //                 .textTheme
          //                 .textStyle
          //                 .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
          //       ),
          //     ),
          //     const SliverToBoxAdapter(
          //         child: Divider(
          //       thickness: .2,
          //       color: CupertinoColors.systemGrey4,
          //     )),
          //     SliverList(
          //         delegate: SliverChildListDelegate(
          //       [
          //         CupertinoListTile(
          //           title: Text(LocaleKeys.dMode.tr()),
          //           trailing: CupertinoButton(
          //             child: themeCubit!.selected
          //                 ? Icon(
          //                     Icons.toggle_on_outlined,
          //                     color: CupertinoColors
          //                         .systemIndigo.highContrastColor,
          //                     size: 40,
          //                   )
          //                 : Icon(
          //                     Icons.toggle_off_outlined,
          //                     color: CupertinoColors
          //                         .systemIndigo.highContrastColor,
          //                     size: 40,
          //                   ),
          //             onPressed: () {
          //               themeCubit!.changeTheme(themeCubit!.selected);
          //             },
          //           ),
          //         ),
          //         const Divider(
          //           thickness: .2,
          //           color: CupertinoColors.systemGrey4,
          //         ),
          //         CupertinoListTile(
          //           title: Text(LocaleKeys.arLang.tr()),
          //           trailing: CupertinoButton(
          //             child: selected
          //                 ? Icon(
          //                     Icons.toggle_on_outlined,
          //                     color: CupertinoColors.systemIndigo.highContrastColor,
          //                     size: 40,
          //                   )
          //                 : Icon(
          //                     Icons.toggle_off_outlined,
          //                     color: CupertinoColors.systemIndigo.highContrastColor,
          //                     size: 40,
          //                   ),
          //             onPressed: () async {
          //               setState(() {
          //                 selected = !selected;
          //               });
          //               if (context.locale.languageCode == 'en') {
          //                 await context.setLocale(const Locale('ar'));
          //               } else {
          //                 await context.setLocale(const Locale('en'));
          //               }
          //             },
          //           ),
          //         ),
          //         const Divider(
          //           thickness: .2,
          //           color: CupertinoColors.systemGrey4,
          //         )
          //       ],
          //     )),
          //   ],
          // )),
        ));
  }
}
