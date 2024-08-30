import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Search Result
            Container(
              padding: EdgeInsets.all(8.0),

              child: ListTile(
                leading: Image.asset("assets/images/Image.png",

                ),
                title: Text(
                  'Alita Battle Angel',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '2019\nRosa Salazar, Christoph Waltz',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(height: 2, color: Colors.white),
          ],
        ),
      ),
    );
  }
}