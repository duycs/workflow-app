import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/rich_text_editor/mobile_editor_component/mobile_editor_component_widget.dart';
import '/rich_text_editor/mobile_editor_display_component/mobile_editor_display_component_widget.dart';
import '/training/lesson/quiz_creation_lesson/quiz_creation_lesson_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'created_lession_study_model.dart';
export 'created_lession_study_model.dart';

class CreatedLessionStudyWidget extends StatefulWidget {
  const CreatedLessionStudyWidget({
    super.key,
    this.callBack,
  });

  final Future Function(LessonsStruct? dataLession)? callBack;

  @override
  State<CreatedLessionStudyWidget> createState() =>
      _CreatedLessionStudyWidgetState();
}

class _CreatedLessionStudyWidgetState extends State<CreatedLessionStudyWidget> {
  late CreatedLessionStudyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatedLessionStudyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getListTest(context);
      setState(() {});
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.durationHoursTextController ??= TextEditingController();
    _model.durationHoursFocusNode ??= FocusNode();

    _model.estimateInDayTextController ??= TextEditingController();
    _model.estimateInDayFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SafeArea(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tạo mới bài học',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
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
                                labelText: 'Tiêu đề',
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                              validator: _model.nameTextControllerValidator
                                  .asValidator(context),
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
                                      fontSize: 16.0,
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                              maxLength: 100,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              validator: _model
                                  .descriptionTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Bài thi',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.testIdValueController ??=
                                        FormFieldController<String>(
                                      _model.testIdValue ??= _model.testId,
                                    ),
                                    options: List<String>.from(_model.dataTest
                                        .map((e) => e.id)
                                        .toList()),
                                    optionLabels: _model.dataTest
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.testIdValue = val),
                                    width: 300.0,
                                    height: 50.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Danh sách bài thi',
                                    searchHintText: '',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 0.5,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: QuizCreationLessonWidget(
                                          callBack: (testId) async {
                                            _model.addToDataTest(testId!);
                                            setState(() {});
                                            setState(() {
                                              _model.testIdValueController
                                                  ?.reset();
                                            });
                                            setState(() {
                                              _model.testIdValueController
                                                  ?.value = testId!.id;
                                            });
                                            _model.testId = testId!.id;
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Bài thi',
                                icon: Icon(
                                  Icons.add,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Thời gian: ',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.durationHoursTextController,
                                      focusNode: _model.durationHoursFocusNode,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .durationHoursTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'phút',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                          if (_model.checkValiTime == true)
                            Text(
                              'Yêu cầu nhập thời gian',
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Thời hạn học bài',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '(không bắt buộc): ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.estimateInDayTextController,
                                      focusNode: _model.estimateInDayFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.estimateInDayTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          _model.checkDay = int.tryParse(_model
                                              .estimateInDayTextController
                                              .text);
                                          setState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .estimateInDayTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'ngày',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                          if (((_model.estimateInDayTextController.text !=
                                          null &&
                                      _model.estimateInDayTextController.text !=
                                          '') &&
                                  (int.parse(_model
                                          .estimateInDayTextController.text) <
                                      1)) &&
                              ((_model.checkDay != null) &&
                                  ((_model.checkDay!) < 1)))
                            Text(
                              'Thời hạn học bài phải lớn hơn 0',
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (_model.uploadedLocalFile1 != null &&
                                          (_model.uploadedLocalFile1.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.memory(
                                              _model.uploadedLocalFile1.bytes ??
                                                  Uint8List.fromList([]),
                                              width: 200.0,
                                              height: 110.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile1 == null ||
                                          (_model.uploadedLocalFile1.bytes
                                                  ?.isEmpty ??
                                              true))
                                        Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Chưa có dữ liệu!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        imageQuality: 100,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading1 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading1 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile1 =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      _model.image = _model.image;
                                      setState(() {});
                                    },
                                    text: 'Ảnh',
                                    icon: Icon(
                                      Icons.add,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
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
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          if (_model.checkValidateImage == true)
                            Text(
                              'Vui lòng upload ảnh',
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ('1' == '2')
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.memory(
                                              _model.uploadedLocalFile2.bytes ??
                                                  Uint8List.fromList([]),
                                              width: 200.0,
                                              height: 110.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (_model.uploadedLocalFile2 == null ||
                                            (_model.uploadedLocalFile2.bytes
                                                    ?.isEmpty ??
                                                true))
                                          Container(
                                            width: 200.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Chưa có dữ liệu!',
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
                                        if (_model.uploadedLocalFile2 != null &&
                                            (_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false))
                                          Container(
                                            width: 200.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Tải Video thành công!',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final selectedMedia = await selectMedia(
                                        isVideo: true,
                                        mediaSource: MediaSource.videoGallery,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading2 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading2 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile2 =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      _model.video = _model.video;
                                      setState(() {});
                                    },
                                    text: ' Video',
                                    icon: Icon(
                                      Icons.add,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          26.0, 0.0, 26.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
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
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (_model.uploadedLocalFile3 == null ||
                                          (_model.uploadedLocalFile3.bytes
                                                  ?.isEmpty ??
                                              true))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Visibility(
                                              visible: '1' == '2',
                                              child: FlutterFlowPdfViewer(
                                                fileBytes: _model
                                                    .uploadedLocalFile3.bytes,
                                                width: 200.0,
                                                height: 110.0,
                                                horizontalScroll: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile3 == null ||
                                          (_model.uploadedLocalFile3.bytes
                                                  ?.isEmpty ??
                                              true))
                                        Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Chưa có dữ liệu!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      if (_model.uploadedLocalFile3 != null &&
                                          (_model.uploadedLocalFile3.bytes
                                                  ?.isNotEmpty ??
                                              false))
                                        Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Tải file thành công!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final selectedFiles = await selectFiles(
                                        multiFile: false,
                                      );
                                      if (selectedFiles != null) {
                                        setState(() =>
                                            _model.isDataUploading3 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedFiles
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                  ))
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading3 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedFiles.length) {
                                          setState(() {
                                            _model.uploadedLocalFile3 =
                                                selectedUploadedFiles.first;
                                          });
                                          showUploadMessage(
                                            context,
                                            'Success!',
                                          );
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                            context,
                                            'Failed to upload file',
                                          );
                                          return;
                                        }
                                      }

                                      _model.file = _model.file;
                                      setState(() {});
                                    },
                                    text: 'File',
                                    icon: Icon(
                                      Icons.add,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          26.0, 0.0, 26.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
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
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Nội dung',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).noColor,
                              borderRadius: BorderRadius.circular(0.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).noColor,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: MobileEditorComponentWidget(
                                            content: _model.content,
                                            setContentCallback:
                                                (editorContent) async {
                                              _model.content = editorContent;
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 180.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .noColor,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .noColor,
                                          icon: Icon(
                                            Icons.edit_note_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        if (_model.content == null)
                                          Text(
                                            'Nhập nội dung',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        if (_model.content != null)
                                          Text(
                                            'Chỉnh sửa nội dung',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_model.checkValiContent == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Vui lòng nhập nội dung',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (_model.content != null)
                            wrapWithModel(
                              model: _model.mobileEditorDisplayComponentModel,
                              updateCallback: () => setState(() {}),
                              child: MobileEditorDisplayComponentWidget(
                                content: _model.content!.toString(),
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
                      var _shouldSetState = false;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if ((_model.content != null) &&
                          (_model.durationHoursTextController.text != null &&
                              _model.durationHoursTextController.text != '')) {
                        _model.checkValiContent = false;
                        _model.checkValiTime = false;
                        setState(() {});
                        if (_model.uploadedLocalFile1 != null &&
                            (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                false)) {
                          await _model.getUploadImage(context);
                          setState(() {});
                          _model.checkValidateImage = false;
                          setState(() {});
                        } else {
                          _model.checkValidateImage = true;
                          setState(() {});
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_model.uploadedLocalFile2 != null &&
                            (_model.uploadedLocalFile2.bytes?.isNotEmpty ??
                                false)) {
                          await _model.getDataUploadVideo(context);
                          setState(() {});
                        }
                        if (_model.uploadedLocalFile3 != null &&
                            (_model.uploadedLocalFile3.bytes?.isNotEmpty ??
                                false)) {
                          await _model.getDataUploadFile(context);
                          setState(() {});
                        }
                        if (_model.estimateInDayTextController.text != null &&
                            _model.estimateInDayTextController.text != '') {
                          if (int.parse(
                                  _model.estimateInDayTextController.text) >
                              0) {
                            _model.checkReloadTokenCreatedLession2 =
                                await action_blocks.tokenReload(context);
                            _shouldSetState = true;
                            if (_model.checkReloadTokenCreatedLession2!) {
                              _model.apiResultCreatedLession2 =
                                  await LessonGroup.postLessonCall.call(
                                accessToken: FFAppState().accessToken,
                                requestDataJson: <String, dynamic>{
                                  'status': 'published',
                                  'name': _model.nameTextController.text,
                                  'description':
                                      _model.descriptionTextController.text,
                                  'content': _model.content,
                                  'image_cover':
                                      _model.image != null && _model.image != ''
                                          ? _model.image
                                          : null,
                                  'video':
                                      _model.video != null && _model.video != ''
                                          ? _model.video
                                          : null,
                                  'duration_hours':
                                      _model.durationHoursTextController.text,
                                  'test_id': _model.testIdValue != null &&
                                          _model.testIdValue != ''
                                      ? _model.testIdValue
                                      : null,
                                  'file':
                                      _model.file != null && _model.file != ''
                                          ? _model.file
                                          : null,
                                  'estimate_in_day': _model
                                                  .estimateInDayTextController
                                                  .text !=
                                              null &&
                                          _model.estimateInDayTextController
                                                  .text !=
                                              ''
                                      ? _model.estimateInDayTextController.text
                                      : '',
                                },
                              );

                              _shouldSetState = true;
                              if ((_model.apiResultCreatedLession2?.succeeded ??
                                  true)) {
                                _model.dataListLession =
                                    LessonsStruct.maybeFromMap(getJsonField(
                                  (_model.apiResultCreatedLession2?.jsonBody ??
                                      ''),
                                  r'''$.data''',
                                ));
                                setState(() {});
                                await widget.callBack?.call(
                                  _model.dataListLession,
                                );
                                await actions.showToast(
                                  context,
                                  'Tạo mới thành công',
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  FlutterFlowTheme.of(context).secondary,
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              FFAppState().update(() {});
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          }
                        } else {
                          _model.checkReloadTokenCreatedLession1 =
                              await action_blocks.tokenReload(context);
                          _shouldSetState = true;
                          if (_model.checkReloadTokenCreatedLession1!) {
                            _model.apiResultCreatedLession1 =
                                await LessonGroup.postLessonCall.call(
                              accessToken: FFAppState().accessToken,
                              requestDataJson: <String, dynamic>{
                                'status': 'published',
                                'name': _model.nameTextController.text,
                                'description':
                                    _model.descriptionTextController.text,
                                'content': _model.content,
                                'image_cover':
                                    _model.image != null && _model.image != ''
                                        ? _model.image
                                        : null,
                                'video':
                                    _model.video != null && _model.video != ''
                                        ? _model.video
                                        : null,
                                'duration_hours':
                                    _model.durationHoursTextController.text,
                                'test_id': _model.testIdValue != null &&
                                        _model.testIdValue != ''
                                    ? _model.testIdValue
                                    : null,
                                'file': _model.file != null && _model.file != ''
                                    ? _model.file
                                    : null,
                                'estimate_in_day': _model
                                                .estimateInDayTextController
                                                .text !=
                                            null &&
                                        _model.estimateInDayTextController
                                                .text !=
                                            ''
                                    ? _model.estimateInDayTextController.text
                                    : null,
                              },
                            );

                            _shouldSetState = true;
                            if ((_model.apiResultCreatedLession1?.succeeded ??
                                true)) {
                              _model.dataListLession =
                                  LessonsStruct.maybeFromMap(getJsonField(
                                (_model.apiResultCreatedLession1?.jsonBody ??
                                    ''),
                                r'''$.data''',
                              ));
                              setState(() {});
                              await widget.callBack?.call(
                                _model.dataListLession,
                              );
                              await actions.showToast(
                                context,
                                'Tạo mới thành công',
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                FlutterFlowTheme.of(context).secondary,
                              );
                              Navigator.pop(context);
                            }
                          } else {
                            FFAppState().update(() {});
                            if (_shouldSetState) setState(() {});
                            return;
                          }
                        }
                      } else {
                        _model.checkValiContent = true;
                        _model.checkValiTime = true;
                        setState(() {});
                        if (_shouldSetState) setState(() {});
                        return;
                      }

                      if (_shouldSetState) setState(() {});
                    },
                    text: 'Lưu',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF33BA45),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito Sans',
                                color: Colors.white,
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
      ),
    );
  }
}
