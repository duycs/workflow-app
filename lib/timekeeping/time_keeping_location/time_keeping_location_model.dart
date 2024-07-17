import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_keeping_location_widget.dart' show TimeKeepingLocationWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TimeKeepingLocationModel
    extends FlutterFlowModel<TimeKeepingLocationWidget> {
  ///  Local state fields for this component.

  AddressListStruct? locationSelect;
  void updateLocationSelectStruct(Function(AddressListStruct) updateFn) {
    updateFn(locationSelect ??= AddressListStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // State field(s) for CheckboxListTile widget.
  Map<AddressListStruct, bool> checkboxListTileValueMap = {};
  List<AddressListStruct> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

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
    return controller..addPageRequestListener(listViewAddressListPage);
  }

  void listViewAddressListPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewAddressListResponse) {
        final pageItems = ((getJsonField(
                  listViewAddressListResponse.jsonBody,
                  r'''$.data''',
                  true,
                )!
                        .toList()
                        .map<AddressListStruct?>(AddressListStruct.maybeFromMap)
                        .toList() as Iterable<AddressListStruct?>)
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
                  lastResponse: listViewAddressListResponse,
                )
              : null,
        );
      });
}
