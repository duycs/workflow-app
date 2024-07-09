import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'filter_programs_model.dart';
export 'filter_programs_model.dart';

class FilterProgramsWidget extends StatefulWidget {
  const FilterProgramsWidget({
    super.key,
    required this.callBack,
    String? domain,
    String? author,
    String? category,
    String? priceMin,
    String? priceMax,
    required this.listDomain,
    String? checkPrice,
    String? checkPrice1,
    String? priceMin1,
    String? priceMax1,
    required this.checkAuthor,
  })  : domain = domain ?? '',
        author = author ?? '',
        category = category ?? '',
        priceMin = priceMin ?? '',
        priceMax = priceMax ?? '',
        checkPrice = checkPrice ?? '',
        checkPrice1 = checkPrice1 ?? '',
        priceMin1 = priceMin1 ?? '',
        priceMax1 = priceMax1 ?? '';

  final Future Function(
      String? domain,
      String? author,
      String? category,
      String? priceMin,
      String? priceMax,
      String? priceMin1,
      String? priceMax1)? callBack;
  final String domain;
  final String author;
  final String category;
  final String priceMin;
  final String priceMax;
  final List<String>? listDomain;
  final String checkPrice;
  final String checkPrice1;
  final String priceMin1;
  final String priceMax1;
  final String? checkAuthor;

  @override
  State<FilterProgramsWidget> createState() => _FilterProgramsWidgetState();
}

