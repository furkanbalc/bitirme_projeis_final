import 'package:bende_fazla/product/enums/index.dart';
import 'package:bende_fazla/product/widgets/images/custom_image_widget.dart';
import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Mesaj kutusu boş'),
          CustomImageWidget(imageName: AppImages.empty.toImage),
        ],
      ),
    );
  }
}
