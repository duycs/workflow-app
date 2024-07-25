import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_update_model.dart';
export 'question_update_model.dart';

class QuestionUpdateWidget extends StatefulWidget {
  const QuestionUpdateWidget({
    super.key,
    required this.item,
  });

  final QuestionObjectStruct? item;

  @override
  State<QuestionUpdateWidget> createState() => _QuestionUpdateWidgetState();
}

class _QuestionUpdateWidgetState extends State<QuestionUpdateWidget> {
  late QuestionUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionUpdateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dataList = RequestQuestionsStruct(
        id: widget!.item?.id,
        content: widget!.item?.content,
        answerType: widget!.item?.answerType,
        autoCorrect: widget!.item?.autoCorrect,
        status: widget!.item?.status,
      );
      setState(() {});
      while (_model.loop! < widget!.item!.answers.length) {
        _model.addToAnswerAdd(QuestionAnswersIdStruct(
          content: (widget!.item?.answers?[_model.loop!])?.answersId?.content,
          correct: (widget!.item?.answers?[_model.loop!])?.answersId?.correct,
          status: (widget!.item?.answers?[_model.loop!])?.answersId?.status,
        ));
        setState(() {});
        _model.loop = _model.loop! + 1;
        setState(() {});
      }
      _model.updateDataListStruct(
        (e) => e..answers = _model.answerAdd.toList(),
      );
      setState(() {});
      _model.isLoad = true;
      setState(() {});
    });

    _model.textQuestionTextController ??=
        TextEditingController(text: widget!.item?.content);
    _model.textQuestionFocusNode ??= FocusNode();

    _model.textAddTextController ??= TextEditingController();
    _model.textAddFocusNode ??= FocusNode();

    _model.textAnswerNumberTextController ??= TextEditingController();
    _model.textAnswerNumberFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
            width: 1.0,
          ),
        ),
        child: Visibility(
          visible: _model.isLoad == true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 28.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Chỉnh sửa câu hỏi',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: TextFormField(
                                controller: _model.textQuestionTextController,
                                focusNode: _model.textQuestionFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textQuestionTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    _model.updateDataListStruct(
                                      (e) => e
                                        ..content = _model
                                            .textQuestionTextController.text,
                                    );
                                    setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nhập câu hỏi...',
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
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
                                validator: _model
                                    .textQuestionTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            if (_model.isLoad == true)
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 28.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= () {
                                        if (_model.dataList?.answerType ==
                                            'radio') {
                                          return '0';
                                        } else if (_model
                                                .dataList?.answerType ==
                                            'checkbox') {
                                          return '1';
                                        } else if (_model
                                                .dataList?.answerType ==
                                            'text') {
                                          return '2';
                                        } else {
                                          return '3';
                                        }
                                      }(),
                                    ),
                                    options:
                                        List<String>.from(['0', '1', '2', '3']),
                                    optionLabels: [
                                      'Trắc nghiệm 1 đáp án',
                                      'Trắc nghiệm 1 hoặc nhiều đáp án',
                                      'Trả lời văn bản ngắn',
                                      'Trả lời số'
                                    ],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.dropDownValue = val);
                                      _model.updateDataListStruct(
                                        (e) => e
                                          ..answerType = () {
                                            if (_model.dropDownValue == '0') {
                                              return 'radio';
                                            } else if (_model.dropDownValue ==
                                                '1') {
                                              return 'checkbox';
                                            } else if (_model.dropDownValue ==
                                                '2') {
                                              return 'text';
                                            } else {
                                              return 'number';
                                            }
                                          }()
                                          ..answers = [],
                                      );
                                      setState(() {});
                                    },
                                    height: 52.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Vui lòng chọn kiểu câu hỏi!',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
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
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.dropDownValue != '3')
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.textAddTextController,
                                      focusNode: _model.textAddFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textAddTextController',
                                        Duration(milliseconds: 500),
                                        () async {
                                          setState(() {
                                            _model.checkboxValue = false;
                                          });
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Thêm đáp án',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Nhập đáp án...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 2,
                                      validator: _model
                                          .textAddTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                if (_model.dropDownValue == '3')
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.textAnswerNumberTextController,
                                      focusNode:
                                          _model.textAnswerNumberFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textAnswerNumberTextController',
                                        Duration(milliseconds: 500),
                                        () async {
                                          setState(() {
                                            _model.checkboxValue = false;
                                          });
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Thêm đáp án',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Nhập đáp án...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 2,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .textAnswerNumberTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.textAddTextController.text !=
                                            null &&
                                        _model.textAddTextController.text !=
                                            '') {
                                      if (_model.dropDownValue == '1') {
                                        _model.updateDataListStruct(
                                          (e) => e
                                            ..updateAnswers(
                                              (e) =>
                                                  e.add(QuestionAnswersIdStruct(
                                                content: _model
                                                    .textAddTextController.text,
                                                correct:
                                                    _model.checkboxValue == true
                                                        ? 1
                                                        : 0,
                                                status: 'published',
                                              )),
                                            ),
                                        );
                                        setState(() {});
                                        setState(() {
                                          _model.textAddTextController?.clear();
                                          _model.textAnswerNumberTextController
                                              ?.clear();
                                        });
                                        setState(() {
                                          _model.checkboxValue = false;
                                        });
                                      } else if (_model.dropDownValue == '0') {
                                        if ((_model.dataList!.answers
                                                    .where(
                                                        (e) => e.correct == 1)
                                                    .toList()
                                                    .length >
                                                0) &&
                                            (_model.checkboxValue == true)) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Kiểu này chỉ có 1 đáp án đúng!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          _model.updateDataListStruct(
                                            (e) => e
                                              ..updateAnswers(
                                                (e) => e.add(
                                                    QuestionAnswersIdStruct(
                                                  content: _model
                                                      .textAddTextController
                                                      .text,
                                                  correct:
                                                      _model.checkboxValue ==
                                                              true
                                                          ? 1
                                                          : 0,
                                                  status: 'published',
                                                )),
                                              ),
                                          );
                                          setState(() {});
                                          setState(() {
                                            _model.textAddTextController
                                                ?.clear();
                                            _model
                                                .textAnswerNumberTextController
                                                ?.clear();
                                          });
                                          setState(() {
                                            _model.checkboxValue = false;
                                          });
                                        }
                                      } else if (_model.dropDownValue == '2') {
                                        setState(() {});
                                        if (_model.dataList!.answers.length >
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Kiểu văn bản chỉ được 1 đáp án!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          _model.updateDataListStruct(
                                            (e) => e
                                              ..updateAnswers(
                                                (e) => e.add(
                                                    QuestionAnswersIdStruct(
                                                  content: _model
                                                      .textAddTextController
                                                      .text,
                                                  correct: 1,
                                                  status: 'published',
                                                )),
                                              ),
                                          );
                                          setState(() {});
                                          setState(() {
                                            _model.textAddTextController
                                                ?.clear();
                                            _model
                                                .textAnswerNumberTextController
                                                ?.clear();
                                          });
                                          setState(() {
                                            _model.checkboxValue = false;
                                          });
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Vui lòng chọn kiểu đáp án!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      if (_model.textAnswerNumberTextController
                                                  .text !=
                                              null &&
                                          _model.textAnswerNumberTextController
                                                  .text !=
                                              '') {
                                        setState(() {});
                                        if (_model.dataList!.answers.length >
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Kiểu số chỉ được 1 đáp án!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          _model.updateDataListStruct(
                                            (e) => e
                                              ..updateAnswers(
                                                (e) => e.add(
                                                    QuestionAnswersIdStruct(
                                                  content: _model
                                                      .textAnswerNumberTextController
                                                      .text,
                                                  correct: 1,
                                                  status: 'published',
                                                )),
                                              ),
                                          );
                                          setState(() {});
                                          setState(() {
                                            _model.textAddTextController
                                                ?.clear();
                                            _model
                                                .textAnswerNumberTextController
                                                ?.clear();
                                          });
                                          setState(() {
                                            _model.checkboxValue = false;
                                          });
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Vui lòng nhập đáp án!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                  text: 'Thêm',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
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
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            if ((_model.dropDownValue != '2') &&
                                (_model.dropDownValue != '3'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.checkboxValue = newValue!);
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    Text(
                                      'Chọn làm đáp án đúng',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Text(
                                '# Danh sách đáp án',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            if (_model.dataList!.answers.length > 0)
                              Builder(
                                builder: (context) {
                                  final listView =
                                      _model.dataList?.answers?.toList() ?? [];

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listView.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 4.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewItem =
                                          listView[listViewIndex];
                                      return Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  listViewItem.content,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: listViewItem
                                                                        .correct ==
                                                                    1
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.updateDataListStruct(
                                                    (e) => e
                                                      ..updateAnswers(
                                                        (e) => e.removeAt(
                                                            listViewIndex),
                                                      ),
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (_model.isLoad == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownStatusValueController ??=
                                          FormFieldController<String>(
                                    _model.dropDownStatusValue ??=
                                        _model.dataList?.status,
                                  ),
                                  options:
                                      List<String>.from(['published', 'draft']),
                                  optionLabels: [
                                    'Hoạt động',
                                    'Không hoạt động'
                                  ],
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.dropDownStatusValue = val);
                                    _model.updateDataListStruct(
                                      (e) => e
                                        ..status = _model.dropDownStatusValue,
                                    );
                                    setState(() {});
                                  },
                                  width: 300.0,
                                  height: 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Trạng thái',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Hủy',
                              options: FFButtonOptions(
                                height: 44.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;

                              setState(() {});
                              _model.tokenReloadQuestionUpdate =
                                  await action_blocks.tokenReload(context);
                              _shouldSetState = true;
                              if (_model.tokenReloadQuestionUpdate!) {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }

                                setState(() {});
                                if (_model.dataList!.answers
                                        .where((e) => e.correct == 1)
                                        .toList()
                                        .length >
                                    0) {
                                  _model.apiResultUpdate = await QuestionGroup
                                      .questionUpdateCall
                                      .call(
                                    accessToken: FFAppState().accessToken,
                                    requestDataJson: _model.dataList?.toMap(),
                                  );

                                  _shouldSetState = true;
                                  if ((_model.apiResultUpdate?.succeeded ??
                                      true)) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Cập nhật thành công!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Cập nhật thất bại!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  context.pushNamed(
                                    'QuestionList',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                            'Vui lòng nhập 1 đáp án đúng!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                setState(() {});
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            text: 'Lưu',
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
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
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
