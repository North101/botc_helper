import 'package:flutter/widgets.dart';

enum CharacterAlignment {
  good('Good', Color(0xff061af5)),
  evil('Evil', Color(0xffb4261a));

  const CharacterAlignment(this.title, this.color);

  final String title;
  final Color color;
}
