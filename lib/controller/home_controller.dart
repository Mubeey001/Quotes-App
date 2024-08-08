import 'package:get/get.dart';
import 'package:quote_app/backend%20services/dio_quote_fetch.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  var quote = <dynamic>[].obs;
  var filteredQuotes = <dynamic>[].obs;
  var isLoading = true.obs;

  final DioQuoteFetch _dioQuoteFetch = DioQuoteFetch();
  final Logger logger = Logger();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      isLoading(true);
      final response = await _dioQuoteFetch.getQuotes();
      quote.assignAll(response.data['quotes']);
      filteredQuotes.assignAll(quote);
    } catch (e) {
      logger.e("Error fetching quotes", error: e);
    } finally {
      isLoading(false);
    }
  }

  void filterQuotes(String query) {
    if (query.isEmpty) {
      filteredQuotes.assignAll(quote);
    } else {
      filteredQuotes.assignAll(quote.where((q) {
        final quoteText = q['quote'].toLowerCase();
        final authorText = q['author'].toLowerCase();
        final searchQuery = query.toLowerCase();
        return quoteText.contains(searchQuery) ||
            authorText.contains(searchQuery);
      }).toList());
    }
  }
}
