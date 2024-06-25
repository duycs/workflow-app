import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'newsfeed_detail_widget.dart' show NewsfeedDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class NewsfeedDetailModel extends FlutterFlowModel<NewsfeedDetailWidget> {
  ///  Local state fields for this page.

  NewsfeedListStruct? newsfeedItem;
  void updateNewsfeedItemStruct(Function(NewsfeedListStruct) updateFn) {
    updateFn(newsfeedItem ??= NewsfeedListStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future getOneNewsfeed(BuildContext context) async {
    bool? getOneNewsfeed;
    ApiCallResponse? apiResultGetOneNewsfeed;

    getOneNewsfeed = await action_blocks.tokenReload(context);
    if (getOneNewsfeed!) {
      apiResultGetOneNewsfeed = await NewsfeedGroup.newsfeedOneCall.call(
        accessToken: FFAppState().accessToken,
        id: widget.newsfeedId,
      );

      if ((apiResultGetOneNewsfeed.succeeded ?? true)) {
        newsfeedItem = NewsfeedListStruct.maybeFromMap(getJsonField(
          (apiResultGetOneNewsfeed.jsonBody ?? ''),
          r'''$.data''',
        ));
      }
    } else {
      FFAppState().update(() {});
      return;
    }
  }
}
