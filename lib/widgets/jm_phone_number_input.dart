import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';

class JmPhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> valueChanged;
  final ValueChanged<String> onSubmit;

  JmPhoneNumberInput({this.controller, this.valueChanged, this.onSubmit});

  @override
  _JmPhoneNumberInputState createState() => _JmPhoneNumberInputState();
}

class _JmPhoneNumberInputState extends State<JmPhoneNumberInput> {
  TextEditingController _editingController;
  bool _showClearIcon = false;

  TextEditingController get controller => widget.controller;

  ValueChanged<String> get valueChanged => widget.valueChanged;

  ValueChanged<String> get onSubmit => widget.onSubmit;

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
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 2,
      ),
    );
    return TextField(
      controller: _editingController,
      style: Theme.of(context).textTheme.bodyText2,
      autofocus: true,
      maxLength: 11,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        print('onEditingComplete');
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          focusedBorder: border,
          enabledBorder: border,
          hintText: '请输入正确手机号',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white70),
          counterText: '',
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
      onSubmitted: onSubmit,
    );
  }
}
