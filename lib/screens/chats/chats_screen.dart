import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/ui_helper.dart';

import '../message/message_screen.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});
  final arrContent = [
    {
      "images":
          "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "name": "Aron",
      "lastmsg": "Lorem Ipsum",
      "time": "05:45 am",
      "msg": "7",
    },
    {
      "images":
          "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
      "name": "Aron1",
      "lastmsg": "Flutter",
      "time": "06:45 am",
      "msg": "1",
    },
    {
      "images":
          "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
      "name": "WSCUBETECH",
      "lastmsg": "Flutter Batch is Starting",
      "time": "07:45 am",
      "msg": "2",
    },
    {
      "images":
          "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "name": "Aron",
      "lastmsg": "Lorem Ipsum",
      "time": "05:45 am",
      "msg": "7",
    },
    {
      "images":
          "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
      "name": "Aron1",
      "lastmsg": "Flutter",
      "time": "06:45 am",
      "msg": "1",
    },
    {
      "images":
          "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
      "name": "WSCUBETECH",
      "lastmsg": "Flutter Batch is Starting",
      "time": "07:45 am",
      "msg": "2",
    },
    {
      "images":
          "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "name": "Aron",
      "lastmsg": "Lorem Ipsum",
      "time": "05:45 am",
      "msg": "7",
    },
    {
      "images":
          "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
      "name": "Aron1",
      "lastmsg": "Flutter",
      "time": "06:45 am",
      "msg": "1",
    },
    {
      "images":
          "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
      "name": "WSCUBETECH",
      "lastmsg": "Flutter Batch is Starting",
      "time": "07:45 am",
      "msg": "2",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MessageScreen(
                              userName: arrContent[index]["name"].toString(),
                              userImage: arrContent[index]["images"].toString(),
                            ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      arrContent[index]["images"].toString(),
                    ),
                  ),
                  title: UiHelper.customTextStyle(
                    text: arrContent[index]["name"].toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: UiHelper.customTextStyle(
                    text: arrContent[index]["lastmsg"].toString(),
                    fontSize: 13,
                    color: Color(0XFF889095),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.customTextStyle(
                        text: arrContent[index]["time"].toString(),
                        fontSize: 12,
                        color: Color(0XFF026500),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0XFF036A01),
                        child: UiHelper.customTextStyle(
                          text: arrContent[index]["msg"].toString(),
                          fontSize: 12,
                          color: Color(0XFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: arrContent.length,
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => ContactScreen()));
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color(0XFF008665),
          child: Icon(Icons.message, color: Color(0XFFFFFFFF), size: 30),
        ),
      ),
    );
  }
}
