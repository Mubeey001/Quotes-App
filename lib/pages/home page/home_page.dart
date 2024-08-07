import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person_rounded))
          ],
        ),
        body: Obx(
          () {
            if (homeController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: homeController.quote.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(homeController.quote[index]['quote']),
                    subtitle: Text(homeController.quote[index]['author']),
                  );
                });
          },
        ));
  }
}
