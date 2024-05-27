import 'package:elrawdah/controller/cemetery_controller.dart';
import 'package:elrawdah/controller/grave_controller.dart';
import 'package:elrawdah/model/all_grave.dart';
import 'package:elrawdah/model/country.dart';
import 'package:elrawdah/screens/grave_details.dart';
import 'package:elrawdah/model/grave.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchGraveData extends StatefulWidget {
  final String cemetery_name;
  final List<AllGrave>? allGrave;
  const SearchGraveData({super.key, required this.cemetery_name, required this.allGrave});

  @override
  State<SearchGraveData> createState() => _SearchGraveDataState();
}

class _SearchGraveDataState extends State<SearchGraveData> {
  TextEditingController editingController = TextEditingController();
  var controller = Get.put(GraveController());
  // var cemetery= Get.put(CemeteryController());

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];

  var duplicateItemsData = <Grave>[];
  var itemsData = <Grave>[];

  @override
  void initState() {
    items = duplicateItems;
    super.initState();
    initSearch();
    duplicateItemsData = controller.graveDataSearch;
    itemsData = duplicateItemsData;
  }

  initSearch() async {
    await controller.getAllGraveData();
    // await cemetery.getAllCemetery(Country(name: "الإمارات العربية المتحدة",id: 1));
  }

  List<Grave> filterSearchResults(String query, String cemetery_name) {
    // var cemeteryTemp = cemetery.allCemetery.where((element) => element.name == cemetery_name);
    return duplicateItemsData.where((item) {
      return item.dead_name!.contains(query); 
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value,widget.cemetery_name);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () =>
                            filterSearchResults(editingController.text,widget.cemetery_name)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemsData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => GraveDetails(id: itemsData[index].id));
                    },
                    child: ListTile(
                      title: Text('${itemsData[index].dead_name}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
