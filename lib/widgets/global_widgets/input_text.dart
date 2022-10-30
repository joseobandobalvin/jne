import 'package:jne/configs/themes/app_light_theme.dart';
import 'package:jne/widgets/global_widgets/custom_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final Widget? prefixIcon;
  final String? Function(String)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;

  const InputText({
    super.key,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
  });

  @override
  State<InputText> createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String? _errorText = "";
  late bool _obscureText;
  CustomFormState? _formState;
  String? get errorText => _errorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.obscureText;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _formState = CustomForm.of(context);
      _formState?.register(this);
    });
  }

  @override
  void deactivate() {
    _formState?.remove(this);
    super.deactivate();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator!(text);
      setState(() {});
    }
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  void _onVisibleChanged() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      obscureText: _obscureText,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        suffixIcon: widget.obscureText
            ? CupertinoButton(
                minSize: 25,
                padding: const EdgeInsets.all(10),
                onPressed: _onVisibleChanged,
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : Icon(
                Icons.check_circle,
                color: _errorText == null ? primaryColorLight : Colors.grey,
              ),
      ),
    );
  }
}
