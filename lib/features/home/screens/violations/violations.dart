import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

import '../../../../utils/styles.dart';

class ViolationsView extends ConsumerStatefulWidget {
  const ViolationsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ViolationsViewState();
}

class _ViolationsViewState extends ConsumerState<ViolationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: gold,
        onPressed: () {
          AutoRouter.of(context).push(const AddViolationViewRoute());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                'Violations',
                style: titleTextStyle(),
              ),
            ),
            const SizedBox(width: 0, height: 30.0),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 15.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return const ViolationsCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ViolationsCard extends ConsumerWidget {
  const ViolationsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: grey1Card,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount',
                style: titleTextStyle(),
              ),
              Text(
                'Date',
                style: titleTextStyle(),
              ),
            ],
          ),
          const SizedBox(width: 0.0, height: 8.0),
          const Text(
            'lorem Ipsum dfgoiegjiloremIpsum psgkferigj afgnergreig asign lorem ipsum',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
