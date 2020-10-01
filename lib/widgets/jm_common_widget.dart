import 'package:flutter/material.dart';

/// widget and description
class CommonWidget {

  static const Widget inputClearIcon = const Icon(
    Icons.clear,
  );

  static const OutlineInputBorder inputBorder =  const OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: const BorderSide(
      width: 2,
    ),
  );

}