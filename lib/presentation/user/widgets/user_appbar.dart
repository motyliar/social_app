import 'package:climbapp/presentation/dashboard/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _appBarHeight = 100;
const double _iconsSpaceWidth = 200;
const double _iconSize = 40;

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar(
      {required this.size,
      required this.name,
      this.imageSrc =
          'https://i.pinimg.com/564x/05/4f/e7/054fe717b6a9fe3907cce07956e4e5d8.jpg',
      super.key});
  final double size;
  final String imageSrc;
  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      flexibleSpace: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: _appBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageSrc),
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: _iconsSpaceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.people,
                        color: Colors.white,
                        size: _iconSize,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.message,
                        color: Colors.white,
                        size: _iconSize,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.language,
                        color: Colors.white,
                        size: _iconSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(size, _appBarHeight);
}
