import 'package:flutter/material.dart';

Widget createCard(String leading, String title, BuildContext context) {
  return Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Text(
              leading, 
              style: TextStyle(color:Colors.blue, fontSize: 18.0),
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.black12, fontSize: 20.0),
              ),
          ),
        );
}