import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/view/register_account.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/colors.dart';

class PageViewIntro extends StatefulWidget {
  const PageViewIntro({super.key});

  @override
  State<PageViewIntro> createState() => _PageViewIntroState();
}

class _PageViewIntroState extends State<PageViewIntro> {
  final PageController _pageController = PageController();
  int pageindex = 0;
  bool isLastIndex = false;
  List<IntroObject> list = [
    IntroObject(
      photo: 'assets/png/Group.png',
      title: 'Title',
      description:
          'lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum ',
    ),
    IntroObject(
      photo: 'assets/png/tools.png',
      title: 'Title',
      description:
          'lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum ',
    ),
    IntroObject(
      photo: 'assets/png/key.png',
      title: 'Title',
      description:
          'lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum ',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(listenToPage);
  }

  void listenToPage() {
    pageindex = _pageController.pageIndex;
    isLastIndex = pageindex >= list.length - 1;
    setState(() {});
    print('pageindex$pageindex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (p0, p1) => SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: p1.maxHeight / 4,
                            child: Image.asset(list[index].photo)),
                        Expanded(
                          child: Text(
                            list[index].title,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            list[index].description,
                          ),
                        ),
                        SizedBox(width: 0.0, height: p1.maxHeight / 3),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
                width: p1.maxWidth / 7,
                child: ListView.builder(
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var isSame = pageindex == index;
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        width: isSame ? 16 : 10,
                        height: isSame ? 16 : 10,
                        decoration: BoxDecoration(
                            color: isSame ? gold : lightDark.withOpacity(0.7),
                            shape: BoxShape.circle),
                      ),
                    );
                  },
                ),
              ),
              CustomElevatedButton(
                  text: isLastIndex ? 'Done' : 'Next',
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                    if (isLastIndex) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const RegisterAccount();
                        },
                      ));
                    }
                  }),
            ],
          ),
        )),
      ),
    );
  }
}

class IntroObject extends Equatable {
  String photo;
  String title;
  String description;
  IntroObject({
    required this.photo,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [
        photo,
        title,
        description,
      ];

  IntroObject copyWith({
    String? photo,
    String? title,
    String? description,
  }) {
    return IntroObject(
      photo: photo ?? this.photo,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}

extension PageControllerInteger on PageController {
  int get pageIndex => page?.toInt() ?? 0;
}
