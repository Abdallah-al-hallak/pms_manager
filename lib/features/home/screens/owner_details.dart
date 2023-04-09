import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class OwnerDetails extends StatefulWidget {
  const OwnerDetails({super.key});

  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  final List<OwnerDetailsObject> _ownerDetails = const [
    OwnerDetailsObject(icon: 'assets/png/loc.png', details: 'Name'),
    OwnerDetailsObject(icon: 'assets/png/loc.png', details: 'Address'),
    OwnerDetailsObject(icon: 'assets/png/web.png', details: 'Website'),
    OwnerDetailsObject(icon: 'assets/png/phone.png', details: 'Phone Number'),
    OwnerDetailsObject(
        icon: 'assets/png/mail.png', details: 'info@example.com'),
  ];
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                'Owner Details',
                style: titleTextStyle(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 0.0, height: 10.0);
                },
                itemCount: _ownerDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SquareWidget(
                        image: _ownerDetails[index].icon,
                      ),
                      const SizedBox(width: 30.0, height: 0.0),
                      Text(
                        _ownerDetails[index].details,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareWidget extends StatelessWidget {
  const SquareWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      color: gold,
      child: Image.asset(image),
    );
  }
}

class OwnerDetailsObject extends Equatable {
  final String icon;
  final String details;
  const OwnerDetailsObject({
    required this.icon,
    required this.details,
  });

  @override
  List<Object?> get props => [icon, details];
}
