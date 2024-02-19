import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business/enum.dart';

const double _spaceFromAppBar = 30;
const double _generalPagePadding = 20;

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeUserPage),
      builder: (_) => const UserPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Center(
            child: Column(
              children: [
                ContainerTemplate(
                  margin: const EdgeInsets.only(
                      left: _generalPagePadding, right: _generalPagePadding),
                  padding: EdgeInsets.only(
                    bottom: _generalPagePadding,
                  ),
                  borderRadius: kMinBorderRadius,
                  color: ColorPallete.whiteOpacity80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      MidTextButton(
                          buttonWidth: 300, textLabel: 'Edit Profile'),
                    ],
                  ),
                ),
                GradientDivider(
                  dividerHeight: 15,
                ),
                ContainerTemplate(
                  margin: const EdgeInsets.only(
                      left: _generalPagePadding, right: _generalPagePadding),
                  padding: const EdgeInsets.all(_generalPagePadding),
                  borderRadius: kMinBorderRadius,
                  width: MediaQuery.of(context).size.width,
                  color: ColorPallete.whiteOpacity80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General Information',
                        style: AppTextStyle.headersSmall,
                      ),
                      Divider(),
                      InformationRowWidget(
                        icon: Icons.person,
                        title: 'Name: ',
                        details: state.user.userName,
                      ),
                      InformationRowWidget(
                          icon: Icons.email,
                          title: 'Email: ',
                          details: state.user.userEmail),
                      InformationRowWidget(
                          icon: Icons.calendar_month,
                          title: 'Age: ',
                          details: state.user.details?.age == null
                              ? ' not specified'
                              : state.user.details!.age.toString()),
                      InformationRowWidget(
                          icon: Icons.location_city,
                          title: 'From: ',
                          details: 'Poznan'),
                      InformationRowWidget(
                          icon: Icons.military_tech,
                          iconColor: ColorPallete.gold,
                          title: 'Rank : ',
                          details: '4.8')
                    ],
                  ),
                ),
                GradientDivider(
                  dividerHeight: 15,
                ),
                ContainerTemplate(
                  width: MediaQuery.of(context).size.width,
                  borderRadius: kMinBorderRadius,
                )
              ],
            ),
          );
        } else {
          return Text('error');
        }
      },
    );
  }
}

class InformationRowWidget extends StatelessWidget {
  const InformationRowWidget({
    required this.icon,
    required this.title,
    required this.details,
    this.iconColor = ColorPallete.mainDecorationColor,
    super.key,
  });
  final IconData icon;
  final String title;
  final String details;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Text(title),
          Text(
            details,
            style: AppTextStyle.descriptionMid,
          ),
        ],
      ),
    );
  }
}



// child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.settings);
//                             },
//                             child: Text('ACCOUNT SETTINGS')),
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.info);
//                             },
//                             child: Text('INFO')),
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.sport);
//                             },
//                             child: Text('MY SPORTS')),
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.notice);
//                             },
//                             child: Text('MY NOTICE')),
