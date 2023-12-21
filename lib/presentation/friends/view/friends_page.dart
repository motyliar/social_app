import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/user_container.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/friends/widgets/sure_alert.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeFriendsPage),
      builder: (_) => const FriendsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    print('this $user');
    return BlocProvider(
      create: (context) => userLocator<FriendsActionBloc>()
        ..add(FetchFriendsListEvent(params: GetFriendsParams(userId: user.id))),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(user.userName.capitalize()),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.reply))
                  ],
                ),
                BlocConsumer<FriendsActionBloc, FriendsActionState>(
                  listener: (context, state) {
                    if (state is FriendChangeSuccess) {
                      context.read().add(FetchFriendsListEvent(
                          params: GetFriendsParams(userId: user.id)));
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<FriendsActionBloc, FriendsActionState>(
                        builder: (context, state) {
                      print(state.friends.length);
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height:
                            _heightCalculate(itemsCount: state.friends.length),
                        child: ListView.builder(
                            itemCount: state.friends.length,
                            itemBuilder: ((context, index) => Card(
                                    child: ListTile(
                                  leading: Image.network(
                                    state.friends[index].profileAvatar,
                                    width: 60,
                                    height: 60,
                                  ),
                                  title: Text(state.friends[index].userName),
                                  subtitle: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            print(
                                                'state length: ${state.friends.length}');
                                          },
                                          icon: const Icon(Icons.refresh)),
                                      IconButton(
                                          onPressed: () async {
                                            context
                                                .read<FriendsActionBloc>()
                                                .add(DeleteFriendFromListEvent(
                                                    params: GetFriendsParams(
                                                        userId: user.id,
                                                        friendId: state
                                                            .friends[index]
                                                            .id)));
                                            await Future.delayed(
                                                Duration(seconds: 1), () {
                                              print('teraz się to wykonuje');
                                              context
                                                  .read<FriendsActionBloc>()
                                                  .add(FetchFriendsListEvent(
                                                      params: GetFriendsParams(
                                                    userId: user.id,
                                                  )));
                                            });
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                  ),
                                )))),
                      );
                    });
                  },
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

double _heightCalculate({required int itemsCount}) {
  return (itemsCount * 100).toDouble();
}
