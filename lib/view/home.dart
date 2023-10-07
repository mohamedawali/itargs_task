import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:itargs_task/translation/local_keys.g.dart';

import 'package:just_audio/just_audio.dart';

import '../viewModel/homeViewModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPlay = false;
  bool isDownload = false;

  HomeViewModel homeViewModel = HomeViewModel();
  AudioPlayer? audioPlayer = AudioPlayer();
  @override
  void initState() {
    getAudio(audioPlayer);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('This is App'),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 15, right: 15),
                child: Text(LocaleKeys.topLikes.tr(),
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
            const SliverToBoxAdapter(
                child: Divider(
              thickness: .9,
              color: CupertinoColors.systemGrey4,
            )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = homeViewModel.items[index];
                  return Column(
                    children: [
                      CupertinoListTile(
                        title: Text(item.title),
                        trailing: CupertinoButton(
                          child: item.isLiked
                              ? const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: CupertinoColors.systemRed,
                                )
                              : const Icon(
                                  CupertinoIcons.heart,
                                  color: CupertinoColors.systemRed,
                                ),
                          onPressed: () {
                            setState(() {
                              homeViewModel.toggleLike(index);
                            });
                          },
                        ),
                      ),
                      const Divider(
                        thickness: .9,
                        color: CupertinoColors.systemGrey4,
                      )
                    ],
                  );
                },
                childCount: homeViewModel.items.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 15, right: 15),
                child: Text(LocaleKeys.topLikes.tr(),
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
            const SliverToBoxAdapter(
                child: Divider(
              thickness: .9,
              color: CupertinoColors.systemGrey4,
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Row(
                children: [
                  isDownload
                      ? const CircularProgressIndicator()
                      : CupertinoButton(
                          child: isPlay
                              ? SvgPicture.asset('assets/icon/pause.svg')
                              : SvgPicture.asset('assets/icon/play.svg'),
                          onPressed: () async {
                            bool isConnect =
                                await homeViewModel.checkInternet();

                            if (isConnect) {
                              var isExist =
                                  await homeViewModel.checkAudioFile();
                              if (isExist) {
                                setState(() {
                                  isPlay = !isPlay;
                                });
                                if (isPlay) {
                                  audioPlayer!.play();
                                } else {
                                  audioPlayer!.pause();
                                }
                              } else {
                                setState(() {
                                  isDownload = !isDownload;
                                });
                                await homeViewModel.downloadAudioFile(
                                    homeViewModel.audioUrl.toString());
                                setState(() {
                                  isDownload = !isDownload;
                                  isPlay = !isPlay;
                                });
                                audioPlayer!.play();
                              }
                            } else {
                              var isExist =
                                  await homeViewModel.checkAudioFile();

                              if (isExist) {
                                await audioPlayer!.setFilePath(
                                    homeViewModel.localFilePath.toString());
                                setState(() {
                                  isPlay = !isPlay;
                                });
                                if (isPlay) {
                                  audioPlayer!.play();
                                } else {
                                  audioPlayer!.pause();
                                }
                              }
                            }
                          },
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Play This',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            fontSize: 18,
                          ))
                ],
              ),
            )),
            const SliverToBoxAdapter(
                child: Divider(
              thickness: .9,
              color: CupertinoColors.systemGrey4,
            )),
          ],
        ),
      ),
    );
  }

  getAudio(AudioPlayer? audioPlayer) async {
    await homeViewModel.getAudio(audioPlayer);
  }
}
