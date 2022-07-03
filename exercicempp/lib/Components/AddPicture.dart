import 'package:flutter/material.dart';

class AddPicture extends StatelessWidget {
  const AddPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                color: Color.fromARGB(90, 189, 189, 189),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.add_a_photo, color: Colors.grey[100], size: 20),
                  Text(
                    "Add Photo",
                    style: TextStyle(color: Colors.grey[100]),
                  )
                ])));
  }
}
