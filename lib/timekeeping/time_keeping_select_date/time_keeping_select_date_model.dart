import '/flutter_flow/flutter_flow_util.dart';
import 'time_keeping_select_date_widget.dart' show TimeKeepingSelectDateWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TimeKeepingSelectDateModel
    extends FlutterFlowModel<TimeKeepingSelectDateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
