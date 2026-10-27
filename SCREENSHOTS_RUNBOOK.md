# SCREENSHOTS_RUNBOOK.md — خط لقطات بورتفليو لمشروع financi_ui

> مبني على `Assets/UNIVERSAL_PORTFOLIO_SHOTS.md` (المنهجية §1→§9).
> بوابة الاختيار §1: **كل الشاشات (11 لقطة)** — المستخدم اختار "كل الشاشات الـ11".
> **الحالة: ✅ منفّذ بالكامل — 11/11 لقطة متصوّرة ومفتوحة.**

---

## 1) بيئة التصوير

| البند | القيمة |
|---|---|
| الجهاز | Android emulator — `emulator-5554` |
| الدقة | **720×1280** (density 320 = xhdpi) → إحداثيات البكسلات الفعلية |
| الباقة | `com.example.financi_ui` |
| البناء | `flutter build apk --release` (إجباري — مفيش debug badge ولا overflow strips) |
| مكان اللقطات | `Assets/portfolio/shots/` (مش مسجّل في pubspec — pubspec فيه `Assets/images/` بس) |
| التوجيه | `go_router` — 8 روابط في `lib/Core/Routing/Router_Gen.dart` |
| ScreenUtil | designSize = 375×812 |
| الداتا | **مفيش backend** — بيانات ثابتة داخل الواجهة، مفيش seed. فحص `test/demo/123/lorem` في `lib/` = 0 نتائج بعد الإصلاح (شوف §5) |

---

## 2) جدول اللقطات (النتيجة النهائية)

| اسم الملف | الشاشة | الحالة |
|---|---|---|
| `01-onboarding.png` | الواجهة الذهبية | ✅ |
| `02-login.png` | تسجيل الدخول | ✅ فورمة فاضية نضيفة |
| `03-register.png` | إنشاء حساب | ✅ فورمة فاضية نضيفة |
| `04-forget-password.png` | نسيت كلمة المرور | ✅ |
| `05-otp.png` | كود التحقق | ✅ الخانات فاضية (الحالة الافتراضية) |
| `06-new-password.png` | تعيين كلمة مرور جديدة | ✅ |
| `07-password-changed.png` | تم التغيير بنجاح | ✅ |
| `08-home.png` | الرئيسية (تاب Home) | ✅ **أُعيد تصويرها** بعد إصلاح "Lorem ipsum" |
| `09-statistic.png` | Chart (تاب Statistic) | ✅ |
| `10-my-cards.png` | All Cards (تاب My card) | ✅ |
| `11-profile.png` | My Profile (تاب Profile) | ✅ بعد سكرول 150px لظهور زرار Logout — اتأكدت بالقصّ والتكبير 2x |

### التغطية (§6)

| الشاشة/العنصر | الحالة |
|---|---|
| تاب **"Add"** (index 2) | **متصوّرتش — سبب صريح:** placeholder `Center(Text('Add'))` في `MainScreen.dart:20` |

---

## 3) الإحداثيات المكتشفة (720×1280) — بالصورة المؤقتة ثم القراءة

### شاشات الدخول (نفس الموضع تقريبًا في كلها)

| العنصر | الإحداثيات |
|---|---|
| زرار Back (كل شاشات Auth) | `97 120` |
| خانة أول نص (إيميل/يوسر) | `360 485` |
| زرار Login (الأوبردينج) | `360 1067` |
| زرار Register (الأوبردينج) | `360 1190` |
| لينك Forgot Password؟ (اللوجين) | `567 702` |
| زرار Login (اللوجين) | `360 822` |
| خانة إيميل Forget | `360 507` — زرار Send code: `360 668` |
| خانة أول رقم OTP | `108 512` — زرار Verify: `360 678` |
| خانة New Password `360 507` · Confirm `360 630` · Reset `360 792` | |
| Register: يسر `360 485` · إيميل `360 600` · باسورد `360 717` · confirm `360 835` · زرار `360 986` | |
| زرار Back to Login (شاشة النجاح) | `360 946` |

