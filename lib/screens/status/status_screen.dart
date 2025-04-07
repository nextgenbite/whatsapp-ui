import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/ui_helper.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({super.key});
  final statusContent = [
    {
      "img":
          "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg",
      "name": "Micheal",
      "statustime": "15 min ago",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/047/462/757/small/positive-man-on-clean-background-photo.jpg",
      "name": "Franklin",
      "statustime": "1 day ago",
    },
    {
      "img":
          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg",
      "name": "Trevor",
      "statustime": "1 hr ago",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              UiHelper.customTextStyle(text: "Status", fontSize: 20),
            ],
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0XFF008069),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Color(0XFFFFFFFF),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: UiHelper.customTextStyle(text: "My Status", fontSize: 20),
            subtitle: UiHelper.customTextStyle(
              text: "Tap to add status update",
              fontSize: 15,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.customTextStyle(text: "Recent updates", fontSize: 15),
                Icon(Icons.arrow_drop_down, color: Color(0XFF5E5E5E)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      statusContent[index]["img"].toString(),
                    ),
                  ),
                  title: UiHelper.customTextStyle(
                    text: statusContent[index]["name"].toString(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: UiHelper.customTextStyle(
                    text: statusContent[index]["statustime"].toString(),
                    fontSize: 14,
                  ),
                );
              },
              itemCount: statusContent.length,
            ),
          ),
        ],
      ),
    );
  }
}
