# Financi_UI — واجهة تطبيق مالي

تطبيق موبايل لواجهة خدمات مالية/مصرفية (UI فقط) مبني بـ Flutter، مع مسار كامل
للدخول واستعادة كلمة المرور وشاشات المين (الرئيسية · الإحصائيات · الكروت · البروفايل).

---

## نظرة عامة

| | |
|---|---|
| **المجال** | واجهة مالية: دخول · تسجيل · استعادة كلمة السر · داشبورد الكروت · إحصائيات · بروفايل |
| **المنصة** | Android (تصوير الإيموليتر) + iOS |
| **الدخول** | شاشات مسار كامل (Login / Register / Forget / OTP / New Password) — **بدون backend** |
| **قاعدة البيانات** | مفيش — البيانات ثابتة داخل الواجهة للعرض (статic demo data) |
| **التوجيه** | `go_router` — 8 روابط في `lib/Core/Routing/Router_Gen.dart` |
| **المقاسات** | `flutter_screenutil` — designSize = 375×812 |
| **الريبو** | [github.com/kero12-eg/Financi_UI](https://github.com/kero12-eg/Financi_UI) |

---

## التقنيات (من `pubspec.yaml`)

- **Flutter / Dart** + Material Design
- **`go_router`** — التنقّل بالروابط
- **`flutter_screenutil`** — مقاسات ثابتة التصميم
- **`pin_code_fields`** — شاشة كود التحقق (OTP)
- **`carousel_slider`** + **`dots_indicator`** — كاروسيل الكروت
- **خط Urbanist** (Regular / Medium / Bold) — `Assets/fonts/`

---

## الشاشات واللقطات

كل لقطة في `Assets/portfolio/shots/` متصوّرة من **release build** (بدون badge تطوير)
على إيموليتر بدقة **720×1280**:

| اللقطة | الشاشة | بتوري إيه |
|---|---|---|
| `01-onboarding.png` | الواجهة الذهبية | أول شاشة — Login / Register |
| `02-login.png` | تسجيل الدخول | فورمة الدخول + روابط Forgot/Register + السوشال |
| `03-register.png` | إنشاء حساب | 4 حقول + زرار Register |
| `04-forget-password.png` | نسيت كلمة المرور | وصف + خانة الإيميل + Send code |
| `05-otp.png` | كود التحقق | 4 خانات PIN + Verify |
| `06-new-password.png` | تعيين كلمة مرور جديدة | New/Confirm + Reset Password |
| `07-password-changed.png` | تم التغيير بنجاح | علامة النجاح + Back to Login |
| `08-home.png` | الرئيسية | الترحيب · كاروسيل X-Card/M-Card · الجريد (Send Money · Pay The Bill) |
| `09-statistic.png` | Chart | شارت أعمدة يناير–مايو + Income/Outcome |
| `10-my-cards.png` | All Cards | الكروت الكبيرة ببياناتها الكاملة + VISA |
| `11-profile.png` | My Profile | البيانات + زرار Logout |

### التغطية

| العنصر | الحالة |
|---|---|
| تاب **"Add"** في شريط التنقل | **مش متصوّر — سبب صريح:** placeholder `Center(Text('Add'))` في `MainScreen.dart` — مش شاشة فعلية |

---

## التشغيل

```powershell
flutter pub get
flutter build apk --release      # release مطلوب لتصوير بدون badge تطوير
adb install -r build\app\outputs\flutter-apk\app-release.apk
```

ملاحظة: البيانات demo ثابتة — مفيش إعداد قاعدة بيانات ولا seed.

---

## ملاحظات

- فولدر `Assets/portfolio/` للعرض والرفع بس — **مش مسجّل في `pubspec.yaml` assets**
  (المسجّل هو `Assets/images/` فقط) عشان ما يتحمّلش جوه الـAPK.
- **مسودة التصوير الكاملة** (الجدول + إحداثيات التنقّل + بوابة التسليم):
  `SCREENSHOTS_RUNBOOK.md` في جذر المشروع.
- **خط التصوير العام** (ينفع لأي مشروع): `Assets/UNIVERSAL_PORTFOLIO_SHOTS.md`.
