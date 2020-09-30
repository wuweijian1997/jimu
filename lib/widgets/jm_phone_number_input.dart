import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';

class JmPhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> valueChanged;

  JmPhoneNumberInput({this.controller, this.valueChanged});

  @override
  _JmPhoneNumberInputState createState() => _JmPhoneNumberInputState();
}

class _JmPhoneNumberInputState extends State<JmPhoneNumberInput> {
  TextEditingController _editingController;
  bool _showClearIcon = false;

  TextEditingController get controller => widget.controller;

  ValueChanged<String> get valueChanged => widget.valueChanged;

  @override
  void initState() {
    super.initState();
    _editingController = controller ?? TextEditingController(text: '');
    _editingController.addListener(() {
      valueChanged?.call(_editingController.text);
      if (_editingController.text.length > 0 && !_showClearIcon) {
        setState(() {
          _showClearIcon = true;
        });
      } else if (_editingController.text.length == 0 && _showClearIcon) {
        setState(() {
          _showClearIcon = false;
        });
      }
    });
  }

  onClearTextField() {
    _editingController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _editingController,
      style: Theme.of(context).textTheme.bodyText2,
      autofocus: true,
      maxLength: 11,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 2),
          ),
          hintText: '请输入正确手机号',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white70),
          counterText: '',
          // counter: null,
          prefix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '+86',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppTheme.HINT_COLOR,
              ),
              Container(
                color: AppTheme.HINT_COLOR,
                width: 1,
                height: 20,
                margin: EdgeInsets.only(right: 10),
              ),
            ],
          ),
          suffixIcon: Offstage(
              offstage: _editingController.text.length == 0,
              child: GestureDetector(
                  onTap: onClearTextField,
                  child: Icon(
                    Icons.clear,
                    color: Theme.of(context).iconTheme.color,
                  )))),
      onSubmitted: (text) {},
    );
  }
}
