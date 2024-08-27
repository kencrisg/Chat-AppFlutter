import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message messageHer;
  const HerMessageBubble({super.key, required this.messageHer});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              messageHer.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
          imgUrl: messageHer.imageUrl ?? 'https//google.com/images',
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imgUrl;

  const _ImageBubble({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    //final sizes = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imgUrl,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Oyasumi esta enviando una imagen :O'),
          );
        },
      ),
    );
  }
}
