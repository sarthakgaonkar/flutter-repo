import 'package:flutter/material.dart';

class ListGrid extends StatefulWidget {
  const ListGrid({super.key});

  @override
  State<ListGrid> createState() => _ListGridState();
}

class _ListGridState extends State<ListGrid> {
  List<String> fruits = ['Orange','Apple','Banana','Mango'];
  Map fruits_person = {
    'fruits': ['Orange','Apple','Banana','Mango'],
    'names': ['A','B','C','D']
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List and Grid View'),
        elevation: 0, //shadow
        backgroundColor: Colors.yellow,
      ),
      // body: Container(
      //   child: ListView(
      //     children: [
      //       Card(
      //         child: ListTile(
      //           title: Text('Orange'),
      //           subtitle: Text('fruit'),
      //         ),
      //       ),
      //       Card(
      //         child: ListTile(
      //           title: Text('Orange'),
      //           subtitle: Text('fruit'),
      //         ),
      //       ),
      //       Card(
      //         child: ListTile(
      //           title: Text('Orange'),
      //           subtitle: Text('fruit'),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Container(
        // child: ListView.builder(
        //   itemCount: fruits.length,
        //   itemBuilder: (context,index){
        //     return Card(
        //       child: ListTile(
        //         onTap: (){
        //           print(fruits_person['fruits'][index]);
        //         },
        //         leading: Icon(Icons.person),
        //         title: Text(fruits_person['fruits'][index]),
        //         subtitle: Text(fruits_person['names'][index]),
        //       ),
        //     );
        //   },
        // ),
        // child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
        //   (crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        // children: [
        //   Card(
        //     child: Center(
        //       child: Text('Orange'),
        //     ),
        //   ),
        //   Card(
        //     child: Center(
        //       child: Text('Orange'),
        //     ),
        //   ),
        //   Card(
        //     child: Center(
        //       child: Text('Orange'),
        //     ),
        //   ),
        //   Card(
        //     child: Center(
        //       child: Text('Orange'),
        //     ),
        //   ),
        // ],
        // ),
        child: GridView.builder(
            itemCount: fruits.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context,index)
            {
              return Card(
                child: ListTile(
                  title: Text(fruits_person['fruits'][index]),
                  subtitle: Text(fruits_person['names'][index])
                ),
              );
            }
        ),
      ),
    );
  }
}
