import 'package:ebook/model/SubBabModel.dart';
import 'package:ebook/pages/HomeScreen.dart';
import 'package:flutter/material.dart';

class SubabClass extends StatefulWidget {
  final int selectedSubBabIndex; // Add this line

  SubabClass({required this.selectedSubBabIndex});
  @override
  _SubabClassState createState() => _SubabClassState();
}

class _SubabClassState extends State<SubabClass> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Sub Bab'),
      ),
      body: Column(
        children: [
          Text(
            '${subBabList[_currentPage].judul}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 600, // Adjust the height as needed
            child: PageView.builder(
              controller: _pageController,
              itemCount: subBabList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      subBabList[index].isi,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
