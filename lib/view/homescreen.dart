
import 'package:exam_hive/models/data_modelss.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<Asset>("sampleBox");

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  List keys = [];

  @override
  void initState() {
    super.initState();
    keys = box.keys.toList();
  }

  void _addData() {
    final newAsset = Asset(name: name.text, description: description.text);
    box.add(newAsset);
    setState(() {
      keys = box.keys.toList();

      name.clear();
      description.clear();
    });
   
  }

  void _updateData(){
    final editAsset= Asset(name: name.text, description: description.text);
    box.put(keys, editAsset);
    setState(() {
      keys=box.keys.toList();
    });
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mobile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: description,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addData,
              child: Text("Add Data"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  final asset = 
                  box.get(keys[index]) as Asset;
                  return asset != null
                      ? 
                      ListTile(
                          title: Text("Name: ${asset.name}"),
                          subtitle: Text("Description: ${asset.description}"),
                          trailing: IconButton(onPressed: (){
                            box.get(keys);

                          }
                         

                          , icon: Icon(Icons.edit)),
                        )
                      : SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
