import 'package:comment_app/widgets/comment_box.widget.dart';
import 'package:flutter/material.dart';

import 'package:comment_app/constants/colors.const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.primaryBlue,
          title: Text(
            'Comments',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  return const CommentBox(
                    initial: 'A',
                    name: 'Maruf',
                    email: 'maruf@pingolearn.com',
                    comment:
                        'Hello there what a wonderful day. Lorum impusdaskj',
                  );
                },
              ),
            ),
          ],
        ));
  }
}
