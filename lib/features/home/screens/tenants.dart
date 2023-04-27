import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

import '../../../router/router.dart';
import 'owners.dart';

class TenantsView extends ConsumerWidget {
  const TenantsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                'Tenants',
                style: titleTextStyle(),
              ),
            ),
            const SizedBox(width: 0.0, height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: size.width / 1.2,
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Search Name'),
                    )),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.filter_alt_rounded,
                    color: gold,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 0.0, height: 12.0),
            Expanded(
              child: ListView.separated(
                itemCount: 7,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 5.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(const TenantDetailsRoute());
                      },
                      child: const OwnersWidget(
                        text: 'Tenant Name',
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
