import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'individual_timekeeping_details_widget.dart'
    show IndividualTimekeepingDetailsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class IndividualTimekeepingDetailsModel
    extends FlutterFlowModel<IndividualTimekeepingDetailsWidget> {
  ///  Local state fields for this component.

  String checkShow = '0';

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetShiftDaysPage);
  }

  void listViewGetShiftDaysPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetShiftDaysResponse) {
        final pageItems = ((getJsonField(
                  listViewGetShiftDaysResponse.jsonBody,
                  r'''$.data''',
                  true,
                )!
                        .toList()
                        .map<ShiftdaysStruct?>(ShiftdaysStruct.maybeFromMap)
                        .toList() as Iterable<ShiftdaysStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetShiftDaysResponse,
                )
              : null,
        );
      });
}
