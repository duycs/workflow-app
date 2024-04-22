// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui';

class ReorderList extends StatefulWidget {
  const ReorderList({
    Key? key,
    this.width,
    this.height,
    required this.list,
    required this.animationColor,
    required this.boxFillColor,
    required this.boxBorderColor,
    required this.icon,
    required this.showDragIcon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> list;
  final Color animationColor;
  final Color boxFillColor;
  final Color boxBorderColor;
  final Widget icon;
  final bool showDragIcon;

  @override
  _ReorderListState createState() => _ReorderListState();
}

class _ReorderListState extends State<ReorderList> {
  @override
  Widget build(BuildContext context) {
    //Se crea una lista temporal con los elementos del parametro list
    var listTemp = widget.list;
    //Si listaResultado es 0 significa que es la primera carga del widget
    //si este es el caso se asigna a la listaTemp los valores iniciales
    //de lo contrario se asigna a listaTemp el estado actual de la lista
    if (FFAppState().listaResultado.length == 0) {
      listTemp = widget.list;
    } else {
      listTemp = FFAppState().listaResultado;
    }

    //Se crea un Decorador para añadir el Shadow al mover un elemento
    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          //Se asigna el color del Shadow de la animación
          final Color draggableItemColor = widget.animationColor;

          //Se regresa el Material del Shadow de la animacion
          return Material(
            elevation: elevation,
            //Se define como transparente para que solo se muestre la Sombra
            color: Color(0xFFFFFF),
            //Se asigna el color de sombra
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

    //Se regresa la Lista con sus elementos.
    return ReorderableListView(
      buildDefaultDragHandles: false,
      proxyDecorator: proxyDecorator,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      //Se crean los hijos de la lista. Uno por cada elemento de listTemp.
      children: <Widget>[
        for (int index = 0; index < listTemp.length; index += 1)
          Padding(
              key: Key('$index'),
              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
              child: Container(
                width: double.infinity,
                height: 60,
                //Se asignan los colores de fondo y del borde.
                decoration: BoxDecoration(
                  color: widget.boxFillColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: widget.boxBorderColor,
                  ),
                ),
                //
                //
                /*
                
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                      //Se asigna el texto a cada elemento
                      '${FFAppState().listaResultado[index]}',
                      style: FlutterFlowTheme.of(context).bodyText1),
                ),
*/
                //
                child: Stack(
                  alignment: AlignmentDirectional(0, 0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(36, 12, 36, 12),
                        child: Text(
                          '${FFAppState().listaResultado[index]}',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: (widget.showDragIcon),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: ReorderableDragStartListener(
                          index: index,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: widget.icon),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //
              )),
      ],
      //Se cambian los indices de la lista al reordenar
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = listTemp.removeAt(oldIndex);
          listTemp.insert(newIndex, item);

          FFAppState().update(() {
            FFAppState().listaResultado = listTemp;
            //FFAppState().lista = listTemp;
          });

          /*FFAppState().update(() {
            FFAppState().listaResultado = FFAppState().listaResultado;
          });*/
        });
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
