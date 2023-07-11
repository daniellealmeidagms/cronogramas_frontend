import 'package:flutter/material.dart';

class ReadOneWidget extends StatefulWidget {
  const ReadOneWidget({
    Key? key,
    required this.aulasDoDia,
  }) : super(key: key);

  final String? aulasDoDia;

  @override
  // ignore: library_private_types_in_public_api
  _ReadOneWidgetState createState() => _ReadOneWidgetState();
}

class _ReadOneWidgetState extends State<ReadOneWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF004A8D),
          automaticallyImplyLeading: true,
          title: Text(
            widget.aulasDoDia!,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 437,
                height: 800,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFF004A8D),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: Icon(
                                  Icons.class_,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 0, 5, 0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 0, 0),
                                        child: Text(
                                          'Desenvolvedor WEB',
                                          textAlign: TextAlign.center,
                                          maxLines: 100,
                                        ),
                                      ),
                                      Text(
                                        widget.aulasDoDia!,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30, 50, 30, 20),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30, 20, 30, 20),
                            ),
                          ],
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
    );
  }
}
