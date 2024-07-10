import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lessions_dropdown_widget.dart';
import '/components/tests_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/training/study_program/created_lession_study/created_lession_study_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'study_program_edit_model.dart';
export 'study_program_edit_model.dart';

class StudyProgramEditWidget extends StatefulWidget {
  const StudyProgramEditWidget({
    super.key,
    this.dataDetail,
    this.callBackList1,
    this.itemLessions,
    this.itemPrograms,
    this.itemLession,
  });

  final StudyProgramListStruct? dataDetail;
  final Future Function()? callBackList1;
  final StudyProgramListStruct? itemLessions;
  final dynamic itemPrograms;
  final LessonsStruct? itemLession;

  @override
  State<StudyProgramEditWidget> createState() => _StudyProgramEditWidgetState();
}

class _StudyProgramEditWidgetState extends State<StudyProgramEditWidget>
    with TickerProviderStateMixin {
  late StudyProgramEditModel _model;

  final animationsMap = <String, AnimationInfo>{};

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
      _model.updateRequestDataStruct(
        (e) => e
          ..status = widget.dataDetail?.status
          ..name = widget.dataDetail?.name
          ..description = widget.dataDetail?.description
          ..durationHours = widget.dataDetail?.durationHours
          ..lessions = widget.dataDetail!.lessions.toList()
          ..tests = widget.dataDetail!.tests.toList()
          ..estimateInDay = widget.dataDetail?.estimateInDay
          ..imageCover = widget.dataDetail?.imageCover,
      );
      setState(() {});
    });

    _model.programNameTextController ??= TextEditingController(
        text: widget.dataDetail?.name != null && widget.dataDetail?.name != ''
            ? widget.dataDetail?.name
            : '');
    _model.programNameFocusNode ??= FocusNode();

    _model.programDescriptionTextController ??= TextEditingController(
        text: widget.dataDetail?.description != null &&
                widget.dataDetail?.description != ''
            ? widget.dataDetail?.description
            : '');
    _model.programDescriptionFocusNode ??= FocusNode();

    _model.estimateInDayTextController ??= TextEditingController(
        text: (widget.dataDetail?.estimateInDay != null) &&
                (widget.dataDetail!.estimateInDay > 0)
            ? widget.dataDetail?.estimateInDay.toString()
            : '');
    _model.estimateInDayFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 16.0, 0.0),
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
                                  Icons.close_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await widget.callBackList1?.call();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 90.0,
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          if ((_model.uploadedLocalFile.bytes
                                                      ?.isNotEmpty ??
                                                  false))
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.memory(
                                                _model.uploadedLocalFile
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (((_model.uploadedLocalFile
                                                          .bytes?.isEmpty ??
                                                      true)) &&
                                              (widget.dataDetail?.imageCover !=
                                                      null &&
                                                  widget.dataDetail
                                                          ?.imageCover !=
                                                      ''))
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                '${FFAppConstants.ApiBaseUrl}/assets/${widget.dataDetail?.imageCover}?access_token=${FFAppState().accessToken}',
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        _model.uploadImageEdit =
                                            _model.uploadImageEdit;
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
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
                                      _model.updateRequestDataStruct(
                                        (e) => e
                                          ..name = _model
                                              .programNameTextController.text,
                                      );
                                      setState(() {});
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                      _model.updateRequestDataStruct(
                                        (e) => e
                                          ..description = _model
                                              .programDescriptionTextController
                                              .text,
                                      );
                                      setState(() {});
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                              if ('1' == '2')
                                wrapWithModel(
                                  model: _model.testsDropdownModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: TestsDropdownWidget(
                                    value: widget.dataDetail!.tests.isNotEmpty
                                        ? widget.dataDetail?.tests.first
                                            .testsId.id
                                        : ' ',
                                    testCallBack: (testId) async {
                                      _model.updateRequestDataStruct(
                                        (e) => e..tests = [],
                                      );
                                      setState(() {});
                                      _model.updateRequestDataStruct(
                                        (e) => e
                                          ..updateTests(
                                            (e) => e.add(
                                                StudyProgramListTestIdStruct(
                                              testsId: StaffsTestsListStruct(
                                                id: testId?.id,
                                                status: testId?.status,
                                                name: testId?.name,
                                              ),
                                            )),
                                          ),
                                      );
                                      setState(() {});
                                    },
                                  ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Thời hạn học ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            const TextSpan(
                                              text: '(Không bắt buộc)',
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      if (((_model.estimateInDayTextController
                                                          .text !=
                                                      '') &&
                                              (int.parse(_model
                                                      .estimateInDayTextController
                                                      .text) <
                                                  1)) &&
                                          ((_model.check != null) &&
                                              (_model.check! < 1)))
                                        Text(
                                          'Thời hạn chương trình phải lớn hơn 0',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: SizedBox(
                                        width: 50.0,
                                        child: TextFormField(
                                          controller: _model
                                              .estimateInDayTextController,
                                          focusNode:
                                              _model.estimateInDayFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.estimateInDayTextController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              _model.updateRequestDataStruct(
                                                (e) => e
                                                  ..estimateInDay = (_model
                                                                      .estimateInDayTextController
                                                                      .text !=
                                                                  '') &&
                                                          (int.parse(_model
                                                                  .estimateInDayTextController
                                                                  .text) >
                                                              0)
                                                      ? functions.stringToInt(_model
                                                          .estimateInDayTextController
                                                          .text)
                                                      : _model.es,
                                              );
                                              setState(() {});
                                              _model.check = int.tryParse(_model
                                                  .estimateInDayTextController
                                                  .text);
                                              setState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
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
                                  ),
                                  Text(
                                    'ngày',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.lessionsDropdownModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: LessionsDropdownWidget(
                                        lessionsCallBack: (lessionsId) async {
                                          _model.updateLessionItem =
                                              await _model.addList(
                                            context,
                                            lessionsItem: lessionsId,
                                          );
                                          if (_model.updateLessionItem ==
                                              true) {
                                            setState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('Bài học đã có!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
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
                                  ),
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: CreatedLessionStudyWidget(
                                                callBack: (dataLession) async {
                                                  await _model.addLession(
                                                    context,
                                                    itemLession: dataLession,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: 'Bài học',
                                      icon: const Icon(
                                        Icons.add,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              Text(
                                'Danh sách bài học :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              if (_model.requestData!.lessions.isNotEmpty)
                                Builder(
                                  builder: (context) {
                                    final listView = _model
                                            .requestData?.lessions
                                            .toList() ??
                                        [];

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listView.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewItem =
                                            listView[listViewIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        '#${(listViewIndex + 1).toString()} :',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      listViewItem
                                                          .lessionsId.name
                                                          .maybeHandleOverflow(
                                                        maxChars: 32,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model
                                                        .updateRequestDataStruct(
                                                      (e) => e
                                                        ..updateLessions(
                                                          (e) => e.removeAt(
                                                              listViewIndex),
                                                        ),
                                                    );
                                                    setState(() {});
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.power_settings_new_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: SwitchListTile.adaptive(
                                      value: _model.switchListTileValue ??=
                                          widget.dataDetail?.status ==
                                                  'published'
                                              ? true
                                              : false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .switchListTileValue = newValue);
                                        if (newValue) {
                                          _model.updateRequestDataStruct(
                                            (e) => e
                                              ..status =
                                                  _model.switchListTileValue ==
                                                          true
                                                      ? 'published'
                                                      : 'draft',
                                          );
                                          setState(() {});
                                        } else {
                                          _model.updateRequestDataStruct(
                                            (e) => e..status = 'draft',
                                          );
                                          setState(() {});
                                        }
                                      },
                                      title: Text(
                                        'Trạng thái hoạt động',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 4.0, 0.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var shouldSetState = false;
                      if ((_model.uploadedLocalFile.bytes?.isNotEmpty ??
                              false)) {
                        await _model.uploadImage(context);
                        setState(() {});
                      }
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      _model.tokenStudyProgramEdit =
                          await action_blocks.tokenReload(context);
                      shouldSetState = true;
                      if (_model.tokenStudyProgramEdit!) {
                        setState(() {});
                        if ((_model.estimateInDayTextController.text !=
                                    '') &&
                            (_model.estimateInDayTextController.text !=
                                'null') &&
                            (_model.estimateInDayTextController.text != '0') &&
                            (_model.requestData?.imageCover != null &&
                                _model.requestData?.imageCover != '')) {
                          if (int.parse(
                                  _model.estimateInDayTextController.text) >
                              0) {
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Thời hạn chương trình phải lớn hơn 0!',
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
                          _model.apiResultuus111 = await StudyProgramGroup
                              .studyProgramLessionsUpdateCall
                              .call(
                            accessToken: FFAppState().accessToken,
                            id: widget.dataDetail?.id,
                            requestDataJson: <String, dynamic>{
                              'name': _model.requestData?.name,
                              'description': _model.requestData?.description,
                              'image_cover': null,
                              'estimate_in_day': null,
                              'lessions': getJsonField(
                                <String, List<dynamic>>{
                                  'map': _model.requestData!.lessions
                                      .map((e) => e.toMap())
                                      .toList(),
                                },
                                r'''$.map''',
                              ),
                              'tests': getJsonField(
                                <String, List<dynamic>?>{
                                  'map': _model.requestData?.tests
                                      .map((e) => e.toMap())
                                      .toList(),
                                },
                                r'''$.map''',
                              ),
                              'status': _model.switchListTileValue == true
                                  ? 'published'
                                  : 'draft',
                            },
                          );

                          shouldSetState = true;
                          if ((_model.apiResultuus111?.succeeded ?? true)) {
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

                          _model.apiResultSynchronizedStaffLesson1 =
                              await StudyProgramGroup
                                  .synchronizedStaffLessonCall
                                  .call(
                            accessToken: FFAppState().accessToken,
                            programId: widget.dataDetail?.id,
                          );

                          shouldSetState = true;
                          if ((_model.apiResultSynchronizedStaffLesson1
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).noColor,
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
