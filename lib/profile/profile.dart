import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_test/main.dart';
import 'package:gorouter_test/profile/profile_cubit.dart';

class ProfileRouter extends StatelessWidget {
  const ProfileRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: appRouter.profileRouter.routerDelegate,
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: const ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ProfileCubit, int>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) => Center(
                child: Text('$state'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: context.read<ProfileCubit>().increment,
            ),
            TextButton(
              child: const Text('Go to friend'),
              onPressed: () {
                context.push('/profile/friend');
              },
            )
          ],
        ),
      ),
    );
  }
}
