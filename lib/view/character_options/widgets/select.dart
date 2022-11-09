import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';

final selectProvider = RestorableProvider<RestorableIntN>(
  (ref) => throw UnimplementedError(),
  restorationId: 'select_provider',
);

class OptionSelectItemWidget extends ConsumerWidget {
  const OptionSelectItemWidget({
    required this.optionItem,
    super.key,
  });

  static withOverrides({
    required String restorationId,
    required OptionSelectItem optionItem,
  }) =>
      RestorableProviderScope(
        restorationId: restorationId,
        overrides: [
          selectProvider.overrideWith((ref) => RestorableIntN(optionItem.value)),
        ],
        child: OptionSelectItemWidget(optionItem: optionItem),
      );

  final OptionSelectItem optionItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton<int>(
        autofocus: true,
        isExpanded: true,
        itemHeight: 72,
        iconSize: 0.0,
        hint: Center(
          child: Text(
            'Select Option',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        ),
        value: selected.value,
        selectedItemBuilder: (context) => [
          for (final option in optionItem.items.asMap().entries)
            DropdownMenuItem(
              value: option.key,
              child: Center(
                child: Text(
                  option.value,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
        items: [
          for (final option in optionItem.items.asMap().entries)
            DropdownMenuItem(
              value: option.key,
              child: Center(
                child: Text(
                  option.value,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
        onChanged: (value) {
          selected.value = value;
        },
      ),
    );
  }
}
