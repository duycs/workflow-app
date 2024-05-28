import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/procedure/check_box_toggle/check_box_toggle_widget.dart';
import '/procedure/dropdown_departments_list/dropdown_departments_list_widget.dart';
import '/procedure/dropdown_user_list/dropdown_user_list_widget.dart';
import '/procedure/procedure_step_create/procedure_step_create_widget.dart';
import '/procedure/procedure_step_menu/procedure_step_menu_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'procedure_create_model.dart';
export 'procedure_create_model.dart';

class ProcedureCreateWidget extends StatefulWidget {
  const ProcedureCreateWidget({
    super.key,
    String? checkRouter,
    String? checkScroll,
  })  : checkRouter = checkRouter ?? '0',
        checkScroll = checkScroll ?? '0';

  final String checkRouter;
  final String checkScroll;

  @override
  State<ProcedureCreateWidget> createState() => _ProcedureCreateWidgetState();
}

class _ProcedureCreateWidgetState extends State<ProcedureCreateWidget>
    with TickerProviderStateMixin {
  late ProcedureCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedureCreateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.updateRequestDataStruct(
          (e) => e
            ..remind = 0
            ..cron = null
            ..remindInSecond = 0
            ..remind2 = 0,
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textNameTextController ??= TextEditingController();
    _model.textNameFocusNode ??= FocusNode();

    _model.textDescriptionTextController ??= TextEditingController();
    _model.textDescriptionFocusNode ??= FocusNode();

    _model.timeHourTextController ??= TextEditingController();
    _model.timeHourFocusNode ??= FocusNode();

    _model.timeMinuteTextController ??= TextEditingController();
    _model.timeMinuteFocusNode ??= FocusNode();
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
              context.pop();
            },
          ),
          title: Text(
            'Tạo mới quy trình',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var shouldSetState = false;
                  setState(() {});
                  _model.tokenReloadProcedureCreate =
                      await action_blocks.tokenReload(context);
                  shouldSetState = true;
                  if (_model.tokenReloadProcedureCreate!) {
                    if (_model.requestData?.name != null &&
                        _model.requestData?.name != '') {
                      setState(() {});
                      if (_model.dropDownRunValue == '2') {
                        while (_model.loop < _model.staffList.length) {
                          setState(() {
                            _model.updateRequestDataStruct(
                              (e) => e
                                ..updateStaffs(
                                  (e) => e.add(StaffsStepStruct(
                                    staffsId: StaffIdStruct(
                                      id: _model
                                          .staffList[_model.loop].staffsId.id,
                                    ),
                                  )),
                                ),
                            );
                          });
                          setState(() {
                            _model.loop = _model.loop + 1;
                          });
                        }
                        setState(() {
                          _model.loop = 0;
                        });
                      } else if (_model.dropDownRunValue == '1') {
                        setState(() {
                          _model.updateRequestDataStruct(
                            (e) => e
                              ..departments = _model.departmentsList.toList(),
                          );
                        });
                      } else {
                        _model.apiResult4dr =
                            await DepartmentGroup.getDepartmentListCall.call(
                          accessToken: FFAppState().accessToken,
                          filter: '{\"_and\":[${() {
                            if (FFAppState().user.role ==
                                '82073000-1ba2-43a4-a55c-459d17c23b68') {
                              return '{\"organization_id\":{\"_eq\":\"';
                            } else if (FFAppState().user.role ==
                                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                              return '{\"branch_id\":{\"id\":{\"_eq\":\"';
                            } else {
                              return ' ';
                            }
                          }()}${() {
                            if (FFAppState().user.role ==
                                '82073000-1ba2-43a4-a55c-459d17c23b68') {
                              return getJsonField(
                                FFAppState().staffLogin,
                                r'''$.organization_id''',
                              ).toString();
                            } else if (FFAppState().user.role ==
                                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                              return getJsonField(
                                FFAppState().staffBranch,
                                r'''$.id''',
                              ).toString();
                            } else {
                              return ' ';
                            }
                          }()}${() {
                            if (FFAppState().user.role ==
                                '82073000-1ba2-43a4-a55c-459d17c23b68') {
                              return '\"}}';
                            } else if (FFAppState().user.role ==
                                'a8d33527-375b-4599-ac70-6a3fcad1de39') {
                              return '\"}}}';
                            } else {
                              return ' ';
                            }
                          }()},{\"status\":{\"_eq\":\"published\"}}]}',
                        );
                        shouldSetState = true;
                        if ((_model.apiResult4dr?.succeeded ?? true)) {
                          while (_model.loop <
                              DepartmentListDataStruct.maybeFromMap(
                                      (_model.apiResult4dr?.jsonBody ?? ''))!
                                  .data
                                  .length) {
                            setState(() {
                              _model.addToDepartmentsList(DepartmentsIdStruct(
                                departmentsId: DepartmentsStruct(
                                  id: (DepartmentListDataStruct.maybeFromMap(
                                              (_model.apiResult4dr?.jsonBody ??
                                                  ''))
                                          ?.data[_model.loop])
                                      ?.id,
                                ),
                              ));
                            });
                            setState(() {
                              _model.loop = _model.loop + 1;
                            });
                          }
                          setState(() {
                            _model.loop = 0;
                          });
                          setState(() {
                            _model.updateRequestDataStruct(
                              (e) => e
                                ..departments = _model.departmentsList.toList(),
                            );
                          });
                        }
                      }

                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Vui lòng nhập tên quy trình!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                      if (shouldSetState) setState(() {});
                      return;
                    }
                  } else {
                    setState(() {});
                    if (shouldSetState) setState(() {});
                    return;
                  }

                  if (_model.checkType == '3') {
                    while (_model.loop < _model.checkOne.length) {
                      if (_model.checkOne[_model.loop].type == true) {
                        setState(() {
                          _model.addToCheckCron(
                              _model.checkOne[_model.loop].title);
                        });
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (_model.loop < _model.checkTwo.length) {
                      if (_model.checkTwo[_model.loop].type == true) {
                        setState(() {
                          _model.addToCheckCron(
                              _model.checkTwo[_model.loop].title);
                        });
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (_model.loop < _model.checkThrees.length) {
                      if (_model.checkThrees[_model.loop].type == true) {
                        setState(() {
                          _model.addToCheckCron(
                              _model.checkThrees[_model.loop].title);
                        });
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (_model.loop < _model.checkBoxFour.length) {
                      if (_model.checkBoxFour[_model.loop].type == true) {
                        setState(() {
                          _model.addToCheckCron(
                              _model.checkBoxFour[_model.loop].title);
                        });
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (_model.loop < _model.checkBoxFive.length) {
                      if (_model.checkBoxFive[_model.loop].type == true) {
                        setState(() {
                          _model.addToCheckCron(
                              _model.checkBoxFive[_model.loop].title);
                        });
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (_model.loop < _model.checkBoxSix.length) {
                      if (_model.checkBoxSix[_model.loop].type == true) {
                        setState(() {
                          _model.addToCheckCron(
                              _model.checkBoxSix[_model.loop].title);
                        });
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    setState(() {
                      _model.updateRequestDataStruct(
                        (e) => e
                          ..cron = functions.limitPublished(
                              _model.checkType!, _model.checkCron.toList()),
                      );
                    });
                  } else if (_model.checkType == '2') {
                    setState(() {
                      _model.updateRequestDataStruct(
                        (e) => e
                          ..cron = functions.limitPublished(_model.checkType!,
                              _model.groupWeekValues?.toList()),
                      );
                    });
                  } else if (_model.checkType == '1') {
                    setState(() {
                      _model.updateRequestDataStruct(
                        (e) => e
                          ..cron = functions.limitPublished(_model.checkType!,
                              _model.groupWeekValues?.toList()),
                      );
                    });
                  }

                  setState(() {
                    _model.updateRequestDataStruct(
                      (e) => e
                        ..status = 'published'
                        ..limitPublished = 0
                        ..staffs = [],
                    );
                  });
                  while (_model.loop < _model.staffList.length) {
                    setState(() {
                      _model.updateRequestDataStruct(
                        (e) => e
                          ..updateStaffs(
                            (e) => e.add(StaffsStepStruct(
                              staffsId: StaffIdStruct(
                                id: _model.staffList[_model.loop].staffsId.id,
                              ),
                            )),
                          ),
                      );
                    });
                    setState(() {
                      _model.loop = _model.loop + 1;
                    });
                  }
                  setState(() {
                    _model.loop = 0;
                  });
                  if ((getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ) !=
                          null) &&
                      (getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ).toString() !=
                          '${null}')) {
                    setState(() {
                      _model.updateRequestDataStruct(
                        (e) => e
                          ..branchId = getJsonField(
                            FFAppState().staffBranch,
                            r'''$.id''',
                          ).toString(),
                      );
                    });
                  }
                  _model.apiResultWorkflowCreate =
                      await ProcedureTemplateGroup.workflowsCreateCall.call(
                    requestDataJson: _model.requestData?.toMap(),
                    accessToken: FFAppState().accessToken,
                  );
                  shouldSetState = true;
                  if ((_model.apiResultWorkflowCreate?.succeeded ?? true)) {
                    while (_model.loop < _model.stepsList.length) {
                      setState(() {
                        _model.updateStepsListAtIndex(
                          _model.loop,
                          (e) => e
                            ..workflowId = getJsonField(
                              (_model.apiResultWorkflowCreate?.jsonBody ?? ''),
                              r'''$.data.id''',
                            ).toString()
                            ..number = _model.loop + 1,
                        );
                      });
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (_model.loop < _model.stepsList.length) {
                      setState(() {
                        _model.stepsListRequest = null;
                      });
                      setState(() {
                        _model.updateStepsListRequestStruct(
                          (e) => e
                            ..actionType =
                                _model.stepsList[_model.loop].actionType
                            ..description =
                                _model.stepsList[_model.loop].description
                            ..estimateInSecond =
                                _model.stepsList[_model.loop].estimateInSecond
                            ..executeType =
                                _model.stepsList[_model.loop].executeType
                            ..name = _model.stepsList[_model.loop].name
                            ..number = _model.stepsList[_model.loop].number
                            ..staffsAlias =
                                _model.stepsList[_model.loop].staffsAlias
                            ..status = _model.stepsList[_model.loop].status
                            ..timeOperate =
                                _model.stepsList[_model.loop].timeOperate
                            ..workflowId =
                                _model.stepsList[_model.loop].workflowId
                            ..cron = _model.stepsList[_model.loop].cron,
                        );
                      });
                      while (_model.loop2 <
                          _model.stepsList[_model.loop].staffs.length) {
                        setState(() {
                          _model.updateStepsListRequestStruct(
                            (e) => e
                              ..updateStaffs(
                                (e) => e.add(StaffsStepStruct(
                                  staffsId: StaffIdStruct(
                                    id: _model.stepsList[_model.loop]
                                        .staffs[_model.loop2].staffsId.id,
                                  ),
                                )),
                              ),
                          );
                        });
                        setState(() {
                          _model.loop2 = _model.loop2 + 1;
                        });
                      }
                      setState(() {
                        _model.loop2 = 0;
                      });
                      while (_model.loop2 <
                          _model.stepsList[_model.loop].operations.length) {
                        if (_model.stepsList[_model.loop]
                                    .operations[_model.loop2].id !=
                                '') {
                          setState(() {
                            _model.updateStepsListRequestStruct(
                              (e) => e
                                ..updateOperations(
                                  (e) => e.add(OperationsStruct(
                                    content: _model.stepsList[_model.loop]
                                        .operations[_model.loop2].content,
                                    actionType: _model.stepsList[_model.loop]
                                        .operations[_model.loop2].actionType,
                                    id: _model.stepsList[_model.loop]
                                        .operations[_model.loop2].id,
                                  )),
                                ),
                            );
                          });
                        } else {
                          setState(() {
                            _model.updateStepsListRequestStruct(
                              (e) => e
                                ..updateOperations(
                                  (e) => e.add(OperationsStruct(
                                    content: _model.stepsList[_model.loop]
                                        .operations[_model.loop2].content,
                                    actionType: _model.stepsList[_model.loop]
                                        .operations[_model.loop2].actionType,
                                  )),
                                ),
                            );
                          });
                        }

                        setState(() {
                          _model.loop2 = _model.loop2 + 1;
                        });
                      }
                      setState(() {
                        _model.loop2 = 0;
                      });
                      while (_model.loop2 <
                          _model.stepsList[_model.loop].departments.length) {
                        setState(() {
                          _model.updateStepsListRequestStruct(
                            (e) => e
                              ..updateDepartments(
                                (e) => e.add(DepartmentListStruct(
                                  departmentsId: DepartmentsStruct(
                                    id: _model
                                        .stepsList[_model.loop]
                                        .departments[_model.loop2]
                                        .departmentsId
                                        .id,
                                  ),
                                )),
                              ),
                          );
                        });
                        setState(() {
                          _model.loop2 = _model.loop2 + 1;
                        });
                      }
                      setState(() {
                        _model.loop2 = 0;
                      });
                      _model.apiResultStepCreate = await ProcedureTemplateGroup
                          .stepCreateWorkflowsCall
                          .call(
                        accessToken: FFAppState().accessToken,
                        requestDataJson: _model.stepsListRequest?.toMap(),
                      );
                      shouldSetState = true;
                      if ((_model.apiResultStepCreate?.succeeded ?? true)) {
                        setState(() {});
                      }
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    if (widget.checkRouter == 'task') {
                      context.pushNamed(
                        'TaskList',
                        queryParameters: {
                          'checkRouter': serializeParam(
                            'workflow',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Tạo mới quy trình thành công!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (shouldSetState) setState(() {});
                      return;
                    } else {
                      context.pushNamed(
                        'ProcedureList',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Tạo mới quy trình thành công!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (shouldSetState) setState(() {});
                      return;
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Lỗi tạo mới quy trình!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                    if (shouldSetState) setState(() {});
                    return;
                  }

                  if (shouldSetState) setState(() {});
                },
                text: 'Lưu',
                options: FFButtonOptions(
                  height: 36.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding: const EdgeInsets.all(0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Nunito Sans',
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: const Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryText,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Nunito Sans',
                        letterSpacing: 0.0,
                      ),
                  unselectedLabelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                          ),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  padding: const EdgeInsets.all(4.0),
                  tabs: const [
                    Tab(
                      text: 'Cài đặt chung',
                    ),
                    Tab(
                      text: 'Bước quy trình',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent4,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        TextFormField(
                                          controller:
                                              _model.textNameTextController,
                                          focusNode: _model.textNameFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textNameTextController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              setState(() {
                                                _model.updateRequestDataStruct(
                                                  (e) => e
                                                    ..name = _model
                                                        .textNameTextController
                                                        .text,
                                                );
                                              });
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Nhập tên quy trình...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .textNameTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                    .textDescriptionTextController,
                                                focusNode: _model
                                                    .textDescriptionFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textDescriptionTextController',
                                                  const Duration(milliseconds: 2000),
                                                  () async {
                                                    setState(() {
                                                      _model
                                                          .updateRequestDataStruct(
                                                        (e) => e
                                                          ..description = _model
                                                              .textDescriptionTextController
                                                              .text,
                                                      );
                                                    });
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Nhập mô tả...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLines: 2,
                                                validator: _model
                                                    .textDescriptionTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownRunValueController ??=
                                            FormFieldController<String>(
                                          _model.dropDownRunValue ??= '0',
                                        ),
                                        options:
                                            List<String>.from(['0', '1', '2']),
                                        optionLabels: const [
                                          'Tất cả phòng ban',
                                          'Phòng ban',
                                          'Nhân viên'
                                        ],
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.dropDownRunValue = val);
                                          setState(() {
                                            _model.departmentsList = [];
                                            _model.staffList = [];
                                          });
                                          if (_model.dropDownRunValue == '1') {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        DropdownDepartmentsListWidget(
                                                      dataPar: _model
                                                          .departmentsList,
                                                      callback: (item) async {
                                                        setState(() {
                                                          _model.departmentsList =
                                                              item!.toList().cast<
                                                                  DepartmentsIdStruct>();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else if (_model.dropDownRunValue ==
                                              '2') {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        DropdownUserListWidget(
                                                      dataPar: _model.staffList,
                                                      callback: (item) async {
                                                        await _model.addStaff(
                                                          context,
                                                          item: item,
                                                        );
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        },
                                        width: 300.0,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Khởi chạy',
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
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 24.0)),
                                ),
                              ),
                              if (_model.dropDownRunValue == '2')
                                Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '# Danh sách nhân viên khởi chạy',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        DropdownUserListWidget(
                                                      dataPar: _model.staffList,
                                                      callback: (item) async {
                                                        await _model.addStaff(
                                                          context,
                                                          item: item,
                                                        );
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (_model.dropDownRunValue == '2')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listStaff =
                                              _model.staffList.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: listStaff.length,
                                            itemBuilder:
                                                (context, listStaffIndex) {
                                              final listStaffItem =
                                                  listStaff[listStaffIndex];
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: listStaffItem.staffsId
                                                        .userId.firstName,
                                                    options: FFButtonOptions(
                                                      height: 25.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.dropDownRunValue == '1')
                                Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '# Danh sác bộ phận khởi chạy',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        DropdownDepartmentsListWidget(
                                                      dataPar: _model
                                                          .departmentsList,
                                                      callback: (item) async {
                                                        setState(() {
                                                          _model.departmentsList =
                                                              item!.toList().cast<
                                                                  DepartmentsIdStruct>();
                                                        });
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (_model.dropDownRunValue == '1')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listStaff =
                                              _model.departmentsList.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: listStaff.length,
                                            itemBuilder:
                                                (context, listStaffIndex) {
                                              final listStaffItem =
                                                  listStaff[listStaffIndex];
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: listStaffItem
                                                        .departmentsId.name,
                                                    options: FFButtonOptions(
                                                      height: 25.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: const Color(0xFFE0E3E7),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 14.0),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          24.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.settings_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Thiết lập cấu hình',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    22.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Thiết lập tuần lặp',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .dropDownCronValueController ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.dropDownCronValue ??=
                                                                  '0',
                                                            ),
                                                            options: List<
                                                                String>.from([
                                                              '0',
                                                              '1',
                                                              '2',
                                                              '3'
                                                            ]),
                                                            optionLabels: const [
                                                              'Không lặp',
                                                              'Lặp hàng ngày',
                                                              'Lặp trong tuần',
                                                              'Lặp trong tháng'
                                                            ],
                                                            onChanged:
                                                                (val) async {
                                                              setState(() =>
                                                                  _model.dropDownCronValue =
                                                                      val);
                                                              setState(() {
                                                                _model.checkCron =
                                                                    [];
                                                              });
                                                              setState(() {
                                                                _model.loop = 0;
                                                                _model.loop2 =
                                                                    0;
                                                                _model.checkOne =
                                                                    [];
                                                                _model.checkTwo =
                                                                    [];
                                                                _model.checkThrees =
                                                                    [];
                                                                _model.checkBoxFour =
                                                                    [];
                                                                _model.checkBoxFive =
                                                                    [];
                                                                _model.checkBoxSix =
                                                                    [];
                                                              });
                                                              if (_model
                                                                      .dropDownCronValue !=
                                                                  '3') {
                                                                setState(() {
                                                                  _model.checkType =
                                                                      _model
                                                                          .dropDownCronValue;
                                                                });
                                                              } else {
                                                                while (_model
                                                                        .loop <
                                                                    6) {
                                                                  setState(() {
                                                                    _model.addToCheckOne(
                                                                        CheckBoxGroupStruct(
                                                                      type:
                                                                          false,
                                                                      title: (_model.loop + 1) <
                                                                              10
                                                                          ? '0${(_model.loop + 1).toString()}'
                                                                          : (_model.loop + 1).toString(),
                                                                    ));
                                                                    _model.addToCheckTwo(
                                                                        CheckBoxGroupStruct(
                                                                      type:
                                                                          false,
                                                                      title: (_model.loop + 7) <
                                                                              10
                                                                          ? '0${(_model.loop + 7).toString()}'
                                                                          : (_model.loop + 7).toString(),
                                                                    ));
                                                                    _model.addToCheckThrees(
                                                                        CheckBoxGroupStruct(
                                                                      type:
                                                                          false,
                                                                      title: (_model.loop + 12) <
                                                                              10
                                                                          ? '0${(_model.loop + 13).toString()}'
                                                                          : (_model.loop + 13).toString(),
                                                                    ));
                                                                    _model.addToCheckBoxFour(
                                                                        CheckBoxGroupStruct(
                                                                      type:
                                                                          false,
                                                                      title: (_model.loop + 18) <
                                                                              10
                                                                          ? '0${(_model.loop + 19).toString()}'
                                                                          : (_model.loop + 19).toString(),
                                                                    ));
                                                                    _model.addToCheckBoxFive(
                                                                        CheckBoxGroupStruct(
                                                                      type:
                                                                          false,
                                                                      title: (_model.loop + 24) <
                                                                              10
                                                                          ? '0${(_model.loop + 25).toString()}'
                                                                          : (_model.loop + 25).toString(),
                                                                    ));
                                                                  });
                                                                  setState(() {
                                                                    _model.loop =
                                                                        _model.loop +
                                                                            1;
                                                                  });
                                                                }
                                                                setState(() {
                                                                  _model.addToCheckBoxSix(
                                                                      CheckBoxGroupStruct(
                                                                    type: false,
                                                                    title: '31',
                                                                  ));
                                                                });
                                                                setState(() {
                                                                  _model.checkType =
                                                                      _model
                                                                          .dropDownCronValue;
                                                                  _model.loop =
                                                                      0;
                                                                });
                                                              }
                                                            },
                                                            width:
                                                                double.infinity,
                                                            height: 60.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Vui lòng chọn lặp',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 1.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            borderWidth: 1.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model.checkType ==
                                                          '2')
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '# Ngày cụ thể trong tuần (chọn một hoặc nhiều)',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(() =>
                                                                              _model.groupWeekValueController?.value = List.from([
                                                                                'Thứ Hai',
                                                                                'Thứ Ba',
                                                                                'Thứ Tư',
                                                                                'Thứ Năm',
                                                                                'Thứ Sáu',
                                                                                'Thứ Bảy',
                                                                                'Chủ Nhật'
                                                                              ]));
                                                                          while (_model.loop <
                                                                              7) {
                                                                            setState(() {
                                                                              _model.addToCheckCron((_model.loop + 1).toString());
                                                                            });
                                                                            setState(() {
                                                                              _model.loop = _model.loop + 1;
                                                                            });
                                                                          }
                                                                          setState(
                                                                              () {
                                                                            _model.loop =
                                                                                0;
                                                                          });
                                                                        },
                                                                        text:
                                                                            'Chọn tất cả',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              30.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(() => _model
                                                                              .groupWeekValueController
                                                                              ?.value = []);
                                                                          setState(
                                                                              () {
                                                                            _model.checkCron =
                                                                                [];
                                                                          });
                                                                        },
                                                                        text:
                                                                            'Bỏ chọn',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              30.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                FlutterFlowCheckboxGroup(
                                                                  options: const [
                                                                    'Thứ Hai',
                                                                    'Thứ Ba',
                                                                    'Thứ Tư',
                                                                    'Thứ Năm',
                                                                    'Thứ Sáu',
                                                                    'Thứ Bảy',
                                                                    'Chủ Nhật'
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.groupWeekValues =
                                                                              val),
                                                                  controller: _model
                                                                          .groupWeekValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [],
                                                                  ),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                  checkColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  checkboxBorderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  unselectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  checkboxBorderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                  initialized:
                                                                      _model.groupWeekValues !=
                                                                          null,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                if (_model.checkType == '3')
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    10.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          '# Danh sách ngày cụ thể trong tháng (chọn một hoặc nhiều)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                while (_model
                                                                        .loop <
                                                                    6) {
                                                                  setState(() {
                                                                    _model
                                                                        .updateCheckOneAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            true,
                                                                    );
                                                                    _model
                                                                        .updateCheckTwoAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            true,
                                                                    );
                                                                    _model
                                                                        .updateCheckThreesAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            true,
                                                                    );
                                                                    _model
                                                                        .updateCheckBoxFourAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            true,
                                                                    );
                                                                    _model
                                                                        .updateCheckBoxFiveAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            true,
                                                                    );
                                                                  });
                                                                  setState(() {
                                                                    _model.loop =
                                                                        _model.loop +
                                                                            1;
                                                                  });
                                                                }
                                                                setState(() {
                                                                  _model
                                                                      .updateCheckBoxSixAtIndex(
                                                                    0,
                                                                    (e) => e
                                                                      ..type =
                                                                          true,
                                                                  );
                                                                });
                                                                setState(() {
                                                                  _model.loop =
                                                                      0;
                                                                });
                                                              },
                                                              text:
                                                                  'Chọn tất cả',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 100.0,
                                                                height: 30.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                while (_model
                                                                        .loop <
                                                                    6) {
                                                                  setState(() {
                                                                    _model
                                                                        .updateCheckOneAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            false,
                                                                    );
                                                                    _model
                                                                        .updateCheckTwoAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            false,
                                                                    );
                                                                    _model
                                                                        .updateCheckThreesAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            false,
                                                                    );
                                                                    _model
                                                                        .updateCheckBoxFourAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            false,
                                                                    );
                                                                    _model
                                                                        .updateCheckBoxFiveAtIndex(
                                                                      _model
                                                                          .loop,
                                                                      (e) => e
                                                                        ..type =
                                                                            false,
                                                                    );
                                                                  });
                                                                  setState(() {
                                                                    _model.loop =
                                                                        _model.loop +
                                                                            1;
                                                                  });
                                                                }
                                                                setState(() {
                                                                  _model
                                                                      .updateCheckBoxSixAtIndex(
                                                                    0,
                                                                    (e) => e
                                                                      ..type =
                                                                          false,
                                                                  );
                                                                });
                                                                setState(() {
                                                                  _model.loop =
                                                                      0;
                                                                });
                                                              },
                                                              text: 'Bỏ chọn',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 100.0,
                                                                height: 30.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listOne =
                                                                  _model
                                                                      .checkOne
                                                                      .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    listOne
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    const SizedBox(
                                                                        width:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listOneIndex) {
                                                                  final listOneItem =
                                                                      listOne[
                                                                          listOneIndex];
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .checkBoxToggleModels1
                                                                              .getModel(
                                                                            '${listOneItem.title}${listOneItem.type.toString()}',
                                                                            listOneIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CheckBoxToggleWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyki3_${'${listOneItem.title}${listOneItem.type.toString()}'}',
                                                                            ),
                                                                            checkParam:
                                                                                listOneItem.type,
                                                                            callBack:
                                                                                (checkCall) async {
                                                                              setState(() {
                                                                                _model.updateCheckOneAtIndex(
                                                                                  listOneIndex,
                                                                                  (e) => e..type = checkCall,
                                                                                );
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listOneItem
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listTwo =
                                                                  _model
                                                                      .checkTwo
                                                                      .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    listTwo
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    const SizedBox(
                                                                        width:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listTwoIndex) {
                                                                  final listTwoItem =
                                                                      listTwo[
                                                                          listTwoIndex];
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.15,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .checkBoxToggleModels2
                                                                              .getModel(
                                                                            '${listTwoItem.title}${listTwoItem.type.toString()}',
                                                                            listTwoIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CheckBoxToggleWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyj3f_${'${listTwoItem.title}${listTwoItem.type.toString()}'}',
                                                                            ),
                                                                            checkParam:
                                                                                listTwoItem.type,
                                                                            callBack:
                                                                                (checkCall) async {
                                                                              setState(() {
                                                                                _model.updateCheckTwoAtIndex(
                                                                                  listTwoIndex,
                                                                                  (e) => e..type = checkCall,
                                                                                );
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listTwoItem
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listThree =
                                                                  _model
                                                                      .checkThrees
                                                                      .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    listThree
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    const SizedBox(
                                                                        width:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listThreeIndex) {
                                                                  final listThreeItem =
                                                                      listThree[
                                                                          listThreeIndex];
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.15,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .checkBoxToggleModels3
                                                                              .getModel(
                                                                            '${listThreeItem.title}${listThreeItem.type.toString()}',
                                                                            listThreeIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CheckBoxToggleWidget(
                                                                            key:
                                                                                Key(
                                                                              'Key8dk_${'${listThreeItem.title}${listThreeItem.type.toString()}'}',
                                                                            ),
                                                                            checkParam:
                                                                                listThreeItem.type,
                                                                            callBack:
                                                                                (checkCall) async {
                                                                              setState(() {
                                                                                _model.updateCheckThreesAtIndex(
                                                                                  listThreeIndex,
                                                                                  (e) => e..type = checkCall,
                                                                                );
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listThreeItem
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listFour =
                                                                  _model
                                                                      .checkBoxFour
                                                                      .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    listFour
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    const SizedBox(
                                                                        width:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listFourIndex) {
                                                                  final listFourItem =
                                                                      listFour[
                                                                          listFourIndex];
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .checkBoxToggleModels4
                                                                              .getModel(
                                                                            '${listFourItem.title}${listFourItem.type.toString()}',
                                                                            listFourIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CheckBoxToggleWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keywz6_${'${listFourItem.title}${listFourItem.type.toString()}'}',
                                                                            ),
                                                                            checkParam:
                                                                                listFourItem.type,
                                                                            callBack:
                                                                                (checkCall) async {
                                                                              setState(() {
                                                                                _model.updateCheckBoxFourAtIndex(
                                                                                  listFourIndex,
                                                                                  (e) => e..type = checkCall,
                                                                                );
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listFourItem
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final listFive =
                                                                  _model
                                                                      .checkBoxFive
                                                                      .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    listFive
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    const SizedBox(
                                                                        width:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listFiveIndex) {
                                                                  final listFiveItem =
                                                                      listFive[
                                                                          listFiveIndex];
                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .checkBoxToggleModels5
                                                                              .getModel(
                                                                            '${listFiveItem.title}${listFiveItem.type.toString()}',
                                                                            listFiveIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CheckBoxToggleWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keybma_${'${listFiveItem.title}${listFiveItem.type.toString()}'}',
                                                                            ),
                                                                            checkParam:
                                                                                listFiveItem.type,
                                                                            callBack:
                                                                                (checkCall) async {
                                                                              setState(() {
                                                                                _model.updateCheckBoxFiveAtIndex(
                                                                                  listFiveIndex,
                                                                                  (e) => e..type = checkCall,
                                                                                );
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listFiveItem
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final listSix =
                                                                _model
                                                                    .checkBoxSix
                                                                    .toList();
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount: listSix
                                                                  .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      const SizedBox(
                                                                          width:
                                                                              4.0),
                                                              itemBuilder: (context,
                                                                  listSixIndex) {
                                                                final listSixItem =
                                                                    listSix[
                                                                        listSixIndex];
                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .checkBoxToggleModels6
                                                                            .getModel(
                                                                          '${listSixItem.title}${listSixItem.type.toString()}',
                                                                          listSixIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CheckBoxToggleWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keyr6v_${'${listSixItem.title}${listSixItem.type.toString()}'}',
                                                                          ),
                                                                          checkParam:
                                                                              listSixItem.type,
                                                                          callBack:
                                                                              (checkCall) async {
                                                                            setState(() {
                                                                              _model.updateCheckBoxSixAtIndex(
                                                                                listSixIndex,
                                                                                (e) => e..type = checkCall,
                                                                              );
                                                                            });
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        listSixItem
                                                                            .title,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    const CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      CircleBorder(),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                        .checkboxValue1 ??=
                                                                    false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  setState(() =>
                                                                      _model.checkboxValue1 =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateRequestDataStruct(
                                                                        (e) => e
                                                                          ..remind =
                                                                              1,
                                                                      );
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateRequestDataStruct(
                                                                        (e) => e
                                                                          ..remind =
                                                                              0,
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                                side:
                                                                    BorderSide(
                                                                  width: 2,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'Thiết lập nhắc trước khi bắt đầu bước:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      8.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .timeHourTextController,
                                                                  focusNode: _model
                                                                      .timeHourFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.timeHourTextController',
                                                                    const Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateRequestDataStruct(
                                                                          (e) => e
                                                                            ..remindInSecond = functions.timeToMinute(
                                                                                _model.timeHourTextController.text != '' ? _model.timeHourTextController.text : '0',
                                                                                _model.timeMinuteTextController.text != '' ? _model.timeMinuteTextController.text : '0',
                                                                                null),
                                                                        );
                                                                      });
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Giờ',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        ' ',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .timeHourTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .timeMinuteTextController,
                                                                  focusNode: _model
                                                                      .timeMinuteFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.timeMinuteTextController',
                                                                    const Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateRequestDataStruct(
                                                                          (e) => e
                                                                            ..remindInSecond = functions.timeToMinute(
                                                                                _model.timeHourTextController.text != '' ? _model.timeHourTextController.text : '0',
                                                                                _model.timeMinuteTextController.text != '' ? _model.timeMinuteTextController.text : '0',
                                                                                null),
                                                                        );
                                                                      });
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Phút',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        ' ',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .timeMinuteTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '(${_model.requestData?.remindInSecond != null ? _model.requestData?.remindInSecond.toString() : '0'} phút)',
                                                                    style: FlutterFlowTheme.of(
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
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Theme(
                                                        data: ThemeData(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            visualDensity:
                                                                VisualDensity
                                                                    .compact,
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .shrinkWrap,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          90.0),
                                                            ),
                                                          ),
                                                          unselectedWidgetColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                        child: Checkbox(
                                                          value: _model
                                                                  .checkboxValue2 ??=
                                                              false,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                    .checkboxValue2 =
                                                                newValue!);
                                                            if (newValue!) {
                                                              setState(() {
                                                                _model
                                                                    .updateRequestDataStruct(
                                                                  (e) => e
                                                                    ..remind2 =
                                                                        1,
                                                                );
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _model
                                                                    .updateRequestDataStruct(
                                                                  (e) => e
                                                                    ..remind2 =
                                                                        0,
                                                                );
                                                              });
                                                            }
                                                          },
                                                          side: BorderSide(
                                                            width: 2,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          checkColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Thiết lập nhắc chuyển bước',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sơ đồ quy trình',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        ProcedureStepCreateWidget(
                                                      callBack:
                                                          (addItem) async {
                                                        setState(() {
                                                          _model.addToStepsList(
                                                              WorkflowsStepCreateStruct(
                                                            name: addItem?.name,
                                                            description: addItem
                                                                ?.description,
                                                            staffs:
                                                                addItem?.staffs,
                                                            executeType: addItem
                                                                ?.executeType,
                                                            actionType: addItem
                                                                ?.actionType,
                                                            operations: addItem
                                                                ?.operations,
                                                            status: 'published',
                                                            staffsAlias: addItem
                                                                ?.staffsAlias,
                                                            timeOperate: addItem
                                                                ?.timeOperate,
                                                            estimateInSecond:
                                                                addItem
                                                                    ?.estimateInSecond,
                                                            departments: addItem
                                                                ?.departments,
                                                          ));
                                                        });
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Bước',
                                          icon: const Icon(
                                            Icons.add,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: Colors.white,
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
                                      ].divide(const SizedBox(width: 24.0)),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final listView =
                                          _model.stepsList.toList();
                                      return ReorderableListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listView.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewItem =
                                              listView[listViewIndex];
                                          return Container(
                                            key: ValueKey("ListView_sdtnx31w" '_' +
                                                listViewIndex.toString()),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 30.0,
                                                        child: VerticalDivider(
                                                          width: 1.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Text(
                                                                  '${(listViewIndex + 1).toString()}.',
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
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
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    listViewItem
                                                                        .name,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
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
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await showAlignedDialog(
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          true,
                                                                      targetAnchor: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                SizedBox(
                                                                              height: 150.0,
                                                                              width: 250.0,
                                                                              child: ProcedureStepMenuWidget(
                                                                                item: listViewItem,
                                                                                idItem: 'null',
                                                                                callBack: (upStep, idItem) async {
                                                                                  await _model.updateStep(
                                                                                    context,
                                                                                    item: upStep,
                                                                                    index: listViewIndex,
                                                                                  );
                                                                                  setState(() {});
                                                                                },
                                                                                callBackDelete: () async {
                                                                                  setState(() {
                                                                                    _model.removeAtIndexFromStepsList(listViewIndex);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        onReorder: (int reorderableOldIndex,
                                            int reorderableNewIndex) async {
                                          _model.updateListView =
                                              await actions.reorderItems(
                                            _model.stepsList.toList(),
                                            reorderableOldIndex,
                                            reorderableNewIndex,
                                          );
                                          setState(() {
                                            _model.stepsList = _model
                                                .updateListView!
                                                .toList()
                                                .cast<
                                                    WorkflowsStepCreateStruct>();
                                          });

                                          setState(() {});
                                        },
                                      );
                                    },
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                        child: VerticalDivider(
                                          width: 1.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