class _FilterProgramsWidgetState extends State<FilterProgramsWidget> {
  late FilterProgramsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterProgramsModel());

    _model.authorTextController ??= TextEditingController(
        text: (widget.author != '') &&
                (widget.author != 'noData')
            ? widget.author
            : '');
    _model.authorFocusNode ??= FocusNode();

    _model.categoryTextController ??= TextEditingController(
        text: (widget.category != '') &&
                (widget.category != 'noData')
            ? widget.category
            : '');
    _model.categoryFocusNode ??= FocusNode();

    _model.priceMinTextController ??= TextEditingController(
        text: (widget.priceMin != '') &&
                (widget.priceMin != 'noData')
            ? widget.priceMin
            : '');
    _model.priceMinFocusNode ??= FocusNode();

    _model.priceMaxTextController ??= TextEditingController(
        text: (widget.priceMax != '') &&
                (widget.priceMax != 'noData')
            ? widget.priceMax
            : '');
    _model.priceMaxFocusNode ??= FocusNode();

    _model.priceMin1TextController ??= TextEditingController(
        text: (widget.priceMin1 != '') &&
                (widget.priceMin1 != 'noData')
            ? widget.priceMin1
            : '');
    _model.priceMin1FocusNode ??= FocusNode();

    _model.priceMax1TextController ??= TextEditingController(
        text: (widget.priceMax1 != '') &&
                (widget.priceMax1 != 'noData')
            ? widget.priceMax1
            : '');
    _model.priceMax1FocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bộ lọc',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.clear,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.checkPrice != 'free1')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.domainValueController ??=
                            FormFieldController<String>(
                          _model.domainValue ??=
                              (widget.domain != '') &&
                                      (widget.domain != 'noData')
                                  ? widget.domain
                                  : '',
                        ),
                        options: widget.listDomain!,
                        onChanged: (val) =>
                            setState(() => _model.domainValue = val),
                        width: 300.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        searchTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Lĩnh vực',
                        searchHintText: 'Tìm kiếm...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: true,
                        isMultiSelect: false,
                      ),
                    ),
                  if (widget.checkAuthor == null || widget.checkAuthor == '')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: TextFormField(
                        controller: _model.authorTextController,
                        focusNode: _model.authorFocusNode,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Tác giả',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                            ),
                        validator: _model.authorTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: TextFormField(
                      controller: _model.categoryTextController,
                      focusNode: _model.categoryFocusNode,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Danh mục',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito Sans',
                            letterSpacing: 0.0,
                          ),
                      validator: _model.categoryTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  if ((widget.checkPrice1 == 'checkPriceListList') ||
                      (widget.checkPrice == 'free1'))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        'Khoảng giá',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  if ((widget.checkPrice1 == 'checkPriceListList') ||
                      (widget.checkPrice == 'free1'))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Từ: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.priceMinTextController,
                                    focusNode: _model.priceMinFocusNode,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _model.check1 == '1'
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        .priceMinTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Đến: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.priceMaxTextController,
                                    focusNode: _model.priceMaxFocusNode,
                                    autofocus: false,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _model.check1 == '1'
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        .priceMaxTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ),
                  if (_model.check1 == '1')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        'Khoảng giá không hợp lệ: giá trị bắt đầu không thể lớn hơn giá trị kết thúc!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  if ((widget.checkPrice1 == 'checkPriceList') &&
                      (widget.checkPrice != 'free') &&
                      (widget.checkPrice != 'free1'))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        'Khoảng giá',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  if ((widget.checkPrice1 == 'checkPriceList') &&
                      (widget.checkPrice != 'free') &&
                      (widget.checkPrice != 'free1'))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Từ: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.priceMin1TextController,
                                    focusNode: _model.priceMin1FocusNode,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: (_model.check2 == '1') ||
                                                  (_model.check2 == '2')
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        .priceMin1TextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Đến: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.priceMax1TextController,
                                    focusNode: _model.priceMax1FocusNode,
                                    autofocus: false,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: (_model.check2 == '1') ||
                                                  (_model.check2 == '2')
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        .priceMax1TextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ),
                  if (_model.check2 == '1')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        'Khoảng giá không hợp lệ: giá trị bắt đầu không thể lớn hơn giá trị kết thúc!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  if (_model.check2 == '2')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        'Giá Min phải lơn hơn 0!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                ].divide(const SizedBox(height: 16.0)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _model.authorTextController?.clear();
                            _model.categoryTextController?.clear();
                            _model.priceMinTextController?.clear();
                            _model.priceMaxTextController?.clear();
                            _model.priceMin1TextController?.clear();
                            _model.priceMax1TextController?.clear();
                          });
                          await widget.callBack?.call(
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                          );
                          Navigator.pop(context);
                        },
                        text: 'Xoá bộ lọc',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if ((((_model.priceMinTextController.text !=
                                              '') &&
                                      (_model.priceMinTextController.text !=
                                          'noData')) &&
                                  ((_model.priceMaxTextController.text !=
                                              '') &&
                                      (_model.priceMaxTextController.text !=
                                          'noData'))) ||
                              (((_model.priceMin1TextController.text ==
                                              '') &&
                                      (_model.priceMin1TextController.text ==
                                          'noData')) &&
                                  ((_model.priceMax1TextController.text ==
                                              '') &&
                                      (_model.priceMax1TextController.text ==
                                          'noData')))) {
                            if ((String var1, String var2) {
                              return double.parse(var2) >= double.parse(var1);
                            }(_model.priceMinTextController.text,
                                _model.priceMaxTextController.text)) {
                              _model.check1 = '';
                              setState(() {});
                              if (_model.priceMin1TextController.text != '') {
                                if (double.parse(
                                        _model.priceMin1TextController.text) >
                                    0) {
                                  _model.check2 = '';
                                  setState(() {});
                                  await widget.callBack?.call(
                                    _model.domainValue != null &&
                                            _model.domainValue != ''
                                        ? _model.domainValue
                                        : 'noData',
                                    _model.authorTextController.text !=
                                                ''
                                        ? _model.authorTextController.text
                                        : 'noData',
                                    _model.categoryTextController
                                                    .text !=
                                                ''
                                        ? _model.categoryTextController.text
                                        : 'noData',
                                    _model.priceMinTextController
                                                    .text !=
                                                ''
                                        ? _model.priceMinTextController.text
                                        : 'noData',
                                    _model.priceMaxTextController
                                                    .text !=
                                                ''
                                        ? _model.priceMaxTextController.text
                                        : 'noData',
                                    _model.priceMin1TextController
                                                    .text !=
                                                ''
                                        ? _model.priceMin1TextController.text
                                        : 'noData',
                                    _model.priceMax1TextController
                                                    .text !=
                                                ''
                                        ? _model.priceMax1TextController.text
                                        : 'noData',
                                  );
                                  Navigator.pop(context);
                                } else {
                                  _model.check2 = '2';
                                  setState(() {});
                                }
                              } else {
                                await widget.callBack?.call(
                                  _model.domainValue != null &&
                                          _model.domainValue != ''
                                      ? _model.domainValue
                                      : 'noData',
                                  _model.authorTextController.text != ''
                                      ? _model.authorTextController.text
                                      : 'noData',
                                  _model.categoryTextController.text !=
                                              ''
                                      ? _model.categoryTextController.text
                                      : 'noData',
                                  _model.priceMinTextController.text !=
                                              ''
                                      ? _model.priceMinTextController.text
                                      : 'noData',
                                  _model.priceMaxTextController.text !=
                                              ''
                                      ? _model.priceMaxTextController.text
                                      : 'noData',
                                  _model.priceMin1TextController.text !=
                                              ''
                                      ? _model.priceMin1TextController.text
                                      : 'noData',
                                  _model.priceMax1TextController.text !=
                                              ''
                                      ? _model.priceMax1TextController.text
                                      : 'noData',
                                );
                                Navigator.pop(context);
                              }
                            } else {
                              _model.check1 = '1';
                              setState(() {});
                            }
                          } else {
                            if ((((_model.priceMinTextController
                                                    .text ==
                                                '') &&
                                        (_model.priceMinTextController.text ==
                                            'noData')) &&
                                    ((_model.priceMaxTextController
                                                    .text ==
                                                '') &&
                                        (_model.priceMaxTextController.text ==
                                            'noData'))) ||
                                (((_model.priceMin1TextController
                                                    .text !=
                                                '') &&
                                        (_model.priceMin1TextController.text !=
                                            'noData')) &&
                                    ((_model.priceMax1TextController
                                                    .text !=
                                                '') &&
                                        (_model.priceMax1TextController.text !=
                                            'noData')))) {
                              if ((String var1, String var2) {
                                return double.parse(var2) >= double.parse(var1);
                              }(_model.priceMin1TextController.text,
                                  _model.priceMax1TextController.text)) {
                                _model.check2 = '';
                                setState(() {});
                                if (_model.priceMin1TextController.text != '') {
                                  if (double.parse(
                                          _model.priceMin1TextController.text) >
                                      0) {
                                    _model.check2 = '';
                                    setState(() {});
                                    await widget.callBack?.call(
                                      _model.domainValue != null &&
                                              _model.domainValue != ''
                                          ? _model.domainValue
                                          : 'noData',
                                      _model.authorTextController
                                                      .text !=
                                                  ''
                                          ? _model.authorTextController.text
                                          : 'noData',
                                      _model.categoryTextController
                                                      .text !=
                                                  ''
                                          ? _model.categoryTextController.text
                                          : 'noData',
                                      _model.priceMinTextController
                                                      .text !=
                                                  ''
                                          ? _model.priceMinTextController.text
                                          : 'noData',
                                      _model.priceMaxTextController
                                                      .text !=
                                                  ''
                                          ? _model.priceMaxTextController.text
                                          : 'noData',
                                      _model.priceMin1TextController
                                                      .text !=
                                                  ''
                                          ? _model.priceMin1TextController.text
                                          : 'noData',
                                      _model.priceMax1TextController
                                                      .text !=
                                                  ''
                                          ? _model.priceMax1TextController.text
                                          : 'noData',
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    _model.check2 = '2';
                                    setState(() {});
                                  }
                                } else {
                                  await widget.callBack?.call(
                                    _model.domainValue != null &&
                                            _model.domainValue != ''
                                        ? _model.domainValue
                                        : 'noData',
                                    _model.authorTextController.text !=
                                                ''
                                        ? _model.authorTextController.text
                                        : 'noData',
                                    _model.categoryTextController
                                                    .text !=
                                                ''
                                        ? _model.categoryTextController.text
                                        : 'noData',
                                    _model.priceMinTextController
                                                    .text !=
                                                ''
                                        ? _model.priceMinTextController.text
                                        : 'noData',
                                    _model.priceMaxTextController
                                                    .text !=
                                                ''
                                        ? _model.priceMaxTextController.text
                                        : 'noData',
                                    _model.priceMin1TextController
                                                    .text !=
                                                ''
                                        ? _model.priceMin1TextController.text
                                        : 'noData',
                                    _model.priceMax1TextController
                                                    .text !=
                                                ''
                                        ? _model.priceMax1TextController.text
                                        : 'noData',
                                  );
                                  Navigator.pop(context);
                                }
                              } else {
                                _model.check2 = '1';
                                setState(() {});
                              }
                            } else {
                              if (_model.priceMin1TextController.text != '') {
                                if (double.parse(
                                        _model.priceMin1TextController.text) >
                                    0) {
                                  await widget.callBack?.call(
                                    _model.domainValue != null &&
                                            _model.domainValue != ''
                                        ? _model.domainValue
                                        : 'noData',
                                    _model.authorTextController.text !=
                                                ''
                                        ? _model.authorTextController.text
                                        : 'noData',
                                    _model.categoryTextController
                                                    .text !=
                                                ''
                                        ? _model.categoryTextController.text
                                        : 'noData',
                                    _model.priceMinTextController
                                                    .text !=
                                                ''
                                        ? _model.priceMinTextController.text
                                        : 'noData',
                                    _model.priceMaxTextController
                                                    .text !=
                                                ''
                                        ? _model.priceMaxTextController.text
                                        : 'noData',
                                    _model.priceMin1TextController
                                                    .text !=
                                                ''
                                        ? _model.priceMin1TextController.text
                                        : 'noData',
                                    _model.priceMax1TextController
                                                    .text !=
                                                ''
                                        ? _model.priceMax1TextController.text
                                        : 'noData',
                                  );

                                  setState(() {});
                                  Navigator.pop(context);
                                } else {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Thông báo'),
                                                content: const Text(
                                                    'Giá trị min phải lớn hơn 0!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: const Text('Confirm'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  _model.check2 = '2';
                                  setState(() {});
                                }
                              } else {
                                await widget.callBack?.call(
                                  _model.domainValue != null &&
                                          _model.domainValue != ''
                                      ? _model.domainValue
                                      : 'noData',
                                  _model.authorTextController.text != ''
                                      ? _model.authorTextController.text
                                      : 'noData',
                                  _model.categoryTextController.text !=
                                              ''
                                      ? _model.categoryTextController.text
                                      : 'noData',
                                  _model.priceMinTextController.text !=
                                              ''
                                      ? _model.priceMinTextController.text
                                      : 'noData',
                                  _model.priceMaxTextController.text !=
                                              ''
                                      ? _model.priceMaxTextController.text
                                      : 'noData',
                                  _model.priceMin1TextController.text !=
                                              ''
                                      ? _model.priceMin1TextController.text
                                      : 'noData',
                                  _model.priceMax1TextController.text !=
                                              ''
                                      ? _model.priceMax1TextController.text
                                      : 'noData',
                                );
                                Navigator.pop(context);
                              }
                            }
                          }
                        },
                        text: 'Xác nhận',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF33BA45),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
