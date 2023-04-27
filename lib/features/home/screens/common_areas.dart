import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class CommonAreas extends StatefulWidget {
  const CommonAreas({Key? key}) : super(key: key);

  @override
  State<CommonAreas> createState() => _CommonAreasState();
}


class _CommonAreasState extends State<CommonAreas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: gold,
        onPressed: () {
          // showDialogForPropertytype(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
                child: Column(
                  children: [
                    const SizedBox(width: 0.0, height: 37.0),
                    Center(
                      child: Text(
                        'Common Areas',
                        style: titleTextStyle(),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      // title
                      children: [
                        SizedBox(
                            height: 50,
                            child: Image.asset('assets/png/triangle.png')),
                        const SizedBox(width: 15.0, height: 0.0),
                        Text(
                          'Swimming Pool',
                          style: titleTextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/png/swimming-pool.png',
                              height: 138.35, width: 310.33,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        const SizedBox(width: 0.0, height: 18.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Public Swimming Pool for the building',
                              style: TextStyle(
                                color: textGrey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 0.0, height: 18.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Flexible(
                              child: Text(
                              'Amount per month',
                              style: TextStyle(
                                color: gold,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            ),
                            SizedBox(width: 63.0, height: 0.0),
                            Flexible(
                              child: Text(
                                '8,000 AED',
                                style: TextStyle(
                                  color: gold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 0.0, height: 10.8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              width: 153.28,
                              height: 36,
                              text: 'Expenses',
                              onPressed: () {},
                            ),
                            const SizedBox(width: 18,),
                            CustomElevatedButton(
                              width: 153.28,
                              height: 36,
                              text: 'Reminders',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }

}



showDialogForPropertytype(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return LayoutBuilder(builder: (context, p1) {
        return const PropertyTypeDialogWidget();
      });
    },
  );
}

class PropertyTypeDialogWidget extends ConsumerStatefulWidget {
  const PropertyTypeDialogWidget({super.key});

  @override
  ConsumerState<PropertyTypeDialogWidget> createState() =>
      _PropertyTypeDialogWidgetState();
}

class _PropertyTypeDialogWidgetState
    extends ConsumerState<PropertyTypeDialogWidget> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, p1) {
      return Material(
        color: Colors.white,
        child: Center(
          child: AnimatedContainer(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            height: p1.maxHeight / 1.4,
            width: p1.maxWidth / 1.3,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      );
    });
  }
}
