import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/utils/colors.dart';

final leaseSidebarWidgetsProvider = StateProvider<LeaseSidebarWidgets>((ref) {
  return LeaseSidebarWidgets.contract;
});

class BaseLeseDetails extends ConsumerStatefulWidget {
  const BaseLeseDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BaseLeseDetailsState();
}

class _BaseLeseDetailsState extends ConsumerState<BaseLeseDetails> {
  @override
  Widget build(BuildContext context) {
    var leaseSidebarWidgets = ref.watch(leaseSidebarWidgetsProvider);
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: LeaseSidebarWidgets
                    .values[leaseSidebarWidgets.index].displayWidget),
            const Expanded(child: BarWidget()),
          ],
        ),
      ),
    );
  }
}

enum LeaseSidebarWidgets {
  contract,
  tenant,
  parking,
  expenses,
  reminders,
  attachments
}

extension BodyWidgetExtension on LeaseSidebarWidgets {
  Widget get displayWidget {
    switch (this) {
      case LeaseSidebarWidgets.contract:
        return const Center(child: Text('contract'));
      case LeaseSidebarWidgets.tenant:
        return const Center(child: Text('tenant'));
      case LeaseSidebarWidgets.parking:
        return const Text('parking');
      case LeaseSidebarWidgets.expenses:
        return const Text('expenses');
      case LeaseSidebarWidgets.reminders:
        return const Text('reminders');
      case LeaseSidebarWidgets.attachments:
        return const Text('attachments');
    }
  }
}

extension SideWidgetColorExtension on LeaseSidebarWidgets {
  Color get displayColor {
    switch (this) {
      case LeaseSidebarWidgets.contract:
        return Colors.white;
      case LeaseSidebarWidgets.tenant:
        return Colors.white;
      case LeaseSidebarWidgets.parking:
        return Colors.white;
      case LeaseSidebarWidgets.expenses:
        return Colors.white;
      case LeaseSidebarWidgets.reminders:
        return Colors.white;
      case LeaseSidebarWidgets.attachments:
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}

class BodyWidget extends ConsumerStatefulWidget {
  const BodyWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BosyWidgetState();
}

class _BosyWidgetState extends ConsumerState<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: const EdgeInsets.all(12),
      color: Colors.red,
    );
  }
}

class BarWidget extends ConsumerStatefulWidget {
  const BarWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends ConsumerState<BarWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lease = ref.watch(leaseSidebarWidgetsProvider);
    return Container(
      height: size.height / 1.1,
      decoration: const BoxDecoration(
          color: gold,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.contract;
              },
              child: Image.asset(
                'assets/png/contract.png',
                color: lease == LeaseSidebarWidgets.contract
                    ? Colors.white
                    : lightDark,
                scale: 0.8,
              )),
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.tenant;
              },
              child: Image.asset(
                'assets/png/fg.png',
                color: lease == LeaseSidebarWidgets.tenant
                    ? Colors.white
                    : lightDark,
              )),
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.parking;
              },
              child: Image.asset(
                'assets/png/park.png',
                color: lease == LeaseSidebarWidgets.parking
                    ? Colors.white
                    : lightDark,
              )),
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.expenses;
              },
              child: Image.asset(
                'assets/png/expens.png',
                color: lease == LeaseSidebarWidgets.expenses
                    ? Colors.white
                    : lightDark,
              )),
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.reminders;
              },
              child: Image.asset(
                'assets/png/bill.png',
                color: lease == LeaseSidebarWidgets.reminders
                    ? Colors.white
                    : lightDark,
              )),
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.attachments;
              },
              child: Image.asset(
                'assets/png/atach.png',
                color: lease == LeaseSidebarWidgets.attachments
                    ? Colors.white
                    : lightDark,
              )),
        ],
      ),
    );
  }
}
