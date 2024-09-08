import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3658B1), Color(0xFFC159EC)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 110.0, 0.0, 0.0),
                child: FutureBuilder<List<ForecastRow>>(
                  future: ForecastTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'location_name',
                      'New York',
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ForecastRow> columnForecastRowList = snapshot.data!;

                    final columnForecastRow = columnForecastRowList.isNotEmpty
                        ? columnForecastRowList.first
                        : null;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.location_on,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                columnForecastRow?.locationName,
                                'New York',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                () {
                                  if (functions.getIcon(columnForecastRow!.hourlyCondition[functions.returntemp()]) ==
                                      'thunder') {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/thunder.png?t=2024-06-21T03%3A04%3A04.143Z';
                                  } else if (functions.getIcon(columnForecastRow!.hourlyCondition[functions.returntemp()]) ==
                                      'rainy') {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/rainy.png?t=2024-06-21T03%3A04%3A42.764Z';
                                  } else if (functions.getIcon(columnForecastRow!.hourlyCondition[functions.returntemp()]) ==
                                      'night') {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_icons/night.png';
                                  } else if (functions.getIcon(
                                          columnForecastRow!.hourlyCondition[
                                              functions.returntemp()]) ==
                                      'sunny') {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/sunny.png?t=2024-06-21T03%3A05%3A00.984Z';
                                  } else if (functions.getIcon(
                                          columnForecastRow!.hourlyCondition[
                                              functions.returntemp()]) ==
                                      'overcast') {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/overcast.png';
                                  } else if (functions.getIcon(columnForecastRow!
                                          .hourlyCondition[functions.returntemp()]) ==
                                      'cloudy') {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/cloudy.png?t=2024-06-21T03%3A05%3A30.685Z';
                                  } else {
                                    return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/sunny.png?t=2024-06-21T03%3A05%3A00.984Z';
                                  }
                                }(),
                                'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/sunny.png?t=2024-06-21T03%3A05%3A00.984Z',
                              ),
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          '${functions.floor(columnForecastRow?.hourlyTemp?[functions.returntemp()]).toString()} °C',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 38.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            columnForecastRow?.conditionText,
                            'Sunny',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Max: ${columnForecastRow?.maxTempC?.toString()}°C',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Min: ${columnForecastRow?.minTempC?.toString()}°C',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/House_4_3.png',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3658B1), Color(0xFFC159EC)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      45.0, 10.0, 45.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Today',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Text(
                                          dateTimeFormat(
                                              "yMMMd", getCurrentTimestamp),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 2.0,
                                color: Colors.white,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final timeof = functions
                                                  .newCustomFunction()
                                                  .toList();

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children:
                                                    List.generate(timeof.length,
                                                        (timeofIndex) {
                                                  final timeofItem =
                                                      timeof[timeofIndex];
                                                  return Container(
                                                    width: 80.0,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Text(
                                                          timeofItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final condition =
                                                  columnForecastRow
                                                          ?.hourlyCondition
                                                          ?.toList() ??
                                                      [];

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: List.generate(
                                                    condition.length,
                                                    (conditionIndex) {
                                                  final conditionItem =
                                                      condition[conditionIndex];
                                                  return Container(
                                                    width: 80.0,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              () {
                                                                if (functions
                                                                        .getIcon(
                                                                            conditionItem) ==
                                                                    'thunder') {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/thunder.png?t=2024-06-21T03%3A04%3A04.143Z';
                                                                } else if (functions
                                                                        .getIcon(
                                                                            conditionItem) ==
                                                                    'rainy') {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/rainy.png?t=2024-06-21T03%3A04%3A42.764Z';
                                                                } else if (functions
                                                                        .getIcon(
                                                                            conditionItem) ==
                                                                    'night') {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_icons/night.png';
                                                                } else if (functions
                                                                        .getIcon(
                                                                            conditionItem) ==
                                                                    'sunny') {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/sunny.png?t=2024-06-21T03%3A05%3A00.984Z';
                                                                } else if (functions
                                                                        .getIcon(
                                                                            conditionItem) ==
                                                                    'overcast') {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/overcast.png';
                                                                } else if (functions
                                                                        .getIcon(
                                                                            conditionItem) ==
                                                                    'cloudy') {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/cloudy.png?t=2024-06-21T03%3A05%3A30.685Z';
                                                                } else {
                                                                  return 'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/sunny.png?t=2024-06-21T03%3A05%3A00.984Z';
                                                                }
                                                              }(),
                                                              'https://ixuekrhnhuktwlaqupee.supabase.co/storage/v1/object/public/weather_assets/sunny.png?t=2024-06-21T03%3A05%3A00.984Z',
                                                            ),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final temp = columnForecastRow
                                                      ?.hourlyTemp
                                                      ?.toList() ??
                                                  [];

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: List.generate(
                                                    temp.length, (tempIndex) {
                                                  final tempItem =
                                                      temp[tempIndex];
                                                  return Container(
                                                    width: 80.0,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '${tempItem}°C',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
