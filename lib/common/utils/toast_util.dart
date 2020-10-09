import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';
import 'package:jimu/widgets/index.dart';

class ToastUtil {
  static OverlayEntry _overlayEntry;
  static OverlayEntry _loadOverlayEntry;

  static show(
      {String msg,
        dismiss = const Duration(milliseconds: 2000)}) {
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(builder: (_) {
      return buildToastLayout(msg);
    });
    NavigatorUtil.currentState.overlay.insert(_overlayEntry);
    Future.delayed(dismiss, hidden);
  }

  static showLoading({
    double radius = 20,
  }) {
    if (_loadOverlayEntry != null) return;
    _loadOverlayEntry = OverlayEntry(builder: (_) {
      return Center(
        child: LoadingIndicator(radius: 20, color: Colors.cyanAccent,),
      );
    });
    NavigatorUtil.currentState.overlay.insert(_loadOverlayEntry);
  }

  static hidden() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static hiddenLoading() {
    _loadOverlayEntry?.remove();
    _loadOverlayEntry = null;
  }

  static Widget buildToastLayout(String msg) {
    return Material(
      child: IgnorePointer(
        ignoring: true,
        child: Center(
          child: Container(
            width: 120,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              msg,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
