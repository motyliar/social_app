import 'package:climbapp/core/constans/app_localization_list.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/business/cubit/localization/locale_cubit.dart';
import 'package:climbapp/presentation/on_board/business/dot_state/dot_state_cubit.dart';
import 'package:climbapp/presentation/on_board/business/firstOpen/first_open_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String _polishLanguageSign = 'PL';
const String _englishLanguageSign = 'EN';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeOnBoard),
      builder: (_) => const OnBoard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DotStateCubit.instance(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<LocaleCubit, String>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context.read<LocaleCubit>().polishLanguage();
                                },
                                child: const Text(_polishLanguageSign)),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  context.read<LocaleCubit>().englishLanguage();
                                },
                                child: const Text(_englishLanguageSign)),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.04,
                        top: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: BlocBuilder<FirstOpenCubit, FirstOpenState>(
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, routeSignInPage);
                                context.read<FirstOpenCubit>().changeOpenStatus(
                                    const OnBoardParam(wasOpened: true));
                              },
                              child: Text(AppLocalizations.of(context)
                                  .skip
                                  .toUpperCase()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 120,
                child: PageView.builder(
                    onPageChanged: (value) {
                      DotStateCubit.instance().changeDotValue(value);
                      print(DotStateCubit.instance().state);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: NetworkURLStorage().getImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned(
                              top: 50,
                              left: 30,
                              child: Text(OnBoardLabelList()
                                  .listBuilder(context)[index])),
                          Positioned(
                              top: 70,
                              left: 30,
                              child: Text(OnBoardContentList()
                                  .listBuilder(context)[index])),
                          Positioned(
                            top: 20,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 160,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          NetworkURLStorage().getImages[index]),
                                      fit: BoxFit.fitWidth)),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    3,
                                    (dotIndex) => GestureDetector(
                                          onTap: () {
                                            index = dotIndex;
                                            print(MediaQuery.of(context)
                                                .size
                                                .width);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(3),
                                            width: index == dotIndex ? 30 : 20,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: index == dotIndex
                                                    ? const Color.fromARGB(
                                                        255, 221, 45, 32)
                                                    : Colors.black),
                                          ),
                                        )),
                              ))
                        ],
                      );
                    }),
              ),
              BlocBuilder<DotStateCubit, int>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (indexDot) => Container(
                            margin: const EdgeInsets.all(5),
                            width: 10,
                            height: 20,
                            color: state == indexDot
                                ? Colors.yellow
                                : Colors.teal)),
                  );
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
