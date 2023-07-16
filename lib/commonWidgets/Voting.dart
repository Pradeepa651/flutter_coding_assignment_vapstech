import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Voting extends StatelessWidget {
  final int votingUp;

  const Voting({
    Key? key,
    required this.votingUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(size: 35, FontAwesomeIcons.caretUp),
        ),
        Text('$votingUp',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        IconButton(
            onPressed: () {},
            icon: const Icon(size: 35, FontAwesomeIcons.caretDown)),
      ],
    );
  }
}
