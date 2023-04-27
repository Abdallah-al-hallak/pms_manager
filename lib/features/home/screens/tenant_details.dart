import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/colors.dart';

import '../../../utils/styles.dart';
import 'owner_details.dart';

class TenantDetails extends ConsumerStatefulWidget {
  const TenantDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends ConsumerState<TenantDetails> {
  final List<OwnerDetailsObject> _ownerDetails = const [
    OwnerDetailsObject(icon: 'assets/png/person.png', details: 'Name'),
    OwnerDetailsObject(icon: 'assets/png/AGE.png', details: 'Age'),
    OwnerDetailsObject(icon: 'assets/png/flag.png', details: 'Nationality'),
    OwnerDetailsObject(icon: 'assets/png/bag.png', details: 'Occupation'),
    OwnerDetailsObject(
        icon: 'assets/png/calender.png', details: 'Date of birth'),
    OwnerDetailsObject(
        icon: 'assets/png/family.png', details: 'Family Members'),
    OwnerDetailsObject(icon: 'assets/png/phone.png', details: 'Phone Number'),
    OwnerDetailsObject(
        icon: 'assets/png/mail.png', details: 'info@example.com'),
  ];
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, p1) {
        return Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tenant Details',
                      style: titleTextStyle(),
                    ),
                    const SizedBox(width: 30.0, height: 0.0),
                    Image.asset('assets/png/edit2.png'),
                  ],
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
              const SizedBox(width: 0.0, height: 12.0),
              SizedBox(
                  height: p1.maxWidth / 8,
                  width: p1.maxWidth / 2,
                  child: CustomElevatedButton(
                    text: 'Add To Archive',
                    onPressed: () {},
                    icon: Icons.add,
                  )),
            ],
          ),
        );
      }),
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
