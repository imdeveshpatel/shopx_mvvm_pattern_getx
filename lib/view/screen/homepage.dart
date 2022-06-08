import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx_mvvm_pattern/controller/product_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Productcontroller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 24, 24, 244),
          shadowColor: const Color.fromARGB(255, 95, 121, 237),
          elevation: 8,
          title: const Text(
            'ShopX',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(children: [
              Scaffold(
                body: SafeArea(
                    child: ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .productList[index].image!))),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              child: Text(
                                "\u{20B9}${controller.productList[index].price!}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.remove_circle_outline)),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all()),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: GetBuilder<Productcontroller>(
                                      builder: (controller) {
                                        return Text(
                                          controller
                                              .productList[index].itemCount
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_circle_outline)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
              ),
            ]);
          }
        }));
  }
}
