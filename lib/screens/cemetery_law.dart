import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/teaching_controller.dart';
import 'package:elrawdah/screens/widgets/app_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CemeteryLawScreen extends StatefulWidget {
  const CemeteryLawScreen({super.key});

  @override
  State<CemeteryLawScreen> createState() => _CemeteryLawScreenState();
}

class _CemeteryLawScreenState extends State<CemeteryLawScreen> {
  var logic = Get.put(TeachingController());
  @override
  void initState() {
    super.initState();
    logic.getTeaching();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachingController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: appNameText,
              backgroundColor: backgroundColor,
            ),
            body: logic.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppGreet(),
                          SizedBox(
                            height: 25.0,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ' قائمة التعاليم الدينية ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
                            blurRadius: 10,
                          ),
                        ],
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            35.0,
                          ),
                          topRight: Radius.circular(
                            35.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 40, bottom: 0, right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: logic.teaching.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Icon(Icons.check_circle_outline,
                                              color: Colors.blue),
                                          const SizedBox(width: 10.0),
                                          Text(logic.teaching[index].title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ],
                                      ),
                                      const Divider(),
                                      Text(logic.teaching[index].subTitle!),
                                      const Divider(),
                                      Text(logic.teaching[index].text!)
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ])));
      },
    );
  }
}
