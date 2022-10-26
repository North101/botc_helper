import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';

class OptionLabelItemWidget extends ConsumerWidget {
  const OptionLabelItemWidget({
    required this.optionItem,
    super.key,
  });

  final OptionLabelItem optionItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      optionItem.value,
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: TextAlign.center,
    );
  }
}
