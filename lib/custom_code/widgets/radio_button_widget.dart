// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/form_field_controller.dart';
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!/*

class FlutterFlowRadioButton extends StatefulWidget {
  const FlutterFlowRadioButton({
    super.key,
    required this.options,
    required this.onChanged,
    required this.controller,
    required this.optionHeight,
    required this.textStyle,
    this.optionWidth,
    this.selectedTextStyle,
    this.textPadding = EdgeInsets.zero,
    this.buttonPosition = RadioButtonPosition.left,
    this.direction = Axis.vertical,
    required this.radioButtonColor,
    this.inactiveRadioButtonColor,
    this.toggleable = false,
    this.horizontalAlignment = WrapAlignment.start,
    this.verticalAlignment = WrapCrossAlignment.start,
  });

  final List<String> options;
  final Function(String?)? onChanged;
  final FormFieldController<String> controller;
  final double optionHeight;
  final double? optionWidth;
  final TextStyle textStyle;
  final TextStyle? selectedTextStyle;
  final EdgeInsetsGeometry textPadding;
  final RadioButtonPosition buttonPosition;
  final Axis direction;
  final Color radioButtonColor;
  final Color? inactiveRadioButtonColor;
  final bool toggleable;
  final WrapAlignment horizontalAlignment;
  final WrapCrossAlignment verticalAlignment;

  @override
  State<FlutterFlowRadioButton> createState() => _FlutterFlowRadioButtonState();
}

class _FlutterFlowRadioButtonState extends State<FlutterFlowRadioButton> {
  bool get enabled => widget.onChanged != null;

  FormFieldController<String> get controller => widget.controller;
  void Function()? _listener;

  @override
  void initState() {
    super.initState();
    _maybeSetOnChangedListener();
  }

  @override
  void dispose() {
    _maybeRemoveOnChangedListener();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlutterFlowRadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldWidgetEnabled = oldWidget.onChanged != null;
    if (oldWidgetEnabled != enabled) {
      _maybeRemoveOnChangedListener();
      _maybeSetOnChangedListener();
    }
  }

  void _maybeSetOnChangedListener() {
    if (enabled) {
      _listener = () => widget.onChanged!(controller.value);
      controller.addListener(_listener!);
    }
  }

  void _maybeRemoveOnChangedListener() {
    if (_listener != null) {
      controller.removeListener(_listener!);
      _listener = null;
    }
  }

  List<String> get effectiveOptions =>
      widget.options.isEmpty ? ['[Option]'] : widget.options;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(unselectedWidgetColor: widget.inactiveRadioButtonColor),
      child: RadioGroup<String>.builder(
        direction: widget.direction,
        groupValue: controller.value,
        onChanged: enabled ? (value) => controller.value = value : null,
        activeColor: widget.radioButtonColor,
        toggleable: widget.toggleable,
        textStyle: widget.textStyle,
        selectedTextStyle: widget.selectedTextStyle ?? widget.textStyle,
        textPadding: widget.textPadding,
        optionHeight: widget.optionHeight,
        optionWidth: widget.optionWidth,
        horizontalAlignment: widget.horizontalAlignment,
        verticalAlignment: widget.verticalAlignment,
        item: effectiveOptions,
        itemBuilder: (item) =>
            RadioButtonBuilder(item, buttonPosition: widget.buttonPosition),
      ),
    );
  }
}

enum RadioButtonPosition {
  right,
  left,
}

class RadioButtonBuilder<T> {
  RadioButtonBuilder(
    this.description, {
    this.buttonPosition = RadioButtonPosition.left,
  });

  final String description;
  final RadioButtonPosition buttonPosition;
}

class RadioButton<T> extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.description,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.buttonPosition,
    required this.activeColor,
    required this.toggleable,
    required this.textStyle,
    required this.selectedTextStyle,
    required this.textPadding,
    this.shouldFlex = false,
  });

  final String description;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final RadioButtonPosition buttonPosition;
  final Color activeColor;
  final bool toggleable;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final EdgeInsetsGeometry textPadding;
  final bool shouldFlex;

  @override
  Widget build(BuildContext context) {
    final selectedStyle = selectedTextStyle;
    final isSelected = value == groupValue;
    Widget radioButtonText = Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Text(
        description,
        style: isSelected ? selectedStyle : textStyle,
        overflow: TextOverflow.visible,
      ),
    );

    radioButtonText = Flexible(child: radioButtonText);

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (buttonPosition == RadioButtonPosition.right) radioButtonText,
          Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: CompactRadioButton<T>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: activeColor,
                // Pass your active color
                inactiveColor: activeColor,
                size: 20,
              )),
          if (buttonPosition == RadioButtonPosition.left) radioButtonText,
        ],
      ),
    );
  }
}

class RadioGroup<T> extends StatelessWidget {
  const RadioGroup.builder({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.item,
    required this.itemBuilder,
    required this.direction,
    required this.optionHeight,
    required this.horizontalAlignment,
    required this.activeColor,
    required this.toggleable,
    required this.textStyle,
    required this.selectedTextStyle,
    required this.textPadding,
    this.optionWidth,
    this.verticalAlignment = WrapCrossAlignment.center,
  });

  final T? groupValue;
  final List<T> item;
  final RadioButtonBuilder Function(T value) itemBuilder;
  final void Function(T?)? onChanged;
  final Axis direction;
  final double optionHeight;
  final double? optionWidth;
  final WrapAlignment horizontalAlignment;
  final WrapCrossAlignment verticalAlignment;
  final Color activeColor;
  final bool toggleable;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final EdgeInsetsGeometry textPadding;

  List<Widget> get _group => item.map(
        (item) {
          final radioButtonBuilder = itemBuilder(item);
          return Padding(
            padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
            child: RadioButton(
              description: radioButtonBuilder.description,
              value: item,
              groupValue: groupValue,
              onChanged: onChanged,
              buttonPosition: radioButtonBuilder.buttonPosition,
              activeColor: activeColor,
              toggleable: toggleable,
              textStyle: textStyle,
              selectedTextStyle: selectedTextStyle,
              textPadding: textPadding,
              shouldFlex: optionWidth != null,
            ),
          );
        },
      ).toList();

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: WrapAlignment.start,
        // Align wrapped items to the start
        crossAxisAlignment: WrapCrossAlignment.start,
        // Align items to the start of the cross axis
        direction: Axis.horizontal,
        // or Axis.vertical depending on your layout
        children: _group,
      );
}

class CompactRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double size;

  const CompactRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.size = 16, // Adjust the size to fit your design
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged!(value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? activeColor : inactiveColor,
            width: 2,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: size / 2, // Half the size of outer circle
                  height: size / 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
