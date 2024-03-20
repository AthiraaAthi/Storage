import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practising_wrk/model/my_model.dart';
import 'package:practising_wrk/utils/color_constant/color_constant.dart';
import 'package:practising_wrk/view/home_screen/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<MyModel>("MyBox");
  var keyList = [];
  @override
  void initState() {
    keyList = box.keys.toList();
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  List<String> myList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: ColorConstant.purple,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: keyList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: HomeScreenWidget(
            name: box.get(keyList[index])!.name,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.purple,
        child: Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(color: ColorConstant.defPurple),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.purple)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.purple)),
                                  fillColor: ColorConstant.defPurple,
                                  filled: true,
                                  hintStyle:
                                      TextStyle(color: ColorConstant.purple),
                                  hintText: "Enter Anything",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConstant.purple),
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorConstant.purple)),
                                onPressed: () {
                                  box.add(MyModel(name: nameController.text));
                                  keyList = box.keys.toList();

                                  setState(() {});
                                  nameController.clear();
                                  Navigator.pop(context);
                                },
                                child: Text("save")),
                          ],
                        ),
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
