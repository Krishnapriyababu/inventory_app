import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/data/models/category_model.dart';

import '../Dashboard/dashboard_controller.dart';

void main() {
  runApp(const SearchSCreen());
}

class SearchSCreen extends StatelessWidget {

  const SearchSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DashboardController dashboardController = Get.put(DashboardController());
  List<CategoryModel> _foundData = [];
  @override
  initState() {
    _foundData = dashboardController.localDbCategory;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<CategoryModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = _foundData;
    } else {
      results = _foundData
          .where((user) =>
          user.categoryName.toString().toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
     }


    setState(() {
      _foundData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundData.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundData.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundData[index]),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundData[index].categoryId.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundData[index].categoryName.toString()),
                    // subtitle: Text(
                    //     '${_foundUsers[index]["age"].toString()} years old'),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}