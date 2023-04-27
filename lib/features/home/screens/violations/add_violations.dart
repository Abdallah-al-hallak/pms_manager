import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/features/home/screens/lease_details.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class AddViolationView extends ConsumerStatefulWidget {
  const AddViolationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddViolationViewState();
}

class _AddViolationViewState extends ConsumerState<AddViolationView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, p1) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              'Violations',
              style: titleTextStyle(),
            )),
            const SizedBox(width: 0.0, height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: grey1Card),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Add A Violation',
                        style: titleTextStyle(),
                      ),
                    ),
                    const SizedBox(width: 0.0, height: 10.0),
                    const LeaseFieldsTemplate(
                      widget: FilterTextFields(hint: 'Property Name'),
                    ),
                    const SizedBox(width: 0.0, height: 10.0),
                    const LeaseFieldsTemplate(
                      widget: FilterTextFields(hint: 'Reasons'),
                    ),
                    const SizedBox(width: 0.0, height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(
                          width: 150,
                          child: LeaseFieldsTemplate(
                            widget: FilterTextFields(hint: 'Account'),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: LeaseFieldsTemplate(
                            widget: FilterTextFields(hint: 'Date'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 0.0, height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Paid',
                          style: gooldTextStyle(),
                        ),
                        Text(
                          'Yes',
                          style: gooldTextStyle(),
                        ),
                        Text(
                          'Payment Date',
                          style: gooldTextStyle(),
                        ),
                        Text(
                          'Cash',
                          style: gooldTextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                      child: LeaseFieldsTemplate(
                        widget: FilterTextFields(hint: 'Notes'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
