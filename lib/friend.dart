import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Friend extends StatelessWidget {
  const Friend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Friend'),
            TextButton(
              child: const Text('Go to another friend'),
              onPressed: () {
                context.push('/profile/friend');
              },
            ),
          ],
        ),
      ),
    );
  }
}
