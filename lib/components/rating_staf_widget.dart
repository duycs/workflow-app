import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'rating_staf_model.dart';
export 'rating_staf_model.dart';

class RatingStafWidget extends StatefulWidget {
  const RatingStafWidget({
    super.key,
    required this.list,
  });

  final List<ReactsMarketStruct>? list;

  @override
  State<RatingStafWidget> createState() => _RatingStafWidgetState();
}

class _RatingStafWidgetState extends State<RatingStafWidget> {
  late RatingStafModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingStafModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          setState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).tertiary,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= widget.list!.isNotEmpty
          ? ((List<String> listItem) {
              return listItem
                      .map(int.parse)
                      .reduce((value, element) => value + element) /
                  listItem.length;
            }(widget.list!.map((e) => e.reactsId.status).toList()))
          : 0.0,
      unratedColor: FlutterFlowTheme.of(context).accent3,
      itemCount: 5,
      itemSize: 11.0,
      glowColor: FlutterFlowTheme.of(context).tertiary,
    );
  }
}
