# DESIGN_SYSTEM.md — نظام التصميم في financi_UI

> مستخرج **من الكود الفعلي** (`lib/Core/Styling/`) — مش من تصميم خارجي.
> أي رقم جديد لازم يعدي من هنا قبل ما يتحط في ويدجت.

---

## 1) التوكنز (Tokens)

### الألوان — `app_color.dart` → `class AppColor`

| التوكن | القيمة | الاستخدام |
|---|---|---|
| `AppColor.primaryColor` | `0xFF617AFD` | اللون الأساسي (أزرق) — الأزرار، الهيدلين، التاب النشط |
| `AppColor.secondaryColor` | `0xFF8391A1` | النصوص الثانوية (الوصف تحت العناوين) |
| `AppColor.blackcolor` | `0xFF1F2C37` | النصوص الأساسية/العناوين السود |
| `AppColor.blackcolor2` | `0xFF202955` | عناوين الجريد + نصوص guest |
| `AppColor.Greycolor` | `0xFF9CA4AB` | نصوص رمادي فاتح (السبتايتل) |
| `AppColor.GrayHome` | `0xFF9CA4AB` | نفس الرمادي — نصوص labels (Full Name/Email…) |
| `AppColor.whitecolor` | `0xFFFFFFFF` | نصوص فوق الأزرار/الكروت |
| `AppColor.TextFieldColor` | `0xFFE8ECF4` | خلفية حقول الإدخال |

> لون الكروت: `AppColor.primaryColor` (X-Card) و `Color.fromARGB(255,206,6,224)` (M-Card) —
> بيتعملوا في `Carousl_slider.dart` مباشرة.

### الخط — `app_fonts.dart`

- خط واحد بس: **`Urbanist`** (`AppFonts.MainFont`) — ملفات `Assets/fonts/`:
  Regular · Medium · Bold، المسجّلة في `pubspec.yaml`.

### أنماط النص — `app_style.dart` → `class AppStyle`

| الستايل | الحجم | الوزن | اللون | الاستخدام |
|---|---|---|---|---|
| `Headlinestyle` | `30.sp` | bold | primary | عناوين الشاشات (Welcome back, Forget Password…) |
| `Secondarylinestyle` | `16.sp` | w500 | secondary | وصف تحت العنوان |
| `TextButtonstyle` | `15.sp` | w600 | white | نصوص الأزرار/اللينكات (بيتعمل لها copyWith) |
| `interw50012gray` | `12.sp` | w500 | GrayHome | labels صغيرة (يتعمل لها `fontSize` غالبًا) |
| `interw60018black` | `18.sp` | w600 | black | عناوين ثانوية/أعمدة (باشاكل التطبيق) |

> ستايلات كتير بتتعدّل بـ`copyWith(fontSize: ...)` في مكان الاستخدام — الأصل بيفضل هنا.

### الثيم — `app_theme.dart`

`ThemeData.lightcolor`: `primaryColor` أساسي · خلفية scaffold بيضا · خط Urbanist ·
`titleLarge = Headlinestyle` · `titleMedium = Secondarylinestyle` · `buttonTheme` بلون أساسي.

## 2) المقاسات والتخطيط

- **المقياس الواحد:** `designSize = 375×812` (في `main.dart`) → كل شيء `.w` / `.h` / `.sp` / `.r`.
- الفواصل: `Spacing(height: X.h)` أو `Spacing(width: X.w)` — ويدجت `Spacing` = `SizedBox`.
  جوّه `Column` محتاج فاصل مرن → استخدم `Expanded` (مثال `_flexGap` في `custom_content.dart`).
- هوامش شائعة: `22.w` (شاشات Auth) · `25.w` (Home) · `14.w` (Profile) · `24.sp` (كارت).
- نصف قطر: `16.r` كروت · `8.r` طبقات الكارت · `8.r` حقول الإدخال.

## 3) المكوّنات — `Core/Styling/Widgts/`

| الويدجت | ملف | API |
|---|---|---|
| `Primarybutton` | `PrimaryButton.dart` | `title` + `onpressed` + `buttoncolor` (اختياري) |
| `Outlinedbuttons` | `OutlinedButton.dart` | `title` + `onpressed` |
| `Customtextfield` | `CustomTextField.dart` | `HintText` · `controller` · `validator` · `isPassword` · `suffixIcon` · `width/height/radius` |
| `Backbuttons` | `BackButton.dart` | `onpressed` (افتراضي `context.pop()`) · `color` |
| `Spacing` | `Spacing.dart` | `width?` · `height?` |

## 4) القواعد

1. **مفيش لون/حجم/خط في الويدجت مباشرة** — الأول ابص على `AppColor` / `AppStyle`، والجديد يتدفّق هنا.
2. النصوص الصغيرة بتتعدّل بـ`copyWith` مش بـ`TextStyle` جديد.
3. الصور من `app_assets.dart` (مسارات حرفية) — مفيش مسار صورة inline في ويدجت.
4. حالة الشاشة الفاضية/الخطأ/التحميل: **لسه مش محددة** في المشروع (كله static demo) — لو اتضافت
   حالات جديدة توثّقها هنا.
5. بعد أي إضافة UI: `flutter analyze` = 0 errors.
