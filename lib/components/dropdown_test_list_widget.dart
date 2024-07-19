import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_test_list_model.dart';
export 'dropdown_test_list_model.dart';

class DropdownTestListWidget extends StatefulWidget {
  const DropdownTestListWidget({super.key});

  @override
  State<DropdownTestListWidget> createState() => _DropdownTestListWidgetState();
}

class _DropdownTestListWidgetState extends State<DropdownTestListWidget> {
  late DropdownTestListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownTestListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
