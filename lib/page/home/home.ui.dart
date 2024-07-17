import 'package:comment_app/models/comment.model.dart';
import 'package:comment_app/services/auth.service.dart';
import 'package:comment_app/services/comment.service.dart';
import 'package:comment_app/widgets/comment_box.widget.dart';
import 'package:flutter/material.dart';

import 'package:comment_app/constants/colors.const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Comment>> futureComments;

  @override
  void initState() {
    super.initState();
    futureComments = CommentService().fetchComments();
  }

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
        actions: [
          IconButton(
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacementNamed(context, '/login');
              debugPrint('Logged out');
            },
            icon: const Icon(Icons.logout),
            color: AppColors.white,
          ),
        ],
      ),
      body: FutureBuilder<List<Comment>>(
        future: futureComments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data?.isEmpty == true) {
            return const Center(child: Text('No comments found'));
          } else {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final comment = snapshot.data![index];
                      return CommentBox(
                        initial: comment.name[0].toUpperCase(),
                        name: comment.name,
                        email: comment.email,
                        comment: comment.body,
                      );
                    },
                    childCount: snapshot.data?.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
