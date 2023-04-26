import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final TextEditingController _contactController= TextEditingController();
final TextEditingController _updateContactController= TextEditingController();

Box? contactBox;
@override
  void initState() {
   contactBox= Hive.box("contact_list");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Column(
          children: [
            TextField(
              controller: _contactController,
              decoration: InputDecoration(hintText: "Contact Number"),
            ),
            SizedBox(
              width: 300, child: ElevatedButton(onPressed: ()async {
                final userInput= _contactController.text;
                await contactBox!.add(userInput);
               _contactController.clear();
               Get.snackbar("Success", "Contact Added Successfully", backgroundColor: Colors.white);

            }, child: Text("Add New Contact")),

            ),
            Expanded(child: ValueListenableBuilder(
              valueListenable: Hive.box("contact_list").listenable(),
              builder: (context, value, child){
                return ListView.builder(
                    itemCount: contactBox!.keys.toList().length,

                    itemBuilder: (_,index){
                      return Card(
                        elevation: 2, child: ListTile(title: Text(contactBox!.getAt(index)),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              showDialog(context: context, builder: (_){return Dialog(
                                child: Container(height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
                                  child: Column(children: [ TextField(
                                    controller: _updateContactController,
                                    decoration: InputDecoration(hintText: "Update Contact Number"),
                                  ),
                                    SizedBox(
                                      width: 300, child: ElevatedButton(
                                        onPressed: ()async {
                                      final input= _updateContactController.text;
                                       contactBox!.putAt(index, input);
                                      _updateContactController.clear();
                                      Get.back();
                                      Get.snackbar("Success", "Contact Updated Successfully", backgroundColor: Colors.white);

                                    }, child: Text("Update Contact")),

                                    ),

                                  ],),
                                ),),
                              );
                              });
                            }, icon: Icon(Icons.edit_note_outlined,color: Colors.blue,)),

                            IconButton(onPressed: () async {
                              await contactBox!.deleteAt(index);
                            }, icon: Icon(Icons.delete_outlined, color: Colors.red,)),



                          ],
                        ),
                      ),),
                      );
                    });
              }
            ))
          ],
        ),
      ),
    );
  }
}
