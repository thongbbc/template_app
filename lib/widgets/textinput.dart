import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:templateapp/utils/constant.dart';

class TextInput extends StatefulWidget {
  String title;
  String valueInput;
  TextInputType keyboardType;
  TextStyle textStyle;
  TextStyle titleTextStyle;
  bool enable;
  ValueChanged<String> onFieldSubmitted;
  TextInputAction textInputAction;
  String errorText;
  Function(String) validator;
  Function(String) onSaved;
  FocusNode focusNode;
  ValueChanged<String> onChanged;
  IconData icon;
  String hintText;
  TextEditingController controller;
  TextInput({
    this.title,
    this.valueInput,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.titleTextStyle,
    this.textStyle,
    this.onSaved,
    this.icon,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.focusNode,
    this.enable,
    this.controller,
    this.errorText,
    this.textInputAction,
  }) {
    keyboardType = keyboardType ?? TextInputType.text;
    titleTextStyle = titleTextStyle ?? const FontStyle().semiBold();
    textStyle = textStyle ?? const FontStyle().semiBold();
    valueInput = valueInput ?? "";
    enable = enable ?? true;
    validator = validator ??
        (text) {
          return null;
        };
    controller = controller ?? TextEditingController();
  }
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    final inputFormatters = <TextInputFormatter>[];
    final keyboardType = (widget.keyboardType != null)
        ? widget.keyboardType
        : TextInputType.text;
    if (widget.keyboardType == TextInputType.number) {
      inputFormatters.add(WhitelistingTextInputFormatter.digitsOnly);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: Colors.white,
                    )
                  : Container(),
              SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  textInputAction:
                      widget.textInputAction ?? TextInputAction.done,
                  enabled: widget.enable,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: widget.validator,
                  focusNode: widget.focusNode,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onSaved: widget.onSaved,
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardType,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: widget.hintText ?? "",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white54),
                    labelStyle: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.errorText != null && widget.errorText.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  widget.errorText,
                  style: TextStyle(color: Colors.red[400]),
                ),
              )
            : Container()
      ],
    );
  }
}
