import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_bar_program_model.dart';
export 'rating_bar_program_model.dart';

class RatingBarProgramWidget extends StatefulWidget {
  const RatingBarProgramWidget({
    super.key,
    this.rating,
  });

  final String? rating;

  @override
  State<RatingBarProgramWidget> createState() => _RatingBarProgramWidgetState();
}

class _RatingBarProgramWidgetState extends State<RatingBarProgramWidget> {
  late RatingBarProgramModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingBarProgramModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      initialRating: _model.ratingBarValue ??=
          functions.stringToInt(widget!.rating!).toDouble(),
      unratedColor: FlutterFlowTheme.of(context).accent3,
      itemCount: 5,
      itemSize: 14.0,
      glowColor: FlutterFlowTheme.of(context).tertiary,
    );
  }
}
