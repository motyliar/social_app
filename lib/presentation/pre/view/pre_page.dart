import 'package:climbapp/core/constans/app_localization_list.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/business/cubit/localization/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String _polishLanguageSign = 'PL';
const String _englishLanguageSign = 'EN';

class PrePage extends StatelessWidget {
  const PrePage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routePrePage),
      builder: (_) => const PrePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, routeSignInPage),
                        child: Text(
                            AppLocalizations.of(context).skip.toUpperCase())),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: NetworkURLStorage().getImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Positioned(
                            top: 50,
                            left: 30,
                            child: Text(PrePageLabelList()
                                .listBuilder(context)[index])),
                        Positioned(
                            top: 70,
                            left: 30,
                            child: Text(PrePageContentList()
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
          ],
        ),
      )),
    );
  }
}

class firstPage extends StatelessWidget {
  const firstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
