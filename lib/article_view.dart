import 'package:flutter/material.dart';

import 'article_model.dart';
import 'article_page.dart';
import 'article_view_model.dart';

class ArticleView extends StatefulWidget {
  ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late final ArticleViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ArticleViewModel(ArticleModel());
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wikipedia Flutter')),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return switch ((
              viewModel.isLoading,
              viewModel.summary,
              viewModel.error,
            )) {
              (true, _, _) => const CircularProgressIndicator(),
              (_, _, final Exception e) => Text('Error: $e'),
              (_, final summary?, _) => ArticlePage(
                summary: summary,
                nextArticleCallback: viewModel.fetchArticle,
              ),
              _ => const Text('Something went wrong!'),
            };
          },
        ),
      ),
    );
  }
}
