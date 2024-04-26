import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'study_program_edit_model.dart';
export 'study_program_edit_model.dart';

class StudyProgramEditWidget extends StatefulWidget {
  const StudyProgramEditWidget({
    super.key,
    required this.dataDetail,
    required this.callBackList1,
  });

  final StudyProgramListStruct? dataDetail;
  final Future Function()? callBackList1;

  @override
  State<StudyProgramEditWidget> createState() => _StudyProgramEditWidgetState();
}

class _StudyProgramEditWidgetState extends State<StudyProgramEditWidget> {
  late StudyProgramEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyProgramEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.requestData = widget.dataDetail;
      });
    });

    _model.programNameTextController ??= TextEditingController(
        text: widget.dataDetail?.name != null && widget.dataDetail?.name != ''
            ? widget.dataDetail?.name
            : ' ');
    _model.programNameFocusNode ??= FocusNode();

    _model.programDescriptionTextController ??= TextEditingController(
        text: widget.dataDetail?.description != null &&
                widget.dataDetail?.description != ''
            ? widget.dataDetail?.description
            : ' ');
    _model.programDescriptionFocusNode ??= FocusNode();
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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 650.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 28.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chỉnh sửa chương trình',
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Nunito Sans',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.cancel,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'StudyProgramList',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.programNameTextController,
                              focusNode: _model.programNameFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.programNameTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.updateRequestDataStruct(
                                      (e) => e
                                        ..name = _model
                                            .programNameTextController.text,
                                    );
                                  });
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Tên chương trình',
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
                              validator: _model
                                  .programNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: TextFormField(
                              controller:
                                  _model.programDescriptionTextController,
                              focusNode: _model.programDescriptionFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.programDescriptionTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  setState(() {
                                    _model.updateRequestDataStruct(
                                      (e) => e
                                        ..description = _model
                                            .programDescriptionTextController
                                            .text,
                                    );
                                  });
                                },
                              ),
                              autofocus: false,
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
                              validator: _model
                                  .programDescriptionTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.testsDropdownModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: TestsDropdownWidget(
                              value: widget.dataDetail!.tests.isNotEmpty
                                  ? widget.dataDetail?.tests.first.testsId.id
                                  : ' ',
                              testCallBack: (testId) async {
                                setState(() {
                                  _model.updateRequestDataStruct(
                                    (e) => e..tests = [],
                                  );
                                });
                                setState(() {
                                  _model.updateRequestDataStruct(
                                    (e) => e
                                      ..updateTests(
                                        (e) =>
                                            e.add(StudyProgramListTestIdStruct(
                                          testsId: StaffsTestsListStruct(
                                            id: testId?.id,
                                            status: testId?.status,
                                            name: testId?.name,
                                          ),
                                        )),
                                      ),
                                  );
                                });
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.lessionsDropdownModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: LessionsDropdownWidget(
                              lessionsCallBack: (lessionsId) async {
                                _model.updateLessionItem = await _model.addList(
                                  context,
                                  lessionsItem: lessionsId,
                                );
                                if (_model.updateLessionItem == true) {
                                  setState(() {});
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Bài học đã có!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                            ),
                          ),
                          Text(
                            'Danh sách bài học :',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          if (_model.requestData!.lessions.isNotEmpty)
                            Builder(
                              builder: (context) {
                                final listView =
                                    _model.requestData?.lessions.toList() ??
                                        [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listView.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewItem =
                                        listView[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    '#${(listViewIndex + 1).toString()} :',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  listViewItem.lessionsId.name
                                                      .maybeHandleOverflow(
                                                    maxChars: 32,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
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
                                                setState(() {
                                                  _model
                                                      .updateRequestDataStruct(
                                                    (e) => e
                                                      ..updateLessions(
                                                        (e) => e.removeAt(
                                                            listViewIndex),
                                                      ),
                                                  );
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.tokenStudyProgramEdit =
                            await action_blocks.tokenReload(context);
                        shouldSetState = true;
                        if (_model.tokenStudyProgramEdit!) {
                          setState(() {});
                          _model.apiResultuus = await StudyProgramGroup
                              .studyProgramLessionsUpdateCall
                              .call(
                            accessToken: FFAppState().accessToken,
                            id: widget.dataDetail?.id,
                            requestDataJson: _model.requestData?.toMap(),
                          );
                          shouldSetState = true;
                          if ((_model.apiResultuus?.succeeded ?? true)) {
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
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Lỗi chỉnh sửa chương trình!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }

                          _model.apiResultSynchronizedStaffLesson =
                              await StudyProgramGroup
                                  .synchronizedStaffLessonCall
                                  .call(
                            accessToken: FFAppState().accessToken,
                            programId: widget.dataDetail?.id,
                          );
                          shouldSetState = true;
                          if ((_model.apiResultSynchronizedStaffLesson
                                  ?.succeeded ??
                              true)) {
                            await widget.callBackList1?.call();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Lỗi đồng bộ bài học cho nhân viên!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        } else {
                          setState(() {});
                          if (shouldSetState) setState(() {});
                          return;
                        }

                        if (shouldSetState) setState(() {});
                      },
                      text: 'Lưu',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito Sans',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
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
      ),
    );
  }
}
