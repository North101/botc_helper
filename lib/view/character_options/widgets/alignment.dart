import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';

final alignmentProvider = RestorableProvider<RestorableIntN>(
  (ref) => throw UnimplementedError(),
  restorationId: 'alignment_provider',
);

class OptionAlignmentItemWidget extends ConsumerWidget {
  const OptionAlignmentItemWidget({
    required this.optionItem,
    super.key,
  });

  static Widget withOverrides({
    required String restorationId,
    required OptionAlignmentItem optionItem,
  }) =>
      RestorableProviderScope(
        restorationId: restorationId,
        overrides: [
          alignmentProvider.overrideWith((ref) => RestorableIntN(CharacterAlignment.values.firstWhereOrNull((e) {
            return e == optionItem.value;
          })?.index)),
        ],
        child: OptionAlignmentItemWidget(optionItem: optionItem),
      );

  final OptionAlignmentItem optionItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(alignmentProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton<CharacterAlignment>(
        autofocus: true,
        isExpanded: true,
        itemHeight: 72,
        iconSize: 0.0,
        hint: Center(
          child: Text(
            'Select Alignment',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        ),
        value: selected.value != null ? CharacterAlignment.values[selected.value!] : null,
        selectedItemBuilder: (context) => [
          for (final alignment in CharacterAlignment.values)
            DropdownMenuItem(
              value: alignment,
              child: Center(
                child: Text(
                  alignment.title,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
        items: [
          for (final alignment in CharacterAlignment.values)
            DropdownMenuItem(
              value: alignment,
              child: Center(
                child: Text(
                  alignment.title,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
        onChanged: (value) {
          selected.value = value?.index;
        },
      ),
    );
  }
}
