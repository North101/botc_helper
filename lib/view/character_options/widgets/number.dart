import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';

final numberProvider = RestorableProvider<RestorableInt>(
  (ref) => throw UnimplementedError(),
  restorationId: 'number_provider',
);

class OptionNumberItemWidget extends ConsumerWidget {
  const OptionNumberItemWidget({
    required this.optionItem,
    super.key,
  });

  static Widget withOverrides({
    required String restorationId,
    required OptionNumberItem optionItem,
  }) =>
      RestorableProviderScope(
        restorationId: restorationId,
        restorableOverrides: [
          numberProvider.overrideWithRestorable(RestorableInt(optionItem.value ?? 0)),
        ],
        child: OptionNumberItemWidget(optionItem: optionItem),
      );

  final OptionNumberItem optionItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.read(numberProvider);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        initialValue: '${number.value}',
        onChanged: (value) {
          number.value = int.tryParse(value) ?? number.value;
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
