import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/quotes_controller.dart';
import 'package:elrawdah/model/quotes_model.dart';
import 'package:elrawdah/screens/widgets/app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

class BaredPage extends StatefulWidget {
  const BaredPage({super.key});

  @override
  State<BaredPage> createState() => _BaredPageState();
}

class _BaredPageState extends State<BaredPage> {
  QuotesController quotes = Get.put(QuotesController());
  @override
  void initState() {
    super.initState();
    quotes.getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuotesController>(builder: (logic) {
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const AppGreet(),
                            const SizedBox(
                              height: 25.0,
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'قائمة الاحاديث',
                                  style: fontStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
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
                                    itemCount: quotes.quotes.length,
                                    itemBuilder: (context, index) =>
                                        ResponsibilityWidget(
                                            responsibility:
                                                quotes.quotes[index]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
    });
  }
}

class ResponsibilityWidget extends StatelessWidget {
  final Quote responsibility;

  const ResponsibilityWidget({super.key, required this.responsibility});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.blue),
              const SizedBox(width: 10.0),
              Text(responsibility.title!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const Divider(),
          Text(responsibility.subTitle!),
          const Divider(),
          HtmlWidget(responsibility.text!)
        ],
      ),
    );
  }
}
