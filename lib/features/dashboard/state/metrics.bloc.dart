import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/api/usecases/fetch.metrics.dart';
import 'package:ladder/api/utils/helpers.dart';
import 'package:ladder/features/dashboard/state/metrics.event.dart';
import 'package:ladder/features/dashboard/state/metrics.state.dart';

class MetricsBloc extends Bloc<MetricsEvent, MetricState> {
  final FetchMetrics fetchMetrics;

  MetricsBloc({required this.fetchMetrics}) : super(const MetricState.initial()) {
    on<FetchMetricsEvent>(_fetchMetrics);
  }

  void _fetchMetrics(FetchMetricsEvent event, Emitter<MetricState> emit) async {
    emit(const MetricState.fetchMetricLoading());

    final result = await fetchMetrics(const NoParam());

    result.fold(
      (l) => emit(MetricState.error(l.message)),
      (r) => emit(MetricState.fetchMetricSuccess(r)),
    );
  }
}
