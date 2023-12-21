import 'package:climbapp/core/services/user_container.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business/bloc/friends_action_bloc.dart';
import 'package:flutter/material.dart';

class SureAlert extends StatelessWidget {
  final String user;
  final String friend;
  const SureAlert({required this.friend, required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userLocator<FriendsActionBloc>(),
      child: AlertDialog(
        title: const Text('Are you sure'),
        content: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
            BlocBuilder<FriendsActionBloc, FriendsActionState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 1), () async {
                        context.read<FriendsActionBloc>().add(
                            DeleteFriendFromListEvent(
                                params: GetFriendsParams(
                                    userId: user, friendId: friend)));
                        await Future.delayed(
                            Duration(seconds: 1), () => Navigator.pop(context));
                      });
                    },
                    icon: const Icon(Icons.done));
              },
            )
          ],
        ),
      ),
    );
  }
}
