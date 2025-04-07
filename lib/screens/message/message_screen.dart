import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/ui_helper.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
    this.userName = "User Name",
    this.userImage = "https://dummyimage.com/300x300/000/fff&text=User",
  });
  final String userName;
  final String userImage;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadDummyMessages();
  }

  void _loadDummyMessages() {
    _messages.addAll([
      {'text': 'Hey there!', 'timestamp': '10:00 AM', 'isMe': false},
      {'text': 'Hello! How are you?', 'timestamp': '10:01 AM', 'isMe': true},
      {
        'text': 'I\'m good, thanks! What about you?',
        'timestamp': '10:02 AM',
        'isMe': false,
      },
      {
        'text': 'Doing great. Just working on a Flutter project.',
        'timestamp': '10:03 AM',
        'isMe': true,
      },
      {
        'text': 'Nice! Flutter is awesome.',
        'timestamp': '10:04 AM',
        'isMe': false,
      },
    ]);
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': text,
          'timestamp': TimeOfDay.now().format(context),
          'isMe': true,
        });
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                widget.userImage, // Replace with your image URL
              ), // Replace with your image URL
            ),
            SizedBox(width: 10),
            UiHelper.customTextStyle(
              text: widget.userName,
              fontSize: 16,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Handle call action
            },
          ),
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              // Handle video call action
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
                  final isMe = message['isMe'];
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMe ? Colors.green[300] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment:
                            isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          UiHelper.customTextStyle(
                            text: message['text'],
                            fontSize: 14,
                            color: isMe ? Colors.white : Colors.black,
                          ),
                          SizedBox(height: 5),
                          UiHelper.customTextStyle(
                            text: message['timestamp'],
                            fontSize: 12,
                            color: isMe ? Colors.white70 : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
