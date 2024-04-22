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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'procedure_update_model.dart';
export 'procedure_update_model.dart';

class ProcedureUpdateWidget extends StatefulWidget {
  const ProcedureUpdateWidget({
    super.key,
    required this.itemData,
    required this.stepListPar,
    bool? check,
  }) : check = check ?? false;

  final WorkflowsStepCreateStruct? itemData;
  final List<WorkflowsStepCreateStruct>? stepListPar;
  final bool check;

  @override
  State<ProcedureUpdateWidget> createState() => _ProcedureUpdateWidgetState();
}

class _ProcedureUpdateWidgetState extends State<ProcedureUpdateWidget>
    with TickerProviderStateMixin {
  late ProcedureUpdateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcedureUpdateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.updateDataUpdateStruct(
          (e) => e
            ..name = widget.itemData?.name
            ..description = widget.itemData?.description
            ..status = widget.itemData?.status
            ..remind2 = widget.itemData?.remind2
            ..cron = widget.itemData?.cron
            ..remind = widget.itemData?.remind
            ..remindInSecond = widget.itemData?.remindInSecond,
        );
      });
      while (widget.itemData!.departments.length > _model.loop) {
        setState(() {
          _model.updateDataUpdateStruct(
            (e) => e
              ..updateDepartments(
                (e) => e.add(DepartmentsIdStruct(
                  departmentsId: DepartmentsStruct(
                    id: (widget.itemData?.departments[_model.loop])
                        ?.departmentsId
                        .id,
                    name: (widget.itemData?.departments[_model.loop])
                        ?.departmentsId
                        .name,
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
      if (_model.dataUpdate!.departments.isNotEmpty) {
        setState(() {});
      } else {
        while (widget.itemData!.staffs.length > _model.loop) {
          setState(() {
            _model.updateDataUpdateStruct(
              (e) => e..staffs = widget.itemData!.staffs.toList(),
            );
          });
          setState(() {
            _model.loop = _model.loop + 1;
          });
        }
        setState(() {
          _model.loop = 0;
        });
      }

      if (widget.stepListPar?.first != null) {
        while (_model.loop < widget.stepListPar!.length) {
          setState(() {
            _model.addToStepList(WorkflowsStepCreateStruct(
              id: (widget.stepListPar?[_model.loop])?.id,
              status: (widget.stepListPar?[_model.loop])?.status,
              description: (widget.stepListPar?[_model.loop])?.description,
              executeType: (widget.stepListPar?[_model.loop])?.executeType,
              number: (widget.stepListPar?[_model.loop])?.number,
              timeOperate: (widget.stepListPar?[_model.loop])?.timeOperate,
              actionType: (widget.stepListPar?[_model.loop])?.actionType,
              name: (widget.stepListPar?[_model.loop])?.name,
              estimateInSecond:
                  (widget.stepListPar?[_model.loop])?.estimateInSecond,
              staffsAlias: (widget.stepListPar?[_model.loop])?.staffsAlias,
            ));
          });
          while (
              _model.loop2 < (widget.stepListPar![_model.loop]).staffs.length) {
            setState(() {
              _model.updateStepListAtIndex(
                _model.loop,
                (e) => e
                  ..updateStaffs(
                    (e) => e.add(StaffsStepStruct(
                      staffsId: StaffIdStruct(
                        id: ((widget.stepListPar?[_model.loop])
                                ?.staffs[_model.loop2])
                            ?.staffsId
                            .id,
                        userId: UserIdStruct(
                          firstName: ((widget.stepListPar?[_model.loop])
                                  ?.staffs[_model.loop2])
                              ?.staffsId
                              .userId
                              .firstName,
                        ),
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
              (widget.stepListPar![_model.loop]).operations.length) {
            setState(() {
              _model.updateStepListAtIndex(
                _model.loop,
                (e) => e
                  ..updateOperations(
                    (e) => e.add(OperationsStruct(
                      content: ((widget.stepListPar?[_model.loop])
                              ?.operations[_model.loop2])
                          ?.operationsId
                          .content,
                      actionType: ((widget.stepListPar?[_model.loop])
                              ?.operations[_model.loop2])
                          ?.operationsId
                          .actionType,
                      id: ((widget.stepListPar?[_model.loop])
                              ?.operations[_model.loop2])
                          ?.operationsId
                          .id,
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
          setState(() {
            _model.loop = _model.loop + 1;
          });
        }
        setState(() {
          _model.loop = 0;
          _model.loop2 = 0;
        });
      }
      if (functions.checkTypeCron(_model.dataUpdate!.cron) == '2') {
        setState(() {
          _model.loop = 0;
          _model.checkOne = [];
          _model.checkTwo = [];
          _model.checkThrees = [];
          _model.checkBoxFour = [];
          _model.checkBoxFive = [];
          _model.checkBoxSix = [];
        });
        setState(() {
          _model.checkType = functions.checkTypeCron(_model.dataUpdate!.cron);
        });
      } else if (functions.checkTypeCron(_model.dataUpdate!.cron) == '3') {
        setState(() {
          _model.loop = 0;
          _model.checkOne = [];
          _model.checkTwo = [];
          _model.checkThrees = [];
          _model.checkBoxFour = [];
          _model.checkBoxFive = [];
          _model.checkBoxSix = [];
        });
        while (_model.loop < 6) {
          setState(() {
            _model.addToCheckOne(CheckBoxGroupStruct(
              type: false,
              title: (_model.loop + 1) < 10
                  ? '0${(_model.loop + 1).toString()}'
                  : (_model.loop + 1).toString(),
            ));
            _model.addToCheckTwo(CheckBoxGroupStruct(
              type: false,
              title: (_model.loop + 7) < 10
                  ? '0${(_model.loop + 7).toString()}'
                  : (_model.loop + 7).toString(),
            ));
            _model.addToCheckThrees(CheckBoxGroupStruct(
              type: false,
              title: (_model.loop + 13).toString(),
            ));
            _model.addToCheckBoxFour(CheckBoxGroupStruct(
              type: false,
              title: (_model.loop + 19).toString(),
            ));
            _model.addToCheckBoxFive(CheckBoxGroupStruct(
              type: false,
              title: (_model.loop + 25).toString(),
            ));
          });
          setState(() {
            _model.loop = _model.loop + 1;
          });
        }
        setState(() {
          _model.addToCheckBoxSix(CheckBoxGroupStruct(
            type: false,
            title: '31',
          ));
        });
        setState(() {
          _model.loop = 0;
        });
        while (_model.loop < _model.checkOne.length) {
          if ((List<String> var1, String var2) {
            return var1.join(',').contains(var2);
          }(functions.cronToType(_model.dataUpdate!.cron).toList(),
              _model.checkOne[_model.loop].title)) {
            setState(() {
              _model.updateCheckOneAtIndex(
                _model.loop,
                (e) => e..type = true,
              );
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
          if ((List<String> var1, String var2) {
            return var1.join(',').contains(var2);
          }(functions.cronToType(_model.dataUpdate!.cron).toList(),
              _model.checkTwo[_model.loop].title)) {
            setState(() {
              _model.updateCheckTwoAtIndex(
                _model.loop,
                (e) => e..type = true,
              );
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
          if ((List<String> var1, String var2) {
            return var1.join(',').contains(var2);
          }(functions.cronToType(_model.dataUpdate!.cron).toList(),
              _model.checkThrees[_model.loop].title)) {
            setState(() {
              _model.updateCheckThreesAtIndex(
                _model.loop,
                (e) => e..type = true,
              );
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
          if ((List<String> var1, String var2) {
            return var1.join(',').contains(var2);
          }(functions.cronToType(_model.dataUpdate!.cron).toList(),
              _model.checkBoxFour[_model.loop].title)) {
            setState(() {
              _model.updateCheckBoxFourAtIndex(
                _model.loop,
                (e) => e..type = true,
              );
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
          if ((List<String> var1, String var2) {
            return var1.join(',').contains(var2);
          }(functions.cronToType(_model.dataUpdate!.cron).toList(),
              _model.checkBoxFive[_model.loop].title)) {
            setState(() {
              _model.updateCheckBoxFiveAtIndex(
                _model.loop,
                (e) => e..type = true,
              );
            });
          }
          setState(() {
            _model.loop = _model.loop + 1;
          });
        }
        setState(() {
          _model.loop = 0;
        });
        if ((List<String> var1, String var2) {
          return var1.join(',').contains(var2);
        }(functions.cronToType(_model.dataUpdate!.cron).toList(),
            _model.checkBoxSix.first.title)) {
          setState(() {
            _model.updateCheckBoxSixAtIndex(
              0,
              (e) => e..type = true,
            );
          });
        }
        setState(() {
          _model.checkType = functions.checkTypeCron(_model.dataUpdate!.cron);
        });
      }

      setState(() {
        _model.checkType = functions.checkTypeCron(_model.dataUpdate!.cron);
      });
      setState(() {
        _model.isLoad = true;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textNameTextController ??= TextEditingController(
        text: widget.itemData?.name != null && widget.itemData?.name != ''
            ? widget.itemData?.name
            : ' ');
    _model.textNameFocusNode ??= FocusNode();

    _model.textDescriptionTextController ??= TextEditingController(
        text: (widget.itemData?.description != null &&
                    widget.itemData?.description != '') &&
                (widget.itemData?.description != 'null') &&
                (widget.itemData?.description != 'undefined')
            ? widget.itemData?.description
            : ' ');
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
            'Chỉnh sửa quy trình',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var shouldSetState = false;
                  setState(() {
                    _model.requestUpdate = null;
                  });
                  if (_model.dataUpdate?.name != null &&
                      _model.dataUpdate?.name != '') {
                    setState(() {
                      _model.updateDataUpdateStruct(
                        (e) => e
                          ..status = 'published'
                          ..id = widget.itemData?.id,
                      );
                      _model.loop = 0;
                    });
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
                    } else if (_model.checkType == '2') {
                      setState(() {
                        _model.updateDataUpdateStruct(
                          (e) => e
                            ..cron = functions.limitPublished(_model.checkType!,
                                _model.groupWeekValues?.toList()),
                        );
                      });
                    } else if (_model.checkType == '1') {
                      setState(() {
                        _model.updateDataUpdateStruct(
                          (e) => e
                            ..cron = functions.limitPublished(_model.checkType!,
                                _model.groupWeekValues?.toList()),
                        );
                      });
                    } else {
                      setState(() {
                        _model.updateDataUpdateStruct(
                          (e) => e
                            ..cron = functions.limitPublished(_model.checkType!,
                                _model.groupWeekValues?.toList()),
                        );
                      });
                    }

                    setState(() {
                      _model.requestUpdate = RequestWorkflowsCreateStruct(
                        name: _model.dataUpdate?.name,
                        description: _model.dataUpdate?.description,
                        status: _model.dataUpdate?.status,
                        remind: _model.dataUpdate?.remind,
                        limitPublished: _model.dataUpdate?.limitPublished,
                        remind2: _model.dataUpdate?.remind2,
                        remindInSecond: _model.dataUpdate?.remindInSecond,
                        id: _model.dataUpdate?.id,
                        cron: functions.limitPublished(
                            _model.checkType!, _model.checkCron.toList()),
                      );
                    });
                    while (_model.loop < _model.dataUpdate!.staffs.length) {
                      setState(() {
                        _model.updateRequestUpdateStruct(
                          (e) => e
                            ..updateStaffs(
                              (e) => e.add(StaffsStepStruct(
                                staffsId: StaffIdStruct(
                                  id: (_model.dataUpdate?.staffs[_model.loop])
                                      ?.staffsId
                                      .id,
                                ),
                              )),
                            )
                            ..departments = [],
                        );
                      });
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    while (
                        _model.loop < _model.dataUpdate!.departments.length) {
                      setState(() {
                        _model.updateRequestUpdateStruct(
                          (e) => e
                            ..updateDepartments(
                              (e) => e.add(DepartmentsIdStruct(
                                departmentsId: DepartmentsStruct(
                                  id: (_model.dataUpdate
                                          ?.departments[_model.loop])
                                      ?.departmentsId
                                      .id,
                                ),
                              )),
                            )
                            ..staffs = [],
                        );
                      });
                      setState(() {
                        _model.loop = _model.loop + 1;
                      });
                    }
                    setState(() {
                      _model.loop = 0;
                    });
                    _model.apiResultUpdate =
                        await ProcedureTemplateGroup.workflowUpdateCall.call(
                      accessToken: FFAppState().accessToken,
                      requestDataJson: _model.requestUpdate?.toMap(),
                    );
                    shouldSetState = true;
                    if ((_model.apiResultUpdate?.succeeded ?? true)) {
                      _model.apiResultDeleteStep = await ProcedureTemplateGroup
                          .deleteWorkflowsStepCall
                          .call(
                        accessToken: FFAppState().accessToken,
                        workflowsId: widget.itemData?.id,
                        stepIdList: _model.stepDelete,
                      );
                      shouldSetState = true;
                      if ((_model.apiResultDeleteStep?.succeeded ?? true)) {
                        while (_model.loop < _model.stepList.length) {
                          setState(() {
                            _model.updateStepListAtIndex(
                              _model.loop,
                              (e) => e..number = _model.loop + 1,
                            );
                          });
                          setState(() {
                            _model.loop = _model.loop + 1;
                          });
                        }
                        setState(() {
                          _model.loop = 0;
                        });
                        while (_model.loop < _model.stepList.length) {
                          if (_model.stepList[_model.loop].id != '') {
                            setState(() {
                              _model
                                  .addToCreateUpdate(WorkflowsStepCreateStruct(
                                id: _model.stepList[_model.loop].id,
                                name: _model.stepList[_model.loop].name,
                                status: _model.stepList[_model.loop].status,
                                description:
                                    _model.stepList[_model.loop].description,
                                executeType:
                                    _model.stepList[_model.loop].executeType,
                                actionType:
                                    _model.stepList[_model.loop].actionType,
                                staffsAlias:
                                    _model.stepList[_model.loop].staffsAlias,
                                timeOperate:
                                    _model.stepList[_model.loop].timeOperate,
                                estimateInSecond: _model
                                    .stepList[_model.loop].estimateInSecond,
                                number: _model.stepList[_model.loop].number,
                              ));
                            });
                            while (_model.loop2 <
                                _model.stepList[_model.loop].staffs.length) {
                              setState(() {
                                _model.updateCreateUpdateAtIndex(
                                  _model.createUpdate.length - 1,
                                  (e) => e
                                    ..updateStaffs(
                                      (e) => e.add(StaffsStepStruct(
                                        staffsId: StaffIdStruct(
                                          id: _model.stepList[_model.loop]
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
                                _model
                                    .stepList[_model.loop].departments.length) {
                              setState(() {
                                _model.updateCreateUpdateAtIndex(
                                  _model.createUpdate.length - 1,
                                  (e) => e
                                    ..updateDepartments(
                                      (e) => e.add(DepartmentListStruct(
                                        departmentsId: DepartmentsStruct(
                                          id: _model
                                              .stepList[_model.loop]
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
                            while (_model.loop2 <
                                _model
                                    .stepList[_model.loop].operations.length) {
                              if (_model.stepList[_model.loop]
                                          .operations[_model.loop2].id !=
                                      '') {
                                setState(() {
                                  _model.updateCreateUpdateAtIndex(
                                    _model.createUpdate.length - 1,
                                    (e) => e
                                      ..updateOperations(
                                        (e) => e.add(OperationsStruct(
                                          content: _model.stepList[_model.loop]
                                              .operations[_model.loop2].content,
                                          actionType: _model
                                              .stepList[_model.loop]
                                              .operations[_model.loop2]
                                              .actionType,
                                          id: _model.stepList[_model.loop]
                                              .operations[_model.loop2].id,
                                        )),
                                      ),
                                  );
                                });
                              } else {
                                setState(() {
                                  _model.updateCreateUpdateAtIndex(
                                    _model.createUpdate.length - 1,
                                    (e) => e
                                      ..updateOperations(
                                        (e) => e.add(OperationsStruct(
                                          content: _model.stepList[_model.loop]
                                              .operations[_model.loop2].content,
                                          actionType: _model
                                              .stepList[_model.loop]
                                              .operations[_model.loop2]
                                              .actionType,
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
                          } else {
                            setState(() {
                              _model.addToCreateStep(WorkflowsStepCreateStruct(
                                name: _model.stepList[_model.loop].name,
                                status: _model.stepList[_model.loop].status,
                                description:
                                    _model.stepList[_model.loop].description,
                                executeType:
                                    _model.stepList[_model.loop].executeType,
                                actionType:
                                    _model.stepList[_model.loop].actionType,
                                staffsAlias:
                                    _model.stepList[_model.loop].staffsAlias,
                                timeOperate:
                                    _model.stepList[_model.loop].timeOperate,
                                estimateInSecond: _model
                                    .stepList[_model.loop].estimateInSecond,
                                number: _model.stepList[_model.loop].number,
                                workflowId: widget.itemData?.id,
                              ));
                            });
                            while (_model.loop2 <
                                _model.stepList[_model.loop].staffs.length) {
                              setState(() {
                                _model.updateCreateStepAtIndex(
                                  _model.createStep.length - 1,
                                  (e) => e
                                    ..updateStaffs(
                                      (e) => e.add(StaffsStepStruct(
                                        staffsId: StaffIdStruct(
                                          id: _model.stepList[_model.loop]
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
                                _model
                                    .stepList[_model.loop].departments.length) {
                              setState(() {
                                _model.updateCreateStepAtIndex(
                                  _model.createStep.length - 1,
                                  (e) => e
                                    ..updateDepartments(
                                      (e) => e.add(DepartmentListStruct(
                                        departmentsId: DepartmentsStruct(
                                          id: _model
                                              .stepList[_model.loop]
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
                            while (_model.loop2 <
                                _model
                                    .stepList[_model.loop].operations.length) {
                              if (_model.stepList[_model.loop]
                                          .operations[_model.loop2].id !=
                                      '') {
                                setState(() {
                                  _model.updateCreateStepAtIndex(
                                    _model.createStep.length - 1,
                                    (e) => e
                                      ..updateOperations(
                                        (e) => e.add(OperationsStruct(
                                          content: _model.stepList[_model.loop]
                                              .operations[_model.loop2].content,
                                          actionType: _model
                                              .stepList[_model.loop]
                                              .operations[_model.loop2]
                                              .actionType,
                                          id: _model.stepList[_model.loop]
                                              .operations[_model.loop2].id,
                                        )),
                                      ),
                                  );
                                });
                              } else {
                                setState(() {
                                  _model.updateCreateStepAtIndex(
                                    _model.createStep.length - 1,
                                    (e) => e
                                      ..updateOperations(
                                        (e) => e.add(OperationsStruct(
                                          content: _model.stepList[_model.loop]
                                              .operations[_model.loop2].content,
                                          actionType: _model
                                              .stepList[_model.loop]
                                              .operations[_model.loop2]
                                              .actionType,
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
                          }

                          setState(() {
                            _model.loop = _model.loop + 1;
                          });
                        }
                        setState(() {
                          _model.loop = 0;
                          _model.loop2 = 0;
                        });
                        while (_model.loop < _model.createStep.length) {
                          _model.apiResultj7m = await ProcedureTemplateGroup
                              .stepCreateWorkflowsCall
                              .call(
                            accessToken: FFAppState().accessToken,
                            requestDataJson:
                                _model.createStep[_model.loop].toMap(),
                          );
                          shouldSetState = true;
                          if ((_model.apiResultj7m?.succeeded ?? true)) {
                            setState(() {});
                          }
                          setState(() {
                            _model.loop = _model.loop + 1;
                          });
                        }
                        setState(() {
                          _model.loop = 0;
                        });
                        while (_model.loop < _model.createUpdate.length) {
                          _model.apiResult2eo =
                              await ProcedureTemplateGroup.stepUpdateCall.call(
                            accessToken: FFAppState().accessToken,
                            requestDataJson:
                                _model.createUpdate[_model.loop].toMap(),
                          );
                          shouldSetState = true;
                          if ((_model.apiResult2eo?.succeeded ?? true)) {
                            setState(() {});
                          }
                          setState(() {
                            _model.loop = _model.loop + 1;
                          });
                        }
                        setState(() {
                          _model.loop = 0;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Lỗi cập nhật dữ liệu!',
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

                      context.pushNamed('ProcedureList');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Lỗi cập nhật dữ liệu!',
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

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Cập nhật quy trình thành công!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
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

                  if (shouldSetState) setState(() {});
                },
                text: 'Lưu',
                options: FFButtonOptions(
                  height: 36.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding: const EdgeInsets.all(0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
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
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: _model.isLoad == true,
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                    unselectedLabelStyle: const TextStyle(),
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textNameTextController,
                                                                focusNode: _model
                                                                    .textNameFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textNameTextController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () async {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateDataUpdateStruct(
                                                                        (e) => e
                                                                          ..name = _model
                                                                              .textNameTextController
                                                                              .text,
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
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText:
                                                                      'Nhập tên quy trình...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .textNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textDescriptionTextController,
                                                        focusNode: _model
                                                            .textDescriptionFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textDescriptionTextController',
                                                          const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            setState(() {
                                                              _model
                                                                  .updateDataUpdateStruct(
                                                                (e) => e
                                                                  ..description =
                                                                      _model
                                                                          .textDescriptionTextController
                                                                          .text,
                                                              );
                                                            });
                                                          },
                                                        ),
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Nhập mô tả...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        maxLines: 2,
                                                        validator: _model
                                                            .textDescriptionTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownRunValueController ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownRunValue ??=
                                                      () {
                                                    if (_model
                                                            .dataUpdate!
                                                            .departments.isNotEmpty) {
                                                      return '1';
                                                    } else if (_model
                                                            .dataUpdate!
                                                            .staffs.isNotEmpty) {
                                                      return '2';
                                                    } else {
                                                      return '0';
                                                    }
                                                  }(),
                                                ),
                                                options: List<String>.from(
                                                    ['0', '1', '2']),
                                                optionLabels: const [
                                                  'Tất cả',
                                                  'Phòng ban',
                                                  'Nhân viên'
                                                ],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .dropDownRunValue = val);
                                                  setState(() {
                                                    _model
                                                        .updateDataUpdateStruct(
                                                      (e) => e
                                                        ..departments = []
                                                        ..staffs = [],
                                                    );
                                                  });
                                                  if (_model.dropDownRunValue ==
                                                      '1') {
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
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                DropdownDepartmentsListWidget(
                                                              dataPar: _model
                                                                  .dataUpdate
                                                                  ?.departments,
                                                              callback:
                                                                  (item) async {
                                                                setState(() {
                                                                  _model
                                                                      .updateDataUpdateStruct(
                                                                    (e) => e
                                                                      ..departments =
                                                                          item!
                                                                              .toList(),
                                                                  );
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else if (_model
                                                          .dropDownRunValue ==
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
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                DropdownUserListWidget(
                                                              dataPar: _model
                                                                  .dataUpdate
                                                                  ?.staffs,
                                                              callback:
                                                                  (item) async {
                                                                await _model
                                                                    .addStaff(
                                                                  context,
                                                                  item: item,
                                                                );
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                },
                                                width: 300.0,
                                                height: 56.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'Khởi chạy',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 0.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 1.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '# Danh sách nhân viên khởi chạy',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                DropdownUserListWidget(
                                                              dataPar: _model
                                                                  .dataUpdate
                                                                  ?.staffs,
                                                              callback:
                                                                  (item) async {
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (_model.dropDownRunValue == '2')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .noColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final listStaff = _model
                                                          .dataUpdate?.staffs
                                                          .toList() ??
                                                      [];
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: listStaff.length,
                                                    itemBuilder: (context,
                                                        listStaffIndex) {
                                                      final listStaffItem =
                                                          listStaff[
                                                              listStaffIndex];
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: listStaffItem
                                                                .staffsId
                                                                .userId
                                                                .firstName,
                                                            options:
                                                                FFButtonOptions(
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              elevation: 3.0,
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '# Danh sác bộ phận khởi chạy',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                DropdownDepartmentsListWidget(
                                                              dataPar: _model
                                                                  .dataUpdate
                                                                  ?.departments,
                                                              callback:
                                                                  (item) async {
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (_model.dropDownRunValue == '1')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .noColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final listStaff = _model
                                                          .dataUpdate
                                                          ?.departments
                                                          .toList() ??
                                                      [];
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: listStaff.length,
                                                    itemBuilder: (context,
                                                        listStaffIndex) {
                                                      final listStaffItem =
                                                          listStaff[
                                                              listStaffIndex];
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: listStaffItem
                                                                .departmentsId
                                                                .name,
                                                            options:
                                                                FFButtonOptions(
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              elevation: 3.0,
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
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 570.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: const Color(0xFFE0E3E7),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 14.0),
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      24.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .settings_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'Thiết lập cấu hình',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        22.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Thiết lập tuần lặp',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
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
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                            .dropDownCronValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownCronValue ??= functions.checkTypeCron(_model
                                                                          .dataUpdate!
                                                                          .cron),
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
                                                                      setState(
                                                                          () {
                                                                        _model.checkCron =
                                                                            [];
                                                                      });
                                                                      if (_model
                                                                              .dropDownCronValue !=
                                                                          '3') {
                                                                        setState(
                                                                            () {
                                                                          _model.loop =
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
                                                                        setState(
                                                                            () {
                                                                          _model.checkType =
                                                                              _model.dropDownCronValue;
                                                                        });
                                                                      } else {
                                                                        while (_model.loop <
                                                                            6) {
                                                                          setState(
                                                                              () {
                                                                            _model.addToCheckOne(CheckBoxGroupStruct(
                                                                              type: false,
                                                                              title: (_model.loop + 1) < 10 ? '0${(_model.loop + 1).toString()}' : (_model.loop + 1).toString(),
                                                                            ));
                                                                            _model.addToCheckTwo(CheckBoxGroupStruct(
                                                                              type: false,
                                                                              title: (_model.loop + 7) < 10 ? '0${(_model.loop + 7).toString()}' : (_model.loop + 7).toString(),
                                                                            ));
                                                                            _model.addToCheckThrees(CheckBoxGroupStruct(
                                                                              type: false,
                                                                              title: (_model.loop + 13).toString(),
                                                                            ));
                                                                            _model.addToCheckBoxFour(CheckBoxGroupStruct(
                                                                              type: false,
                                                                              title: (_model.loop + 19).toString(),
                                                                            ));
                                                                            _model.addToCheckBoxFive(CheckBoxGroupStruct(
                                                                              type: false,
                                                                              title: (_model.loop + 25).toString(),
                                                                            ));
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            _model.loop =
                                                                                _model.loop + 1;
                                                                          });
                                                                        }
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .addToCheckBoxSix(CheckBoxGroupStruct(
                                                                            type:
                                                                                false,
                                                                            title:
                                                                                '31',
                                                                          ));
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.loop =
                                                                              0;
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.checkType =
                                                                              _model.dropDownCronValue;
                                                                        });
                                                                      }
                                                                    },
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        60.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Vui lòng chọn lặp',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        1.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        1.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                                              width: double
                                                                  .infinity,
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
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
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
                                                                            setState(() {
                                                                              _model.loop = 0;
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
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() =>
                                                                                _model.groupWeekValueController?.value = []);
                                                                            setState(() {
                                                                              _model.checkCron = [];
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
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
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
                                                                            List<String>>(
                                                                      functions.cronToType(_model
                                                                          .dataUpdate!
                                                                          .cron),
                                                                    ),
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    checkboxBorderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                    unselectedTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    checkboxBorderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                    initialized:
                                                                        _model.groupWeekValues !=
                                                                            null,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        if (_model.checkType ==
                                                            '3')
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        10.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Text(
                                                                  '# Danh sách ngày cụ thể trong tháng (chọn một hoặc nhiều)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
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
                                                                        while (_model.loop <
                                                                            6) {
                                                                          setState(
                                                                              () {
                                                                            _model.updateCheckOneAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = true,
                                                                            );
                                                                            _model.updateCheckTwoAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = true,
                                                                            );
                                                                            _model.updateCheckThreesAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = true,
                                                                            );
                                                                            _model.updateCheckBoxFourAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = true,
                                                                            );
                                                                            _model.updateCheckBoxFiveAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = true,
                                                                            );
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            _model.loop =
                                                                                _model.loop + 1;
                                                                          });
                                                                        }
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .updateCheckBoxSixAtIndex(
                                                                            0,
                                                                            (e) => e
                                                                              ..type = true,
                                                                          );
                                                                        });
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
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
                                                                        while (_model.loop <
                                                                            6) {
                                                                          setState(
                                                                              () {
                                                                            _model.updateCheckOneAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = false,
                                                                            );
                                                                            _model.updateCheckTwoAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = false,
                                                                            );
                                                                            _model.updateCheckThreesAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = false,
                                                                            );
                                                                            _model.updateCheckBoxFourAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = false,
                                                                            );
                                                                            _model.updateCheckBoxFiveAtIndex(
                                                                              _model.loop,
                                                                              (e) => e..type = false,
                                                                            );
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            _model.loop =
                                                                                _model.loop + 1;
                                                                          });
                                                                        }
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .updateCheckBoxSixAtIndex(
                                                                            0,
                                                                            (e) => e
                                                                              ..type = false,
                                                                          );
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.loop =
                                                                              0;
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
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
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listOne = _model
                                                                          .checkOne
                                                                          .toList();
                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listOne.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(width: 4.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listOneIndex) {
                                                                          final listOneItem =
                                                                              listOne[listOneIndex];
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.15,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.checkBoxToggleModels1.getModel(
                                                                                    '${listOneItem.title}${listOneItem.type.toString()}',
                                                                                    listOneIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: CheckBoxToggleWidget(
                                                                                    key: Key(
                                                                                      'Keyr0a_${'${listOneItem.title}${listOneItem.type.toString()}'}',
                                                                                    ),
                                                                                    checkParam: listOneItem.type,
                                                                                    callBack: (checkCall) async {
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
                                                                                  listOneItem.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listTwo = _model
                                                                          .checkTwo
                                                                          .toList();
                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listTwo.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(width: 4.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listTwoIndex) {
                                                                          final listTwoItem =
                                                                              listTwo[listTwoIndex];
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.15,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.checkBoxToggleModels2.getModel(
                                                                                    '${listTwoItem.title}${listTwoItem.type.toString()}',
                                                                                    listTwoIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: CheckBoxToggleWidget(
                                                                                    key: Key(
                                                                                      'Keyktf_${'${listTwoItem.title}${listTwoItem.type.toString()}'}',
                                                                                    ),
                                                                                    checkParam: listTwoItem.type,
                                                                                    callBack: (checkCall) async {
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
                                                                                  listTwoItem.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listThree = _model
                                                                          .checkThrees
                                                                          .toList();
                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listThree.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(width: 4.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listThreeIndex) {
                                                                          final listThreeItem =
                                                                              listThree[listThreeIndex];
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.15,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.checkBoxToggleModels3.getModel(
                                                                                    '${listThreeItem.title}${listThreeItem.type.toString()}',
                                                                                    listThreeIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: CheckBoxToggleWidget(
                                                                                    key: Key(
                                                                                      'Keycnd_${'${listThreeItem.title}${listThreeItem.type.toString()}'}',
                                                                                    ),
                                                                                    checkParam: listThreeItem.type,
                                                                                    callBack: (checkCall) async {
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
                                                                                  listThreeItem.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listFour = _model
                                                                          .checkBoxFour
                                                                          .toList();
                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listFour.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(width: 4.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listFourIndex) {
                                                                          final listFourItem =
                                                                              listFour[listFourIndex];
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.15,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.checkBoxToggleModels4.getModel(
                                                                                    '${listFourItem.title}${listFourItem.type.toString()}',
                                                                                    listFourIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: CheckBoxToggleWidget(
                                                                                    key: Key(
                                                                                      'Key6fy_${'${listFourItem.title}${listFourItem.type.toString()}'}',
                                                                                    ),
                                                                                    checkParam: listFourItem.type,
                                                                                    callBack: (checkCall) async {
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
                                                                                  listFourItem.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listFive = _model
                                                                          .checkBoxFive
                                                                          .toList();
                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listFive.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(width: 4.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listFiveIndex) {
                                                                          final listFiveItem =
                                                                              listFive[listFiveIndex];
                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.15,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.checkBoxToggleModels5.getModel(
                                                                                    '${listFiveItem.title}${listFiveItem.type.toString()}',
                                                                                    listFiveIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: CheckBoxToggleWidget(
                                                                                    key: Key(
                                                                                      'Keyoxa_${'${listFiveItem.title}${listFiveItem.type.toString()}'}',
                                                                                    ),
                                                                                    checkParam: listFiveItem.type,
                                                                                    callBack: (checkCall) async {
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
                                                                                  listFiveItem.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
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
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final listSix = _model
                                                                        .checkBoxSix
                                                                        .toList();
                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          listSix
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          const SizedBox(
                                                                              width: 4.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              listSixIndex) {
                                                                        final listSixItem =
                                                                            listSix[listSixIndex];
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.15,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              wrapWithModel(
                                                                                model: _model.checkBoxToggleModels6.getModel(
                                                                                  '${listSixItem.title}${listSixItem.type.toString()}',
                                                                                  listSixIndex,
                                                                                ),
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: CheckBoxToggleWidget(
                                                                                  key: Key(
                                                                                    'Keyoyn_${'${listSixItem.title}${listSixItem.type.toString()}'}',
                                                                                  ),
                                                                                  checkParam: listSixItem.type,
                                                                                  callBack: (checkCall) async {
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
                                                                                listSixItem.title,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
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
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      24.0,
                                                                      16.0,
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
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Theme(
                                                                      data:
                                                                          ThemeData(
                                                                        checkboxTheme:
                                                                            const CheckboxThemeData(
                                                                          visualDensity:
                                                                              VisualDensity.compact,
                                                                          materialTapTargetSize:
                                                                              MaterialTapTargetSize.shrinkWrap,
                                                                          shape:
                                                                              CircleBorder(),
                                                                        ),
                                                                        unselectedWidgetColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      child:
                                                                          Checkbox(
                                                                        value: _model
                                                                            .checkboxValue1 ??= '${_model.dataUpdate?.remind.toString()}' ==
                                                                                '1'
                                                                            ? true
                                                                            : false,
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          setState(() =>
                                                                              _model.checkboxValue1 = newValue!);
                                                                          if (newValue!) {
                                                                            setState(() {
                                                                              _model.updateDataUpdateStruct(
                                                                                (e) => e..remind = 1,
                                                                              );
                                                                            });
                                                                          } else {
                                                                            setState(() {
                                                                              _model.updateDataUpdateStruct(
                                                                                (e) => e..remind = 0,
                                                                              );
                                                                            });
                                                                          }
                                                                        },
                                                                        side:
                                                                            BorderSide(
                                                                          width:
                                                                              2,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        'Thiết lập nhắc trước khi bắt đầu bước:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FontStyle.italic,
                                                                              decoration: TextDecoration.underline,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                          controller:
                                                                              _model.timeHourTextController,
                                                                          focusNode:
                                                                              _model.timeHourFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.timeHourTextController',
                                                                            const Duration(milliseconds: 2000),
                                                                            () async {
                                                                              setState(() {
                                                                                _model.updateDataUpdateStruct(
                                                                                  (e) => e..remindInSecond = functions.timeToMinute(_model.timeHourTextController.text != '' ? _model.timeHourTextController.text : '0', _model.timeMinuteTextController.text != '' ? _model.timeMinuteTextController.text : '0', null),
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
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintText:
                                                                                ' ',
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          validator: _model
                                                                              .timeHourTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.timeMinuteTextController,
                                                                          focusNode:
                                                                              _model.timeMinuteFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.timeMinuteTextController',
                                                                            const Duration(milliseconds: 2000),
                                                                            () async {
                                                                              setState(() {
                                                                                _model.updateDataUpdateStruct(
                                                                                  (e) => e..remindInSecond = functions.timeToMinute(_model.timeHourTextController.text != '' ? _model.timeHourTextController.text : '0', _model.timeMinuteTextController.text != '' ? _model.timeMinuteTextController.text : '0', null),
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
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintText:
                                                                                ' ',
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          validator: _model
                                                                              .timeMinuteTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '(${_model.dataUpdate?.remindInSecond != null ? _model.dataUpdate?.remindInSecond.toString() : '0'} phút)',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      24.0,
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
                                                                          BorderRadius.circular(
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
                                                                      '${_model.dataUpdate?.remind2.toString()}' ==
                                                                              '1'
                                                                          ? true
                                                                          : false,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(() =>
                                                                        _model.checkboxValue2 =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateDataUpdateStruct(
                                                                          (e) => e
                                                                            ..remind2 =
                                                                                1,
                                                                        );
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateDataUpdateStruct(
                                                                          (e) => e
                                                                            ..remind2 =
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
                                                                  'Thiết lập nhắc chuyển bước',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                        decoration:
                                                                            TextDecoration.underline,
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
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Sơ đồ quy trình',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          ProcedureStepCreateWidget(
                                                        callBack:
                                                            (addItem) async {
                                                          setState(() {
                                                            _model.addToStepList(
                                                                WorkflowsStepCreateStruct(
                                                              name:
                                                                  addItem?.name,
                                                              description: addItem
                                                                  ?.description,
                                                              staffs: addItem
                                                                  ?.staffs,
                                                              executeType: addItem
                                                                  ?.executeType,
                                                              actionType: addItem
                                                                  ?.actionType,
                                                              operations: addItem
                                                                  ?.operations,
                                                              status:
                                                                  'published',
                                                              staffsAlias: addItem
                                                                  ?.staffsAlias,
                                                              timeOperate: addItem
                                                                              ?.timeOperate !=
                                                                          null &&
                                                                      addItem?.timeOperate !=
                                                                          ''
                                                                  ? addItem
                                                                      ?.timeOperate
                                                                  : '',
                                                              estimateInSecond:
                                                                  addItem
                                                                          ?.estimateInSecond ?? 0,
                                                            ));
                                                          });
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: 'Bước',
                                            icon: const Icon(
                                              Icons.add,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
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
                                            _model.stepList.toList();
                                        return ReorderableListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listView.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewItem =
                                                listView[listViewIndex];
                                            return Container(
                                              key: ValueKey(
                                                  "ListView_4plixxgx" '_' +
                                                      listViewIndex.toString()),
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
                                                                            'Readex Pro',
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
                                                                    listViewItem.name !=
                                                                                ''
                                                                        ? listViewItem
                                                                            .name
                                                                        : ' ',
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
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
                                                                                ProcedureStepMenuWidget(
                                                                              item: listViewItem,
                                                                              idItem: listViewItem.id != '' ? listViewItem.id : 'null',
                                                                              callBack: (upStep, idItem) async {
                                                                                await _model.updateStep(
                                                                                  context,
                                                                                  item: upStep,
                                                                                  index: listViewIndex,
                                                                                  idItem: idItem,
                                                                                );
                                                                                setState(() {});
                                                                              },
                                                                              callBackDelete: () async {
                                                                                if (listViewItem.id != '') {
                                                                                  setState(() {
                                                                                    _model.removeAtIndexFromStepList(listViewIndex);
                                                                                    _model.addToStepDelete(listViewItem.id);
                                                                                  });
                                                                                } else {
                                                                                  setState(() {
                                                                                    _model.removeAtIndexFromStepList(listViewIndex);
                                                                                  });
                                                                                }
                                                                              },
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
                                            );
                                          },
                                          onReorder: (int reorderableOldIndex,
                                              int reorderableNewIndex) async {
                                            _model.updateListView =
                                                await actions.reorderItems(
                                              _model.stepList.toList(),
                                              reorderableOldIndex,
                                              reorderableNewIndex,
                                            );
                                            setState(() {
                                              _model.stepList = _model
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
      ),
    );
  }
}
