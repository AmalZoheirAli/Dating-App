
import 'package:portal/Models/location.dart';
import 'package:portal/Models/location_fact.dart';

class MockLocation extends Location{
  MockLocation(String name, String url, List<LocationFact> facts) : super(name, url, facts);


  static Location fetchAny(){
    return Location (
      'تفاصيل الخبر',
      'assets/images/Value-Added-Tax-written-down.png',
      <LocationFact>[
        LocationFact(
          title: 'ما هي ضريبة القيمة المضافة ؟',
          text: 'هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار',
        ),
      ]
      );
  }
}