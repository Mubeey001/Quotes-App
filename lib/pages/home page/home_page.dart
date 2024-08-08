import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/home_controller.dart';
import 'package:quote_app/util/constants/color.dart';
import 'package:quote_app/util/widgets/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());
  final TextEditingController searchQuote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomAppBarWidget(
            textEditingController: searchQuote,
            onChanged: (value) => homeController.filterQuotes(value),
            profile: const Icon(Icons.person_3_sharp),
            onPressed: () {},
          ),
          Expanded(
            child: Obx(
              () {
                if (homeController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.elementColor,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: homeController.filteredQuotes.length,
                  itemBuilder: (context, index) {
                    final quote = homeController.filteredQuotes[index];
                    return Card(
                      color: AppColor.backgroundColor,
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quote['quote'],
                              style: GoogleFonts.gupter(
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              "- ${quote['author']}",
                              style: GoogleFonts.lora(
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                                color: AppColor.elementColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
