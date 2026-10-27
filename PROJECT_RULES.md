# PROJECT_RULES.md — قواعد مشروع financi_ui

> مبني على أوديت كامل للكود بتاريخ اليوم. **الملفات بتاعة المشروع دي بتغلب** فوق أي ملف عام
> لما فيه تعارض (Golden rule #1 في `Assets/UNIVERSAL_README.md`).

---

## 🚨 اقرأ ده قبل أي تغيير في الواجهة/المقاسات

> القاعدة: **المقاس تيجي من وحدات التصميم مش من الشاشة الحقيقية** — وكل المشروع متحطّط على
> **مقياس واحد**.
>
> - `main.dart` فيه `ScreenUtilInit(designSize: Size(375, 812))` → كل مقاس لازم يكون
>   `.w` / `.h` / `.sp` / `.r` — **ممنوع** `MediaQuery` ولا `kScreenHeight` ولا أرقام بكسل صريحة.
> - الخطوة الأولى قبل أي تعديل UI: افتح `lib/Core/Styling/` وشوف التوكن المظبوط بدل ما تخترع رقم.
>
> ⚠️ الملف العام `UNIVERSAL_SCREEN_SCALING.md` **مش منقول للمشروع ده** (شوف
> `Assets/UNIVERSAL_README.md`) — القاعدة ادّونا كده، والمرجع الناقص لو اتنقل بعدين.

---

## 1) البنية

```text
lib/
├── main.dart                  # ScreenUtilInit + MaterialApp.router + theme
├── Core/
│   ├── Routing/               # AppRouter.dart (المسارات) + Router_Gen.dart (GoRouter)
│   └── Styling/               # app_color · app_style · app_fonts · app_theme · app_assets
│       └── Widgts/            # Spacing · PrimaryButton · OutlinedButton · CustomTextField · BackButton
└── Features/
    ├── OnBoardingScreen/
    ├── Auth/                  # Login · Register · ForgetPassword · OTPSCREEN · NewPassword · PasswordChanged
    └── Main/                  # MainScreen (bottom nav) + Home/ + ALLCards/ + Profile/
```

- التصنيف حسب **الميزة** (Features) مش حسب النوع. الويدجت المشتركة تروح `Core/Styling/Widgts/`.
- الأصول: `Assets/images/` و`Assets/fonts/` — **المسجّل في `pubspec.yaml` هو `Assets/images/` بس**.
  فولدر `Assets/portfolio/` للعرض والرفع ولازم يفضل **غير مسجّل** (زيادة حجم APK).

## 2) التنقّل

- `go_router` — 8 مسارات ثابتة في `AppRouter.dart` (`/onboarding` · `/login` · `/register` ·
  `/forget` · `/otp` · `/new_password` · `/password_changed` · `/main`).
- الدخول باسم المسار: `context.pushNamed(AppRouter.X)` — **ممنوع** `Navigator.push` يدوي ولا
  `MaterialPageRoute`.
- مفيش redirect/auth gate: `initialLocation: /onboarding` و`/main` متاحة من "Continue as guest".
- زرار الرجوع في شاشات Auth = `Backbuttons()` → `context.pop()` (أو `pushReplacementNamed` في اللوجين).
- تابات المين = `screens[currentIndex]` في `MainScreen.dart` (Home=0 · Statistic=1 · Add=2 · My card=3 · Profile=4).

## 3) البيانات

- **مفيش backend ولا قاعدة بيانات ولا حفظ** — كل البيانات ثابتة داخل الويدجت (ديمو UI فقط).
- أي شاشة جديدة: البيانات تتحط في مكان واحد واضح (ثابت أو List فوق الويدجت) — **مفيش
  repositories/services/domain** في المشروع ده، وما تظيفش طبقات من غير سبب.
- **ممنوع نصوص اختبار/placeholder**: `test` · `demo` · `123` · `Lorem ipsum` (الأخير كان موجود
  فعلاً في `GridViewContent.dart` واتشال — ما يرجعش).

## 4) الحالة (State)

- إدارة محلية بس: `StatefulWidget` + `setState` (مثلاً `currentIndex` في المين، `ispassword` في اللوجين).
- **ممنوع** تجيب `flutter_bloc`/`provider`/`get_it` من غير طلب صريح — `pubspec` بسيط عن قصد.

## 5) قواعد الواجهة (من عيوب حصلت فعلًا)

| القاعدة | السبب |
|---|---|
| مفيش `Column` بارتفاع ثابت داخل Container ليه ارتفاع ثابت — استخدم `Expanded`/`Spacer` للفراغات | overflow 14px في `custom_content.dart` |
| لو الويدجت ليها ارتفاع مثبّت (زي `SizedBox(142.h)`) والحتة فيها صورة + نصوص → الصورة في `Expanded` | overflow 11px في `ChartBar.dart` |
| شاشة محتواها أطول من الشاشة → `SingleChildScrollView` + **ممنوع `Spacer` جوّه scroll view** (استخدم `Spacing`) | overflow 25px في `Profile.dart` |
| لقطة/شاشة = فحص بصري إجباري (§5 في `Assets/UNIVERSAL_PORTFOLIO_SHOTS.md`) | أي عيب سببه الكود لازم يتصلح + بناء جديد + إعادة تصوير |
| نصوص الواجهة **متتغيرش من غير سؤال** | نصوص UI ملك صاحب المشروع |

## 6) التحقق بعد أي تغيير (إجباري)

```powershell
flutter analyze        # = 0 errors (المتوقع: 57 info قديمة — naming/deprecated — متتلمسهمش)
flutter build apk --release   # أي بناء للتصوير لازم release (الـdebug بيرسم badge أرقام)
```

- **مفيش مجلد `test/`** في المشروع → مفيش أمر test لحد ما يتعمل.
- بعد أي تغيير: اذكر الملفات اللي اتغيّرت بالاسم.

## 7) سلوك عام

- تغييرات **بسيطة ومباشرة** — مفيش refactors جانبية ولا تغيير ملفات مالهاش علاقة.
- مفيش تعديل على أسماء الأصول/خطوط الـpath (الصور مربوطة في `app_assets.dart` بالمسار الحرفي).
- `commit` **بس لما يتحط** طلب صريح.
- مصيبة جديدة اكتشفتها → اكتبها هنا لو خاصة بالمشروع (وأضفها للملف العام لو أي مشروع يقع فيها).

## 8) حسابات ومعلومات

| البند | القيمة |
|---|---|
| الباقة | `com.example.financi_ui` |
| الريبو | https://github.com/kero12-eg/Financi_UI |
| خط اللقطات | `SCREENSHOTS_RUNBOOK.md` + `Assets/portfolio/shots/` (11 لقطة) |
| التعريفية | `PORTFOLIO.md` (الجذر — نسخة جوّه `Assets/portfolio/`) |
