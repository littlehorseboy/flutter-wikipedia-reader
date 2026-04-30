import 'package:flutter/material.dart';

import 'article_model.dart';
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
          return const Center(child: Text('Loading...'));
        },
      ),
    );
  }
}
