import 'package:flutter/material.dart';

import 'note_widget.dart';

class Content extends StatelessWidget {
  final String title, iconUrl;
  final Widget child;
  // final bool hasNote;
  const Content(
      {Key? key,
      required this.title,
      required this.iconUrl,
      required this.child,
      // required this.hasNote
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          margin: const EdgeInsets.only(
            top: 7.5,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            border: Border.all(
              color: const Color(0xff4184CE),
              width: 0.01,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: Text(
                  title,
                  style:
                      const TextStyle(color: Color(0xff4184CE), fontSize: 14),
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.all(3),
                child: Image.asset(
                  iconUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        child,
        // if (hasNote) const NoteWidget(),
      ],
    );
  }
}
