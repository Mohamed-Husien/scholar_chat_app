import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/loading_indicator.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  TextEditingController textEditingController = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedA, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = snapshot.data!.docs
                .map((doc) => MessageModel.fromJson(doc))
                .toList();

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                    ),
                    const Text(
                      'scholar Chat',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Pacifico'),
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == id
                              ? ChatBuble(
                                  messageModel: messageList[index],
                                )
                              : ChatBubleFromFriend(
                                  messageModel: messageList[index],
                                );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (data) {
                        textEditingController.clear();
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: IconButton(
                            onPressed: () {
                              messages.add({
                                kMessage: textEditingController.text,
                                kCreatedA: DateTime.now(),
                                'id': id,
                              });
                              textEditingController.clear();
                              _controller.animateTo(
                                0,
                                duration: const Duration(seconds: 2),
                                curve: Curves.easeIn,
                              );
                            },
                            icon: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              ))),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SkeletonizerIndicator();
          }
        });
  }
}
