import 'package:comment_app/constants/colors.const.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  final String initial;
  final String name;
  final String email;
  final String comment;
  const CommentBox({
    super.key,
    required this.initial,
    required this.name,
    required this.email,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.darkGrey,
            child: Text(initial, style: theme.textTheme.displayMedium),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                      text: 'Name: ',
                      style: theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: name,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Email: ',
                      style: theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: email,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    comment,
                    style: theme.textTheme.bodySmall,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
