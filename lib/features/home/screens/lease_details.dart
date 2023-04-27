import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/property_details/side_menu/add_attachments.dart';
import 'package:pms_manager/features/property_details/side_menu/rating.dart';
import 'package:pms_manager/features/property_details/side_menu/reminders.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

import '../../../utils/helper/theme_helper.dart';

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
        child: SingleChildScrollView(
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
  attachments,
  rating,
}

extension BodyWidgetExtension on LeaseSidebarWidgets {
  Widget get displayWidget {
    switch (this) {
      case LeaseSidebarWidgets.contract:
        return const ContractWidget();
      case LeaseSidebarWidgets.tenant:
        return const TenantWidget();
      case LeaseSidebarWidgets.parking:
        return const ParkingWidget();
      case LeaseSidebarWidgets.expenses:
        return const ExpenseWidget();
      case LeaseSidebarWidgets.reminders:
        return const RemindersPage();
      case LeaseSidebarWidgets.attachments:
        return const AddAttachmentsPage();
      case LeaseSidebarWidgets.rating:
        return const RatingPage();
    }
  }
}

class LeaseFieldsTemplate extends ConsumerWidget {
  const LeaseFieldsTemplate({super.key, required this.widget, this.height});
  final Widget widget;
  final double? height;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: height ?? size.width / 5.5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: widget,
        ),
      ),
    );
  }
}

class ContractWidget extends ConsumerStatefulWidget {
  const ContractWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContractWidgetState();
}

class _ContractWidgetState extends ConsumerState<ContractWidget> {
  var date1 = DateTime.now().toUtc();
  var date2 = DateTime.now().toUtc();
  change(DateTime time) {
    setState(() {
      date1 = time;
    });
  }

  change2(DateTime time) {
    setState(() {
      date2 = time;
    });
  }

