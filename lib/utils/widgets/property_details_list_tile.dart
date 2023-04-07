import 'package:flutter/material.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class PropertyDetailsListTile extends StatelessWidget {
  const PropertyDetailsListTile({
    super.key,
    required this.image,
    required this.desc,
    required this.title,
    required this.type,
    this.address,
  });
  final String image;
  final String title;
  final String desc;
  final String type;
  final String? address;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 110,
          height: 110,
          color: gold,
          child: Image.asset(image),
        ),
        const SizedBox(width: 10.0, height: 0.0),
        SizedBox(
          height: 112,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleTextStyle(),
              ),
              if (address == null) const SizedBox(width: 0.0, height: 10.0),
              if (address == null)
                Text(
                  type,
                  style: gooldTextStyle(),
                ),
              Spacer(),
              Container(
                constraints: BoxConstraints(
                  minWidth: size.width / 3,
                  maxWidth: size.width / 2,
                ),
                child: Text(
                  desc,
                  textAlign: TextAlign.start,
                ),
              ),
              if (address != null) const SizedBox(width: 0.0, height: 5.0),
              if (address != null)
                Container(
                  alignment: Alignment.center,
                  width: size.width / 3,
                  height: 30,
                  decoration: BoxDecoration(
                    color: gold,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    address ?? '',
                    style: standardTextStyle(),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
