import 'package:comment_app/helpers/mask_email.helper.dart';
import 'package:comment_app/models/comment.model.dart';
import 'package:comment_app/services/auth.service.dart';
import 'package:comment_app/services/comment.service.dart';
import 'package:comment_app/services/loading.dart';
import 'package:comment_app/services/remote_config.service.dart';
import 'package:comment_app/widgets/comment_box.widget.dart';
import 'package:comment_app/widgets/loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:comment_app/constants/colors.const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Comment>> futureComments;
  late Future<RemoteConfigService> _remoteConfigService;

  @override
  void initState() {
    super.initState();
    futureComments = CommentService().fetchComments();
    _remoteConfigService = initRemoteConfig();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primaryBlue,
        title: Text(
          'Comments',
          style: theme.textTheme.displayLarge?.copyWith(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await AuthService(LoadingState()).signOut();
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
            return FutureBuilder<RemoteConfigService>(
              future: _remoteConfigService,
              builder: (context, configSnapshot) {
                if (configSnapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                } else if (configSnapshot.hasError) {
                  return const Center(
                    child: Text('Error fetching remote config'),
                  );
                }

                final remoteConfigService = configSnapshot.data!;
                final maskEmailFlag = remoteConfigService.maskEmail;

                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final comment = snapshot.data![index];
                          return CommentBox(
                            initial: comment.name[0].toUpperCase(),
                            name: comment.name,
                            email: maskEmail(comment.email, maskEmailFlag),
                            comment: comment.body,
                          );
                        },
                        childCount: snapshot.data?.length,
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
