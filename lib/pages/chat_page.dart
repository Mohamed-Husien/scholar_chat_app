import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';

  List<MessageModel> messageList = [];
  TextEditingController textEditingController = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments.toString();

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
              style: TextStyle(color: Colors.white, fontFamily: 'Pacifico'),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
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
                    });
              },
            ),
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
                      BlocProvider.of<ChatCubit>(context).sendMessage(
                          message: textEditingController.text, email: id);
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
  }
}
