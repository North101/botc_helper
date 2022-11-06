import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';

final textProvider = RestorableProvider<RestorableString>(
  (ref) => throw UnimplementedError(),
  restorationId: 'text_provider',
);

class OptionTextItemWidget extends ConsumerWidget {
  const OptionTextItemWidget({
    required this.optionItem,
    super.key,
  });

  static Widget withOverrides({
    required String restorationId,
    required OptionTextItem optionItem,
  }) =>
      RestorableProviderScope(
        restorationId: restorationId,
        restorableOverrides: [
          textProvider.overrideWithRestorable(RestorableString(optionItem.value ?? '')),
        ],
        child: OptionTextItemWidget(optionItem: optionItem),
      );

  final OptionTextItem optionItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.read(textProvider);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        autofocus: true,
        initialValue: text.value,
        onChanged: (value) {
          text.value = value;
        },
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: Theme.of(context).textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
