import 'package:elrawdah/constants.dart';
import 'package:elrawdah/screens/home_page.dart';
import 'package:elrawdah/screens/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    // PageModel(
    //   widget: DecoratedBox(
    //     decoration: BoxDecoration(
    //       color: Colors.indigo,
    //       border: Border.all(
    //         width: 0.0,
    //         color: Colors.indigo,
    //       ),
    //     ),
    //     child: SingleChildScrollView(
    //       controller: ScrollController(),
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 45.0,
    //               vertical: 90.0,
    //             ),
    //             child: Image.asset(
    //               fogira,
    //               // color: pageImageColor,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'SECURED BACKUP',
    //                 style: pageTitleStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
    //                 style: pageInfoStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'من خلال التطور الملحوظ الذي تشهده الإمارة في زيادة عمليات البنى التحتية،\n قامت بلدية الفجيرة باستخدام نظم المعلومات الجغرافية \n للتسهيل في عملية التخطيط وإدارة المناطق، \n فعملية تخطيط المدن وإدارتها ليست عملية بسيطة فهي تحتاج \n إلى عدة خطوات والى عدة دراسات حتى تظهر المنطقة \n بشكل ملائم متوافقة مع جميع العوامل التي تحتويها.\n سابقاً كانت تتم يدوياً وهذا يتطلب عوامل عدة \n من جهد وعمل وأيدي عاملة،\n ونتيجة لإدخال هذه المنظومة المتطورة ساعدت في حساب هذه العوامل وأهمها عامل السرعة والدقة في إخراج النتائج، كما ساعدت في عرض خطوط الخدمات تحت الأرض مثل كابلات الكهرباء والماء وأنابيب المياه وشبكات الاتصالات،',
    //                 style: pageInfoStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
    //                 style: pageInfoStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
    //                 style: pageInfoStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.indigo,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  // horizontal: 45.0,
                  vertical: 70.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset(
                        slogin,

                        fit: BoxFit.contain,
                        //  color: pageImageColor
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset(
                        fogira,
                        alignment: Alignment.centerRight,
                        fit: BoxFit.contain,
                        //  color: pageImageColor
                      ),
                    ),
                  ],
                ),
              ),
              buildPoint(
                  'من خلال التطور الملحوظ الذي تشهده الإمارة في زيادة عمليات البنى التحتية، قامت بلدية الفجيرة باستخدام نظم المعلومات الجغرافية للتسهيل في عملية التخطيط وإدارة المناطق، فعملية تخطيط المدن وإدارتها ليست عملية بسيطة فهي تحتاج إلى عدة خطوات والى عدة دراسات حتى تظهر المنطقة بشكل ملائم متوافقة مع جميع العوامل التي تحتويها. سابقاً كانت تتم يدوياً وهذا يتطلب عوامل عدة من جهد وعمل وأيدي عاملة، ونتيجة لإدخال هذه المنظومة المتطورة ساعدت في حساب هذه العوامل وأهمها عامل السرعة والدقة في إخراج النتائج، كما ساعدت في عرض خطوط الخدمات تحت الأرض مثل كابلات الكهرباء والماء وأنابيب المياه وشبكات الاتصالات،'),
              buildPoint('مهام واعمال القسم GIS'),
              buildPoint(
                'ساهم القسم في عملية التخطيط وتوفير قاعدة بيانية متكاملة لإمارة الفجيرة من حيث البيانات الجغرافية أو الوصفية، كما ساهم في سهولة التعامل مع هذه البيانات وتحويلها إلى قواعد يمكن قراءتها على برامج متعددة.',
              ),
              buildPoint(
                  'تأسيس شبكة control point الخاصة بقياسات الأرض التي تغطي كامل الإمارة .'),
              buildPoint(
                  'ويقوم القسم بتوفير الخرائط المتعددة الاستعمال وإصدار مخططات الأراضي بمختلف استخداماتها من سكنية، تجارية، زراعية، صناعية وإصدار الملكيات عليها.'),
            ],
          ),
        ),
      ),
    ),
    // PageModel(
    //   widget: DecoratedBox(
    //     decoration: BoxDecoration(
    //       color: Colors.indigo,
    //       border: Border.all(
    //         width: 0.0,
    //         color: Colors.indigo,
    //       ),
    //     ),
    //     child: SingleChildScrollView(
    //       controller: ScrollController(),
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 45.0,
    //               vertical: 90.0,
    //             ),
    //             child: Image.asset(
    //               logo,
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'EASY ACCESS',
    //                 style: pageTitleStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: Text(
    //                 'Reach your files anytime from any devices anywhere',
    //                 style: pageInfoStyle,
    //                 textAlign: TextAlign.left,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  ];
  var fontSize;
  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => const HomePage()),
              (route) => false);
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => const HomePage()),
              (route) => false);
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  width: 0.0,
                  color: Colors.indigo,
                ),
              ),
              child: ColoredBox(
                color: Colors.indigo,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      // index == pagesLength - 1
                      //     ? _signupButton
                      //     :
                      _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

var res = """
    • من خلال التطور الملحوظ الذي تشهده الإمارة في زيادة عمليات البنى التحتية، قامت بلدية الفجيرة باستخدام نظم المعلومات الجغرافية للتسهيل في عملية التخطيط وإدارة المناطق، فعملية تخطيط المدن وإدارتها ليست عملية بسيطة فهي تحتاج إلى عدة خطوات والى عدة دراسات حتى تظهر المنطقة بشكل ملائم متوافقة مع جميع العوامل التي تحتويها. سابقاً كانت تتم يدوياً وهذا يتطلب عوامل عدة من جهد وعمل وأيدي عاملة، ونتيجة لإدخال هذه المنظومة المتطورة ساعدت في حساب هذه العوامل وأهمها عامل السرعة والدقة في إخراج النتائج، كما ساعدت في عرض خطوط الخدمات تحت الأرض مثل كابلات الكهرباء والماء وأنابيب المياه وشبكات الاتصالات،
    • مهام واعمال القسم GIS
    • ساهم القسم في عملية التخطيط وتوفير قاعدة بيانية متكاملة لإمارة الفجيرة من حيث البيانات الجغرافية أو الوصفية، كما ساهم في سهولة التعامل مع هذه البيانات وتحويلها إلى قواعد يمكن قراءتها على برامج متعددة.
    • تأسيس شبكة control point الخاصة بقياسات الأرض التي تغطي كامل الإمارة .
    • ويقوم القسم بتوفير الخرائط المتعددة الاستعمال وإصدار مخططات الأراضي بمختلف استخداماتها من سكنية، تجارية، زراعية، صناعية وإصدار الملكيات عليها.""";

// import 'package:flutter/material.dart';

// class ArabicTextScreen extends StatelessWidget {
//   const ArabicTextScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('استخدام نظم المعلومات الجغرافية في بلدية الفجيرة'),
//       ),
//       body: const SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Text(
//                 'عنوان: استخدام نظم المعلومات الجغرافية في بلدية الفجيرة',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),

//               SizedBox(height: 16),

//               // Main content
//               Text(
//                 '• من خلال التطور الملحوظ الذي تشهده الإمارة في زيادة عمليات البنى التحتية، قامت بلدية الفجيرة باستخدام نظم المعلومات الجغرافية للتسهيل في عملية التخطيط وإدارة المناطق، فعملية تخطيط المدن وإدارتها ليست عملية بسيطة فهي تحتاج إلى عدة خطوات والى عدة دراسات حتى تظهر المنطقة بشكل ملائم متوافقة مع جميع العوامل التي تحتويها. سابقاً كانت تتم يدوياً وهذا يتطلب عوامل عدة من جهد وعمل وأيدي عاملة، ونتيجة لإدخال هذه المنظومة المتطورة ساعدت في حساب هذه العوامل وأهمها عامل السرعة والدقة في إخراج النتائج، كما ساعدت في عرض خطوط الخدمات تحت الأرض مثل كابلات الكهرباء والماء وأنابيب المياه وشبكات الاتصالات،',
//               ),

//               SizedBox(height: 16),

//               Text(
//                 '• مهام واعمال القسم GIS',
//                 style: TextStyle(fontSize: 18),
//               ),

//               SizedBox(height: 10),

//               Text(
//                 '• ساهم القسم في عملية التخطيط وتوفير قاعدة بيانية متكاملة لإمارة الفجيرة من حيث البيانات الجغرافية أو الوصفية، كما ساهم في سهولة التعامل مع هذه البيانات وتحويلها إلى قواعد يمكن قراءتها على برامج متعددة.',
//               ),

//               SizedBox(height: 10),

//               Text(
//                 '• تأسيس شبكة control point الخاصة بقياسات الأرض التي تغطي كامل الإمارة .',
//               ),

//               SizedBox(height: 10),

//               Text(
//                 '• ويقوم القسم بتوفير الخرائط المتعددة الاستعمال وإصدار مخططات الأراضي بمختلف استخداماتها من سكنية، تجارية، زراعية، صناعية وإصدار الملكيات عليها.',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
