import 'dart:io';

import 'package:flutter/material.dart';

import 'article_model.dart';
import 'summary.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleModel model;
  Summary? summary;
  Exception? error;
  bool isLoading = false;

  ArticleViewModel(this.model) {
    fetchArticle();
  }

  Future<void> fetchArticle() async {
    isLoading = true;
    notifyListeners();
    try {
      summary = await model.getRandomArticleSummary();
      print('Article loaded: ${summary!.titles.normalized}');
      error = null; // Clear any previous errors.
    } on HttpException catch (e) {
      print('Error loading article: ${e.message}');
      error = e;
      summary = null;
    }
    isLoading = false;
    notifyListeners();
  }
}
