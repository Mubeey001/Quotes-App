import 'package:get/get.dart';
import 'package:quote_app/dio%20services/dio_quote_fetch.dart';

class HomeController extends GetxController {
  var quote = [].obs;
  var isLoading = true.obs;

  final DioQuoteFetch _dioQuoteFetch = DioQuoteFetch();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      final response = await _dioQuoteFetch.getQuotes();
      quote.value = response.data['quotes'];
    } catch (e) {
      print("Error $e");
    } finally {
      isLoading(false);
    }
  }
}
