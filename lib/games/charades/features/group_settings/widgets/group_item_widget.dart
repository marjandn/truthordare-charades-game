import 'package:flutter/material.dart';

import '../../../../shared_widgets/roung_text_input_widget.dart';

class GroupItemWidget extends StatelessWidget {
  const GroupItemWidget({
    super.key,
    required TextEditingController group1TextController,
    required String assetPath,
  })  : _group1TextController = group1TextController,
        _assetPath = assetPath;

  final TextEditingController _group1TextController;
  final String _assetPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: RoundedTextInputWidget(
              textEditController: _group1TextController,
              textAlign: TextAlign.center,
              textStyle:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              top: 0,
              right: 10,
              child: Image.asset(
                _assetPath,
                width: 50,
              )),
        ],
      ),
    );
  }
}
