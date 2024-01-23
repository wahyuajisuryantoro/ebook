import 'package:ebook/pages/SubBabScreen.dart';
import 'package:flutter/material.dart';

class MateriClass extends StatelessWidget {
  final List<String> subBabTitles = [
    'Sub Bab 1',
    'Sub Bab 2',
    'Sub Bab 3',
    'Sub Bab 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi'),
      ),
      body: ListView.builder(
        itemCount: subBabTitles.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            margin: EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                // Navigate to the respective SubabClass with the selected sub-bab index
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubabClass(
                      selectedSubBabIndex: index,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  subBabTitles[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
