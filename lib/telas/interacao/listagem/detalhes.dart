import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF432EFD),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'TURMAS',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 389,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Container(
                    width: 178,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'ID',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 237,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'DATA DE INICIO / DATA DE ENCERRAMENTO',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 330,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'QUANTIDADE DE VAGAS DISPONIVEIS',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 376,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'POLO',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
