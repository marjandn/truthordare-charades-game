import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/views/colors.dart';

import '../data/entity/game_settings.dart';

class StepperSettingsWidget extends StatefulWidget {
  const StepperSettingsWidget({
    super.key,
    required List<GameSettings> items,
    required this.changeSelectedItem,
  }) : _items = items;

  final List<GameSettings> _items;
  final Function(GameSettings selectedItemPos) changeSelectedItem;

  @override
  State<StepperSettingsWidget> createState() => _StepperSettingsWidgetState();
}

class _StepperSettingsWidgetState extends State<StepperSettingsWidget> {
  int _selectedItemPos = 0;
  List<String> _currentWord = [];

  @override
  Widget build(BuildContext context) {
    _currentWord = widget._items.elementAt(_selectedItemPos).displayedText.split(' ');
    return SizedBox(
      width: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  if ((++_selectedItemPos) >= widget._items.length) _selectedItemPos--;
                });

                widget.changeSelectedItem(widget._items[_selectedItemPos]);
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                  boxShadow: context.appDefaultShadow(),
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: AppColors.whiteColor,
                ),
              )),
          context.sizedBoxWidthExtraSmall,
          Expanded(
            child: RichText(
              textAlign: TextAlign.center,
              text: _currentWord.length == 2
                  ? TextSpan(children: [
                      TextSpan(
                        text: "${_currentWord.first} ",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: _currentWord.elementAt(1),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ])
                  : TextSpan(
                      text: "${_currentWord.first} ",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
            ),
          ),
          context.sizedBoxWidthExtraSmall,
          InkWell(
              onTap: () {
                setState(() {
                  if ((--_selectedItemPos) < 0) _selectedItemPos++;
                });
                widget.changeSelectedItem(widget._items[_selectedItemPos]);
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                  boxShadow: context.appDefaultShadow(),
                ),
                child: Icon(
                  Icons.remove_outlined,
                  color: AppColors.whiteColor,
                ),
              )),
        ],
      ),
    );
  }
}
