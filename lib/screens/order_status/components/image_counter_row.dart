import 'package:flutter/material.dart';

import 'dot_container.dart';

class ImageCounterRow extends StatelessWidget {
  const ImageCounterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DotContainer(index: 0),
        DotContainer(index: 1),
        DotContainer(index: 2)
      ],
    );
  }
}