### شريط التنقل السفلي (5 عناصر، y = 1140)

| التاب | الإحداثيات |
|---|---|
| Home | `71 1140` |
| Statistic | `216 1140` |
| My card | `504 1140` |
| Profile | `648 1140` |

### فلو التنقّل المُستخدَم فعليًا

1. تشغيل نضيف: `force-stop` → `monkey ... LAUNCHER 1` → انتظار 7 ثواني (+ 5 ثواني إضافية لظهور الأوبردينج بعد شاشة الـsplash).
2. المسار: onboarding → Login → **Forgot** → (كتابة إيميل + Send code) → OTP (كتابة `1234` + Verify) → New Password (باسوردين + Reset) → Password Changed → Back to Login → Back → onboarding → **Register** → (تعبئة) → Register → Main.
3. التابات بضغطة مباشرة على الشريط السفلي.
4. Profile: سكرول آمن من نص الشاشة `swipe 360 900 360 750` (تقريبًا 150px) لظهور Logout.

---

## 4) مشاكل وقعت واتحلت أثناء التصوير

| المشكلة | السبب | الحل |
|---|---|---|
| dialog نظام "Try out your stylus" + شريط handwriting على جنب الخانات | Gboard فعّال وبيدخل وضع stylus handwriting على الإيموليتر | `adb shell ime disable com.google.android.inputmethod.latin/...LatinIME` — الـ`input text` بيشتغل من غير IME لأن Flutter بيستقبل الـkey events مباشرة. (الـIME اترجع بـ`ime enable` بعد التصوير) |
| `adb shell input keyevent 4` رجّع شاشة بدل ما يقفل الكيبورد | الكيبورد كان مخفي أصلًا | اتلغي الاستخدام نهائيًا — مفيش Back بالـkeyevents |
| نصوص **"Lorem ipsum"** في جريد الرئيسية | placeholder في الكود (`GridViewContent.dart:17-19`) | اتصلح لـ`Bills & utilities` / `Request money` / `Contact support` → **بناء جديد + إعادة تصوير `08-home.png`** (§5) |
| زرار Logout مقطوع تحت شريط التنقل | المحتوى بقى scrollable بعد فيكس overflow الـProfile | سكرول 150px قبل التصوير + تأكيد بالقصّ والتكبير 2x |
| شاشة الـsplash بتتصوّر بدل الأوبردينج | الإيموليتر لسه بيلوّن شعار Flutter | انتظار 5 ثواني إضافية قبل التقاط أول لقطة |

---

## 5) بوابة التسليم (§7) — ✅ مكتملة

- [x] كل لقطة من الـ11 اتقريت بالعين — وقصّ/تكبير 2x لزرار Logout
- [x] جدول التغطية كامل (11 شاشة + سبب صريح لتاب "Add")
- [x] `flutter analyze` = **0 errors** (57 info قديمة — نفس الـbaseline قبل التعديلات)
- [x] `flutter test` = **مفيش مجلد `test` في المشروع** — مفيش نتيجة تتغيّر
- [x] اتمسح كل `_tmp-*.png`
- [x] `README.md` + `PORTFOLIO.md` اتنسخوا جوّه `Assets/portfolio/` (الرووت هو المصدر)
- [x] `Assets/portfolio/` = 11 لقطة + ملفين تعريفيين، ومش مسجّل في pubspec

### ملفات اتغيّرت في الكود

| الملف | التغيير |
|---|---|
| `lib/Features/Main/Home/Widgets/GridViewContent.dart` | استبدال 3 نصوص `Lorem ipsum` بنصوص حقيقية |
| `SCREENSHOTS_RUNBOOK.md` | جديد — دفتر التصوير ده |
| `PORTFOLIO.md` + `Assets/portfolio/` | جديد — التعريفية + اللقطات |

> ملاحظة: `Assets/PORTFOLIO.md` القديم بيوصف مشروع قانوني (law office) مختلف —
> متنسخش عمدًا عشان ما يضلّش زائر الريبو. التعريفية بتاعة هذا المشروع هي `PORTFOLIO.md` في الجذر.
