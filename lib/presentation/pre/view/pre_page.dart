import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:flutter/material.dart';

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
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 50,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: NetworkURLStorage().getImages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    NetworkURLStorage().getImages[index]),
                                fit: BoxFit.fitWidth)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (dotIndex) => GestureDetector(
                                  onTap: () {
                                    index = dotIndex;
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    width: index == dotIndex ? 30 : 20,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: index == dotIndex
                                            ? const Color.fromARGB(
                                                255, 221, 45, 32)
                                            : Colors.black),
                                  ),
                                )),
                      )
                    ],
                  );
                }),
          ),
        ],
      )),
    );
  }
}
