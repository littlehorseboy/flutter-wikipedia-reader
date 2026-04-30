import 'package:flutter/material.dart';

import 'article_model.dart';
import 'article_page.dart';
import 'article_view_model.dart';

class ArticleView extends StatelessWidget {
  ArticleView({super.key});

  // The view model will be instantiated here next.

  @override
  Widget build(BuildContext context) {
    final viewModel = ArticleViewModel(ArticleModel());

    return Scaffold(
      appBar: AppBar(title: const Text('Wikipedia Flutter')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return switch ((
            viewModel.isLoading,
            viewModel.summary,
            viewModel.error,
          )) {
            (true, _, _) => const CircularProgressIndicator(),
            (_, _, final Exception e) => Text('Error: $e'),
            // The summary must be non-null in this switch case.
            (_, final summary?, _) => ArticlePage(
              summary: summary,
              nextArticleCallback: viewModel.fetchArticle,
            ),
            _ => const Text('Something went wrong!'),
          };
        },
      ),
    );
  }
}
