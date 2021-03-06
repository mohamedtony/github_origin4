import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  static final double searchRadius = 33.r;
  static final double buttonRadius = 6.r;
  static const double dividerThickness = 0.5;
  static const TextDirection appDirection = TextDirection.rtl;
  static const List<String> terms = [
    'في حالة عدم علمك المسبق بهذا الطلب ننصحك بعدم الموافقة عليه',
    'ننصحك قبل الموافقة على هذا الطلب أو غيره التأكد من قدرتك على الوفاء بمتطلبات العمل ولديك المعرفة الكافية والقدرة على إدارة عملك حسب الصلاحيات الممنوحة لك',
    'هذا التوظيف الخاص هو بين طرفين لهديهما الأهلية الشرعية والقانونية لتحمل ما يقومان به من قرارات',
    'اتعهد أن أقوم بعملي بكل أمانة وأن احافظ على أسرار العمل ولا أقوم بأي قول أو عمل يضر بمن وظفني أو يضر بمنصة ( بي ترند ) وأتحمل المسؤولية المادية والمعنوية عند القيام بخلاف ذلك',
    'قبلت أن أكون موظفاً داخلياً لدى هذا المؤثر بما لا يخالف شروط المنصة العامة وحسب المتفق عليه بيني وبينه ولا تتحمل المنصة أي مسؤولية تجاه أي منا ',
    'لقد علمت وقبلت أنه لا يمكن لأي معلن آخر توظيفي إلا بعد أن تنتهي علاقتي التعاقدية مع من وظفني . دون إضرار أي طرف بالآخر',
    'في حالة اختلف طرفي التعاقد لأي سبب كان فإن الجهات المختصة ذات العلاقة هي المخولة النظر في ذلك .. ودور المنصة تقديم النصح والرأي والمشورة',
  ];
}