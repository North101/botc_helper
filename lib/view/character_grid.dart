import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/view/header_list_tile.dart';

class CharacterGrid extends ConsumerWidget {
  const CharacterGrid({
    required this.data,
    required this.onTap,
    super.key,
  });

  final List<MapEntry<CharacterType, List<CharacterData>>> data;
  final void Function(CharacterData character)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        for (final characterByType in data)
          SliverStickyHeader(
            header: HeaderListTile.title(
              title: characterByType.key.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => CharacterGridItem(
                  character: characterByType.value[index],
                  onTap: onTap,
                ),
                childCount: characterByType.value.length,
              ),
            ),
          ),
      ],
    );
  }
}

class CharacterGridItem extends StatelessWidget {
  const CharacterGridItem({
    required this.character,
    this.onTap,
    super.key,
  });

  final CharacterData character;
  final void Function(CharacterData character)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null ? () => onTap?.call(character) : null,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            character.image(),
            Text(
              character.name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
