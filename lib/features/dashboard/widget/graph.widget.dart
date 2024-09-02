import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/features/dashboard/state/metrics.bloc.dart';
import 'package:ladder/features/dashboard/state/metrics.event.dart';
import 'package:ladder/features/dashboard/state/metrics.state.dart';
import 'package:ladder/features/dashboard/widget/custom.graph.dart';
import 'package:ladder/gen/assets.gen.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  @override
  void initState() {
    super.initState();

    context.read<MetricsBloc>().add(FetchMetricsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, MetricState>(
      builder: (_, state) => state.maybeMap(
        orElse: () => SizedBox(
          height: 70.h,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              Assets.images.wallet.path,
              fit: BoxFit.fill,
            ),
          ),
        ),
        fetchMetricSuccess: (state) => state.metrics.totalTransactions == 0
            ? SizedBox(
                height: 70.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.images.wallet.path,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : GainsWidget(
                totalExpenses: state.maybeMap(
                  orElse: () => 20,
                  fetchMetricSuccess: (state) => double.parse(state.metrics.totalExpenses.toString()),
                ),
                totalRevenues: state.maybeMap(
                  orElse: () => 20,
                  fetchMetricSuccess: (state) => double.parse(state.metrics.totalRevenues.toString()),
                ),
                totalTransactions: state.maybeMap(
                  orElse: () => 100,
                  fetchMetricSuccess: (state) => double.parse(state.metrics.totalTransactions.toString()),
                ),
              ),
      ),
    );
  }
}
