import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ladder/api/models/metrics.dart';

part 'metrics.state.freezed.dart';

@freezed
class MetricState with _$MetricState {
  const factory MetricState.initial() = _MetricStateInitial;

  const factory MetricState.fetchMetricLoading() = _MetricStateFetchMetricLoading;
  const factory MetricState.fetchMetricSuccess(MetricsModel metrics) = _MetricStateFetchMetricSuccess;

  const factory MetricState.error(String message) = _MetricStateError;
}
