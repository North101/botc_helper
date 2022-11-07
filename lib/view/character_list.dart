import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/view/header_list_tile.dart';
import '/view/util.dart';

class CharacterList extends ConsumerWidget {
  const CharacterList({
    required this.data,
    required this.onTap,
    super.key,
  });

  final Iterable<MapEntry<CharacterType, Iterable<CharacterData>>> data;
  final void Function(CharacterData character)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        for (final characterByType in data)
          SliverStickyHeader(
            header: HeaderListTile.title(
              title: characterByType.key.title,
            ),
            sliver: SliverList(
              delegate: SliverChildSeperatedBuilderDelegate(
                (context, index) => CharacterTile(
                  character: characterByType.value.elementAt(index),
                  onTap: onTap,
                ),
                (context, index) => const Divider(),
                childCount: characterByType.value.length
              ),
            ),
          ),
      ],
    );
  }
}

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.character,
    this.onTap,
    super.key,
  });

  final CharacterData character;
  final void Function(CharacterData character)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(character.name),
      subtitle: Text(character.description),
      leading: character.image(width: 40, height: 40),
      onTap: onTap != null ? () => onTap!(character) : null,
    );
  }
}
