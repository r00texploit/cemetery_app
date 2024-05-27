import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/historical_grave_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoricalGravesPage extends StatefulWidget {
  const HistoricalGravesPage({super.key});

  @override
  State<HistoricalGravesPage> createState() => _HistoricalGravesPageState();
}

class _HistoricalGravesPageState extends State<HistoricalGravesPage> {
  var logic = Get.put(HistoricalGravesController());
  @override
  void initState() {
    super.initState();
    logic.getAllHistoricalGraves();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricalGravesController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: const Text('الصفحة الرئسية'),
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
                          // AppGreet(),
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
                                'القبور التاريخية',
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
                              itemCount: logic.listHistoricalGraves.length,
                              itemBuilder: (context, index) {
                                logic.listHistoricalGraves.isEmpty
                                    ? Center(
                                        child:
                                            Text("No historical graves found"))
                                    : Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.blue),
                                              const SizedBox(width: 10.0),
                                              Text(
                                                  logic
                                                      .listHistoricalGraves[
                                                          index]
                                                      .title!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                            ],
                                          ),
                                          const Divider(),
                                          Text(logic.listHistoricalGraves[index]
                                              .subTitle!),
                                          const Divider(),
                                          Text(logic.listHistoricalGraves[index]
                                              .text!)
                                        ],
                                      );
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    ))
                  ])));
      },
    );
  }
}
