import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'department_create_model.dart';
export 'department_create_model.dart';

class DepartmentCreateWidget extends StatefulWidget {
  const DepartmentCreateWidget({
    super.key,
    required this.checkCode,
  });

  final List<String>? checkCode;

  @override
  State<DepartmentCreateWidget> createState() => _DepartmentCreateWidgetState();
}

class _DepartmentCreateWidgetState extends State<DepartmentCreateWidget> {
  late DepartmentCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepartmentCreateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getLinkBranchList(context);
      setState(() {});
      await _model.getPrograms(context);
      setState(() {});
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.codeTextController ??= TextEditingController();
    _model.codeFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tạo bộ phận',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.nameTextController,
                            focusNode: _model.nameFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Tên bộ phận',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              alignLabelWithHint: false,
                              hintText: ' ',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 250,
                            validator: _model.nameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.codeTextController,
                            focusNode: _model.codeFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.codeTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                if (widget!.checkCode!
                                        .where((e) =>
                                            e == _model.codeTextController.text)
                                        .toList()
                                        .length >
                                    0) {
                                  _model.checkCode = '1';
                                  setState(() {});
                                } else {
                                  _model.checkCode = '0';
                                  setState(() {});
                                }
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Mã bộ phận',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              alignLabelWithHint: false,
                              hintText: ' ',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _model.checkCode == '1'
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).alternate,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: _model.checkCode == '1'
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).primary,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            maxLength: 50,
                            validator: _model.codeTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        if (_model.checkCode == '1')
                          Text(
                            'Mã bộ phận đã tồn tại!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.descriptionTextController,
                            focusNode: _model.descriptionFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Mô tả',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              alignLabelWithHint: false,
                              hintText: ' ',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 3,
                            maxLength: 250,
                            validator: _model.descriptionTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        if (FFAppState().user.role !=
                            'a8d33527-375b-4599-ac70-6a3fcad1de39')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Chi nhánh',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        if (FFAppState().user.role !=
                            'a8d33527-375b-4599-ac70-6a3fcad1de39')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 1.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownBranchIdValueController ??=
                                      FormFieldController<String>(
                                _model.dropDownBranchIdValue ??= '',
                              ),
                              options: List<String>.from(
                                  _model.branchList.map((e) => e.id).toList()),
                              optionLabels:
                                  _model.branchList.map((e) => e.name).toList(),
                              onChanged: (val) => setState(
                                  () => _model.dropDownBranchIdValue = val),
                              width: double.infinity,
                              height: 56.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Chọn chi nhánh',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 1.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            'Chương trình đào tạo',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 1.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.programsIdValueController ??=
                                FormFieldController<String>(
                              _model.programsIdValue ??= '',
                            ),
                            options: List<String>.from(
                                _model.programsList.map((e) => e.id).toList()),
                            optionLabels:
                                _model.programsList.map((e) => e.name).toList(),
                            onChanged: (val) async {
                              setState(() => _model.programsIdValue = val);
                              _model.addToPrograms(ProgramStruct(
                                programsId: ProgramIdStruct(
                                  id: _model.programsIdValue,
                                  name: _model.programsList
                                      .where(
                                          (e) => e.id == _model.programsIdValue)
                                      .toList()
                                      .first
                                      .name,
                                ),
                              ));
                              setState(() {});
                            },
                            width: double.infinity,
                            height: 56.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Chọn chương trình đào tạo',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 1.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listItems = _model.programs.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listItems.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, listItemsIndex) {
                                  final listItemsItem =
                                      listItems[listItemsIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            formatNumber(
                                              listItemsIndex + 1,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              listItemsItem.programsId.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.delete_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              _model.removeAtIndexFromPrograms(
                                                  listItemsIndex);
                                              setState(() {});
                                            },
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().user.role ==
                        '82073000-1ba2-43a4-a55c-459d17c23b68') {
                      if ((_model.nameTextController.text != null &&
                              _model.nameTextController.text != '') &&
                          (_model.codeTextController.text != null &&
                              _model.codeTextController.text != '') &&
                          (_model.descriptionTextController.text != null &&
                              _model.descriptionTextController.text != '') &&
                          (_model.dropDownBranchIdValue != null &&
                              _model.dropDownBranchIdValue != '')) {
                        if (_model.checkCode != '1') {
                          while (_model.loop < _model.programs.length) {
                            _model.addToProgramIds(
                                ProgaramsCreateDepartmentsStruct(
                              programsId: ProgramIdCreateDepartmentsStruct(
                                id: _model.programs[_model.loop].programsId.id,
                              ),
                            ));
                            _model.loop = _model.loop + 1;
                            setState(() {});
                          }
                          _model.loop = 0;
                          setState(() {});
                          await _model.postDepartment(context);
                          setState(() {});
                        } else {
                          return;
                        }
                      } else {
                        await actions.showToast(
                          context,
                          () {
                            if (_model.nameTextController.text == null ||
                                _model.nameTextController.text == '') {
                              return 'Tên bộ phận đang trống!';
                            } else if (_model.codeTextController.text == null ||
                                _model.codeTextController.text == '') {
                              return 'Mã bộ phận đang trống!';
                            } else if (_model.descriptionTextController.text ==
                                    null ||
                                _model.descriptionTextController.text == '') {
                              return 'Mô tả đang trống!';
                            } else if (_model.dropDownBranchIdValue == null ||
                                _model.dropDownBranchIdValue == '') {
                              return 'Chi nhánh đang trống!';
                            } else {
                              return '';
                            }
                          }(),
                          FlutterFlowTheme.of(context).secondaryBackground,
                          FlutterFlowTheme.of(context).error,
                        );
                        return;
                      }
                    } else {
                      if ((_model.nameTextController.text != null &&
                              _model.nameTextController.text != '') &&
                          (_model.codeTextController.text != null &&
                              _model.codeTextController.text != '') &&
                          (_model.descriptionTextController.text != null &&
                              _model.descriptionTextController.text != '')) {
                        if (_model.checkCode != '1') {
                          while (_model.loop < _model.programs.length) {
                            _model.addToProgramIds(
                                ProgaramsCreateDepartmentsStruct(
                              programsId: ProgramIdCreateDepartmentsStruct(
                                id: _model.programs[_model.loop].programsId.id,
                              ),
                            ));
                            _model.loop = _model.loop + 1;
                            setState(() {});
                          }
                          _model.loop = 0;
                          setState(() {});
                          await _model.postDepartment(context);
                          setState(() {});
                        } else {
                          return;
                        }
                      } else {
                        await actions.showToast(
                          context,
                          () {
                            if (_model.nameTextController.text == null ||
                                _model.nameTextController.text == '') {
                              return 'Tên bộ phận đang trống!';
                            } else if (_model.codeTextController.text == null ||
                                _model.codeTextController.text == '') {
                              return 'Mã bộ phận đang trống!';
                            } else if (_model.descriptionTextController.text ==
                                    null ||
                                _model.descriptionTextController.text == '') {
                              return 'Mô tả đang trống!';
                            } else {
                              return '';
                            }
                          }(),
                          FlutterFlowTheme.of(context).secondaryBackground,
                          FlutterFlowTheme.of(context).error,
                        );
                        return;
                      }
                    }
                  },
                  text: 'Lưu',
                  icon: Icon(
                    Icons.save_outlined,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF33BA45),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
