import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/util/date_format.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view_model/reservation_view_model.dart';
import 'package:provider/provider.dart';

import '../theme/themes.dart';
import 'common/drawer_app_bar_scaffold.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReservationViewModel>(
      create: (_) => ReservationViewModel(),
      child: Consumer<ReservationViewModel>(
        builder: (context, provider, child) => _ReservationPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _ReservationPage extends StatefulWidget {
  final ReservationViewModel viewModel;

  const _ReservationPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<_ReservationPage> {
  late final ReservationViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: 'Kumoh School Bus',
      backgroundImage: const AssetImage("assets/background.png"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ColorTheme.itemMainColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(SizeTheme.borderRadiusSize),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
                child: Row(
                  children: [
                    const Text("출발 시간:",
                        style: TextStyleTheme.textMainStyleMiddle),
                    const SizedBox(width: SizeTheme.paddingMiddleSize),
                    VanillaDropdownMenu(
                      value: _viewModel.currentTime,
                      items: _viewModel.busTimeList,
                      onChanged: _viewModel.onStartTimeChanged,
                      isExpanded: false,
                    ),
                    const SizedBox(width: SizeTheme.paddingMiddleSize),
                    const Text("소요 시간:",
                        style: TextStyleTheme.textMainStyleMiddle),
                    const SizedBox(width: SizeTheme.paddingMiddleSize),
                    Text("${_viewModel.currentTime.endTime}분",
                        style: TextStyleTheme.textMainStyleMiddle),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    VanillaDropdownMenu(
                      value: _viewModel.bus,
                      items: _viewModel.busList,
                      onChanged: _viewModel.onBusNumChanged,
                      isExpanded: false,
                    ),
                    const SizedBox(width: SizeTheme.paddingMiddleSize),
                    Column(
                      children: [
                        Text(
                          _viewModel.station.sName,
                          style: TextStyleTheme.textMainStyleMiddle,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          dateDayFormat.format(_viewModel.reservationDate),
                          style: TextStyleTheme.textMainStyleMiddle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorTheme.backgroundMainColor,
                border: Border.all(
                  width: 1,
                  color: ColorTheme.backgroundSubColor,
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(SizeTheme.borderRadiusSize),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
                child: VanillaDropdownMenu(
                  value: _viewModel.seat,
                  items: _viewModel.seatList,
                  onChanged: _viewModel.onSeatChanged,
                  isExpanded: true,
                ),
              ),
            ),
            const SizedBox(height: SizeTheme.paddingLargeSize),
            Hero(
              tag: "Button",
              child: CentralOutlinedButton(
                onPressed: () => _viewModel.onReservationButtonClicked(
                  context,
                  mounted,
                ),
                text: "예약 하기",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
