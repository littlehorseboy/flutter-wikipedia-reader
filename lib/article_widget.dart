import 'package:flutter/material.dart';

import 'summary.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.summary});

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            summary.titles.normalized,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (summary.description != null)
            Text(
              summary.description!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          if (summary.hasImage)
            Image.network(summary.thumbnail!.source),
          Text(summary.extract),
        ],
      ),
    );
  }
}
