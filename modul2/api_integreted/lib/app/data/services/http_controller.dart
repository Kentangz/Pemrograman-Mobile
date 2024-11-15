import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class HttpController extends GetxController {
  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://my-json-server.typicode.com/Fallid/codelab-api/db'));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        articles.assignAll(result['articles'].map<Article>((json) => Article.fromJson(json)).toList());
      } else {
        print('Error fetching articles: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
