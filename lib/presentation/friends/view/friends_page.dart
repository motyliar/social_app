import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/friends/widgets/sure_alert.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _searchController = TextEditingController();

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
                        icon: const Icon(Icons.reply)),
                    SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _searchController,
                        )),
                    BlocBuilder<FriendsActionBloc, FriendsActionState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              context.read<FriendsActionBloc>().add(
                                  SearchForUsersEvent(
                                      userByName: _searchController.text));
                            },
                            icon: const Icon(Icons.search));
                      },
                    ),
                  ],
                ),
                Divider(),
                BlocBuilder<FriendsActionBloc, FriendsActionState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () => context
                                .read<FriendsActionBloc>()
                                .add(ChangeStateViewEvent()),
                            child: Text(
                              'My Friends',
                              style: TextStyle(
                                  color: state.isMyFriend
                                      ? Colors.red
                                      : Colors.grey),
                            )),
                        ElevatedButton(
                            onPressed: () => context
                                .read<FriendsActionBloc>()
                                .add(ChangeStateViewEvent()),
                            child: Text('Search ppl',
                                style: TextStyle(
                                    color: state.isMyFriend
                                        ? Colors.grey
                                        : Colors.red))),
                      ],
                    );
                  },
                ),
                BlocBuilder<FriendsActionBloc, FriendsActionState>(
                    builder: (context, blocstate) {
                  if (blocstate is FriendsActionInitial) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (blocstate is FriendsSearchingSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height:
                          _heightCalculate(itemsCount: blocstate.friend.length),
                      child: ListView.builder(
                          itemCount: blocstate.friend.length,
                          itemBuilder: ((context, index) => GestureDetector(
                                onTap: () => Navigator.popAndPushNamed(
                                    context, routeProfilePage,
                                    arguments: blocstate.friend[index]),
                                child: Card(
                                    child: ListTile(
                                  leading: Image.network(
                                    blocstate.friend[index].profileAvatar,
                                    width: 60,
                                    height: 60,
                                  ),
                                  title: Text(blocstate.friend[index].userName),
                                  subtitle: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            print(
                                                'blocstate length: ${blocstate.friend.length}');
                                          },
                                          icon: const Icon(Icons.refresh)),
                                      IconButton(
                                          onPressed: () async {
                                            print('to się wykonuje');
                                            context
                                                .read<FriendsActionBloc>()
                                                .add(AddFriendEvent(
                                                    params: GetFriendsParams(
                                                        userId: user.id,
                                                        friendId: blocstate
                                                            .friend[index]
                                                            .id)));
                                            print('druga funkcja');
                                            print("to jest: $blocstate");
                                            // await Future.delayed(
                                            //     Duration(seconds: 1), () {
                                            //   print('teraz się to wykonuje');

                                            //   BlocProvider.of<FriendsActionBloc>(
                                            //           context)
                                            //       .add(FetchFriendsListEvent(
                                            //           params: GetFriendsParams(
                                            //     userId: user.id,
                                            //   )));
                                            // });
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),
                                )),
                              ))),
                    );
                  }
                  if (blocstate is FriendsLoaded) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: _heightCalculate(
                          itemsCount: blocstate.friends.length),
                      child: ListView.builder(
                          itemCount: blocstate.friends.length,
                          itemBuilder: ((context, index) => Card(
                                  child: ListTile(
                                leading: Image.network(
                                  blocstate.friends[index].profileAvatar,
                                  width: 60,
                                  height: 60,
                                ),
                                title: Text(blocstate.friends[index].userName),
                                subtitle: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          print(
                                              'blocstate length: ${blocstate.friends.length}');
                                        },
                                        icon: const Icon(Icons.refresh)),
                                    IconButton(
                                        onPressed: () async {
                                          context.read<FriendsActionBloc>().add(
                                              DeleteFriendFromListEvent(
                                                  params: GetFriendsParams(
                                                      userId: user.id,
                                                      friendId: blocstate
                                                          .friends[index].id)));
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
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, routeMessagePage,
                                              arguments: MessageUserDetails(
                                                  senderName: user.userName,
                                                  senderId: user.id,
                                                  recipientName: blocstate
                                                      .friends[index].userName,
                                                  recipientId: blocstate
                                                      .friends[index].id));
                                        },
                                        icon: Icon(Icons.mail))
                                  ],
                                ),
                              )))),
                    );
                  } else {
                    return Text('null');
                  }
                })
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
