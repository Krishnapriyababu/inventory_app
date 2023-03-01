import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/models/stock_report_model.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key, required this.title, required this.report});

  final String title;
  final List<StockReportModel> report;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35.h,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
                //Hide the gridlines of y-axis
                majorGridLines: const MajorGridLines(width: 0),
                //Hide the axis line of y-axis
                axisLine: const AxisLine(width: 0)),
            title: ChartTitle(text: title, alignment: ChartAlignment.near),
            //Chart title.
            legend: Legend(isVisible: false),

            // Enables the legend.
            tooltipBehavior: TooltipBehavior(enable: true),
            // Enables the tooltip.
            series: <LineSeries<StockReportModel, String>>[
              LineSeries<StockReportModel, String>(
                  dataSource: report,
                  color: const Color(0xFFd9cb7e),
                  xValueMapper: (StockReportModel sales, _) => sales.day,
                  yValueMapper: (StockReportModel sales, _) => sales.stockCount,
                  // dataLabelSettings: const DataLabelSettings(isVisible: true),
                  markerSettings: const MarkerSettings(
                      isVisible: true,
                      // Marker shape is set to diamond
                      shape: DataMarkerType.circle,
                      color: Color(0xFF79c797),
                      borderColor: Color(0xFF79c797))
                  )
            ]));
  }
}