  yMD(DateTime time) {
    String formatted = DateFormat('yMd').format(time);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                selectDat(context, DateTime.now(), change);
              },
              child: LeaseFieldsTemplate(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start Date',
                      style: gooldTextStyle(),
                    ),
                    const SizedBox(width: 0.0, height: 5.0),
                    Text('${yMD(date1)}')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectDat(context, DateTime.now(), change);
              },
              child: LeaseFieldsTemplate(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End Date',
                      style: gooldTextStyle(),
                    ),
                    const SizedBox(width: 0.0, height: 5.0),
                    Text('${yMD(date2)}')
                  ],
                ),
              ),
            ),
            LeaseFieldsTemplate(
              widget: GeneralDropDown(
                width: size.width / 1.6,
                list: const ['Furnishing', 'abd', 'ruaa'],
                value: 'Furnishing',
              ),
            ),
            LeaseFieldsTemplate(
              widget: GeneralDropDown(
                width: size.width / 1.6,
                list: const ['Payment Frequency', 'abd', 'ruaa'],
                value: 'Payment Frequency',
              ),
            ),
            const LeaseFieldsTemplate(
                widget: FilterTextFields(
              hint: 'Electricity number',
              trype: TextInputType.number,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rent Amount',
                  style: gooldTextStyle(),
                ),
                const SizedBox(width: 30.0, height: 0.0),
                SizedBox(
                  height: 50,
                  width: size.width / 3.5,
                  child: Card(
                    child: Center(
                        child: Text(
                      '8,000 AED',
                      style: gooldTextStyle(),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 0.0, height: 20.0),
            CustomElevatedButton(text: 'Add contract', onPressed: () {}),
            const SizedBox(width: 0.0, height: 10.0),
            CustomElevatedButton(text: 'Next', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class ExpenseWidget extends ConsumerStatefulWidget {
  const ExpenseWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpenseWidgetState();
}

class _ExpenseWidgetState extends ConsumerState<ExpenseWidget> {
  var date1 = DateTime.now().toUtc();
  var date2 = DateTime.now().toUtc();
  change(DateTime time) {
    setState(() {
      date1 = time;
    });
  }

  change2(DateTime time) {
    setState(() {
      date2 = time;
    });
  }

  yMD(DateTime time) {
    String formatted = DateFormat('yMd').format(time);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                selectDat(context, DateTime.now(), change);
              },
              child: LeaseFieldsTemplate(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start Date',
                      style: gooldTextStyle(),
                    ),
                    const SizedBox(width: 0.0, height: 5.0),
                    Text('${yMD(date1)}')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectDat(context, DateTime.now(), change);
              },
              child: LeaseFieldsTemplate(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End Date',
                      style: gooldTextStyle(),
                    ),
                    const SizedBox(width: 0.0, height: 5.0),
                    Text('${yMD(date2)}')
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rent Amount',
                  style: gooldTextStyle(),
                ),
                const SizedBox(width: 30.0, height: 0.0),
                SizedBox(
                  height: 50,
                  width: size.width / 3.5,
                  child: Card(
                    child: Center(
                        child: Text(
                      '8,000 AED',
                      style: gooldTextStyle(),
                    )),
                  ),
                ),
              ],
            ),
            LeaseFieldsTemplate(
                height: size.width / 2,
                widget: const FilterTextFields(
                  hint: 'Notes',
                )),
            const SizedBox(width: 0.0, height: 20.0),
            CustomElevatedButton(text: 'Next', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class ParkingWidget extends ConsumerStatefulWidget {
  const ParkingWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingWidgetState();
}

class _ParkingWidgetState extends ConsumerState<ParkingWidget> {
  var date1 = DateTime.now().toUtc();
  var date2 = DateTime.now().toUtc();
  change(DateTime time) {
    setState(() {
      date1 = time;
    });
  }

  change2(DateTime time) {
    setState(() {
      date2 = time;
    });
  }

  yMD(DateTime time) {
    String formatted = DateFormat('yMd').format(time);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                selectDat(context, DateTime.now(), change);
              },
              child: LeaseFieldsTemplate(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start Date',
                      style: gooldTextStyle(),
                    ),
                    const SizedBox(width: 0.0, height: 5.0),
                    Text('${yMD(date1)}')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectDat(context, DateTime.now(), change);
              },
              child: LeaseFieldsTemplate(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End Date',
                      style: gooldTextStyle(),
                    ),
                    const SizedBox(width: 0.0, height: 5.0),
                    Text('${yMD(date2)}')
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rent Amount',
                  style: gooldTextStyle(),
                ),
                const SizedBox(width: 30.0, height: 0.0),
                SizedBox(
                  height: 50,
                  width: size.width / 3.5,
                  child: Card(
                    child: Center(
                        child: Text(
                      '8,000 AED',
                      style: gooldTextStyle(),
                    )),
                  ),
                ),
              ],
            ),
            LeaseFieldsTemplate(
                height: size.width / 2,
                widget: const FilterTextFields(
                  hint: 'Notes',
                )),
            const SizedBox(width: 0.0, height: 20.0),
            CustomElevatedButton(
                text: 'Add Another Parking Spot', onPressed: () {
                  AutoRouter.of(context).push(AddParkingSpotRoute());
            }),
            const SizedBox(width: 0.0, height: 10.0),
            CustomElevatedButton(
                text: 'Continue Without Parking Spot', onPressed: () {}),
            const SizedBox(width: 0.0, height: 10.0),
            CustomElevatedButton(text: 'Next', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class TenantWidget extends ConsumerWidget {
  const TenantWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                decoration: ThemeHelper().inputBoxDecorationShadow(),
                child: TextField(
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration(
                    'Owner Name',
                    'Enter Owner Name',
                    const Icon(
                      Icons.qr_code_scanner_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 0.0, height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Tenant Phone',
                style: TextStyle(fontSize: 17),
              ),
              Text('............')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Tenant Email',
                style: TextStyle(fontSize: 17),
              ),
              Text('............')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Tenant Attachments',
                style: TextStyle(fontSize: 17),
              ),
              Text('............')
            ],
          ),
          const SizedBox(width: 0.0, height: 250),
          CustomElevatedButton(text: 'Next', onPressed: () {}),
        ],
      ),
    );
  }
}

class BodyWidget extends ConsumerStatefulWidget {
  const BodyWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends ConsumerState<BodyWidget> {
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
            ),
          ),
          Text(
            'Contract',
            style: TextStyle(
              color: lease == LeaseSidebarWidgets.contract
                  ? Colors.white
                  : lightDark,
            ),
          ),
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
            ),
          ),
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
          Text(
            'Parkinng',
            style: TextStyle(
              color: lease == LeaseSidebarWidgets.parking
                  ? Colors.white
                  : lightDark,
            ),
          ),
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
          Text(
            'Expenses',
            style: TextStyle(
              color: lease == LeaseSidebarWidgets.expenses
                  ? Colors.white
                  : lightDark,
            ),
          ),
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
          Text(
            'Reminders',
            style: TextStyle(
              color: lease == LeaseSidebarWidgets.reminders
                  ? Colors.white
                  : lightDark,
            ),
          ),
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
          Text(
            'Attahment',
            style: TextStyle(
              color: lease == LeaseSidebarWidgets.attachments
                  ? Colors.white
                  : lightDark,
            ),
          ),
          GestureDetector(
              onTap: () {
                ref.read(leaseSidebarWidgetsProvider.notifier).state =
                    LeaseSidebarWidgets.rating;
              },
              child: Image.asset(
                'assets/png/rating.png',
                color: lease == LeaseSidebarWidgets.rating
                    ? Colors.white
                    : lightDark,
              )),
          Text(
            '',
            style: TextStyle(
              color: lease == LeaseSidebarWidgets.rating
                  ? Colors.white
                  : lightDark,
            ),
          ),
        ],
      ),
    );
  }
}
