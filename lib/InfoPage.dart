import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  String img;
  String title;
  String description;
  InfoPage(this.img, this.title, this.description);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          expandedHeight: 300.0,
          title: Text(this.title, style: TextStyle(
            backgroundColor: Colors.grey[100],
            color: Colors.black
          ),),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(this.img, fit: BoxFit.cover,),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate([
          SizedBox(height: 100),
          SizedBox(
            height: 100.0,
            child: Text(
              this.description,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),
          )
        ]
          )
        ),

      ],
    ),
    );
  }
}
