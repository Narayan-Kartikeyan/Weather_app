import '../database.dart';

class ForecastTable extends SupabaseTable<ForecastRow> {
  @override
  String get tableName => 'forecast';

  @override
  ForecastRow createRow(Map<String, dynamic> data) => ForecastRow(data);
}

class ForecastRow extends SupabaseDataRow {
  ForecastRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ForecastTable();

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  double? get maxTempC => getField<double>('max_temp_c');
  set maxTempC(double? value) => setField<double>('max_temp_c', value);

  double? get minTempC => getField<double>('min_temp_c');
  set minTempC(double? value) => setField<double>('min_temp_c', value);

  double? get avgTempC => getField<double>('avg_temp_c');
  set avgTempC(double? value) => setField<double>('avg_temp_c', value);

  String? get conditionText => getField<String>('condition_text');
  set conditionText(String? value) => setField<String>('condition_text', value);

  int get forecastId => getField<int>('forecast_id')!;
  set forecastId(int value) => setField<int>('forecast_id', value);

  String? get locationName => getField<String>('location_name');
  set locationName(String? value) => setField<String>('location_name', value);

  List<String> get hourlyTemp => getListField<String>('hourly_temp');
  set hourlyTemp(List<String>? value) =>
      setListField<String>('hourly_temp', value);

  List<String> get hourlyCondition => getListField<String>('hourly_condition');
  set hourlyCondition(List<String>? value) =>
      setListField<String>('hourly_condition', value);

  List<String> get hourlyConditionIcon =>
      getListField<String>('hourly_condition_icon');
  set hourlyConditionIcon(List<String>? value) =>
      setListField<String>('hourly_condition_icon', value);
}
