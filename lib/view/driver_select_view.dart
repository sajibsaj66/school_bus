import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/select_bus_time_dto.dart';
import 'package:kumoh_school_bus/model/dto/select_response_dto.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:kumoh_school_bus/view_model/driver_select_view_model.dart';
import 'package:provider/provider.dart';

class DriverSelectView extends StatelessWidget {
  const DriverSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DriverSelectViewModel>(
      create: (_) => DriverSelectViewModel(),
      child: Consumer<DriverSelectViewModel>(
        builder: (context, provider, child) => _DriverSelectPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _DriverSelectPage extends StatefulWidget {
  final DriverSelectViewModel viewModel;

  const _DriverSelectPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  State<_DriverSelectPage> createState() => _DriverSelectPageState();
}

class _DriverSelectPageState extends State<_DriverSelectPage> {
  late final DriverSelectViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: "Kumoh School Bus",
      backgroundImage: const AssetImage("assets/background.png"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _viewModel.selectResponseList.length,
                itemBuilder: (BuildContext context, int index) => SelectBusItem(
                  selectResponse: _viewModel.selectResponseList[index],
                  onSelect: () => _viewModel.onBusSelect(index),
                ),
              ),
            ),
            const SizedBox(width: SizeTheme.paddingLargeSize),
            const Icon(Icons.arrow_right_alt, size: SizeTheme.iconMainSize),
            const SizedBox(width: SizeTheme.paddingLargeSize),
            Flexible(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _viewModel.selectBusTime.selectBusTimeList.length,
                itemBuilder: (BuildContext context, int index) =>
                    SelectBusTimeItem(
                  selectBusTime:
                      _viewModel.selectBusTime.selectBusTimeList[index],
                  onSelect: () => _viewModel.onBusTimeSelect(
                    context,
                    mounted,
                    _viewModel.selectBusTime.selectBusTimeList[index].id,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectBusTimeItem extends StatelessWidget {
  final SelectBusTimeDTO selectBusTime;
  final void Function() onSelect;

  const SelectBusTimeItem(
      {Key? key, required this.selectBusTime, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LeftSideOutlinedButton(
          onPressed: onSelect,
          text: "${selectBusTime.busTimeNum}번 (${selectBusTime.startTime} 출발)",
          iconData: Icons.chevron_right,
        ),
        const SizedBox(height: SizeTheme.paddingMiddleSize)
      ],
    );
  }
}

class SelectBusItem extends StatelessWidget {
  final SelectResponseDTO selectResponse;
  final void Function() onSelect;

  const SelectBusItem(
      {Key? key, required this.selectResponse, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LeftSideOutlinedButton(
          onPressed: onSelect,
          text: selectResponse.busNum,
          iconData: Icons.chevron_right,
        ),
        const SizedBox(height: SizeTheme.paddingMiddleSize)
      ],
    );
  }
}
