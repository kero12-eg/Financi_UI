# Agent instructions — read in order

> مؤشر لملفات المشروع. الملفات المعدومة معلّمة — **متحاولش تقراها**، مش موجودة هنا
> (راجع `Assets/UNIVERSAL_README.md` لمعرفة الملفات portable واللي لسه ما اتنقلش).

0. `PROJECT_RULES.md`         → **الحاكم** — قواعد هذا المشروع (دايمًا بتغلب فوق الملفات العامة)
1. `DESIGN_SYSTEM.md`         → التوكنز: الألوان · الخط · أنماط النص · المكوّنات
2. `SCREENSHOTS_RUNBOOK.md`   → خط اللقطات: الجدول · إحداثيات التنقّل · المشاكل · بوابة التسليم
3. `PORTFOLIO.md`             → التعريفية (الوصف + جدول اللقطات + التشغيل)
4. `README.md`                → فهرس المشروع العام
5. `Assets/UNIVERSAL_README.md`   → فهرس الملفات portable (الموجود منها هنا: هذا الملف + #6)
6. `Assets/UNIVERSAL_PORTFOLIO_SHOTS.md` → خط لقطات البورتفليو (§1→§10.1) — **اللي يطلب لقطات/عرض → نفّذه**

### غير موجود في هذا المشروع (ماتدوّرشي عليها)
`USER_CONTEXT.md` · `GENERAL_PROJECT_RULES.md` · `UNIVERSAL_BACKEND_PATTERNS.md` ·
`UNIVERSAL_DESIGN_PRINCIPLES.md` · `UNIVERSAL_DAY_AGENDA_PATTERN.md` · `UNIVERSAL_PINCH_ZOOM.md` ·
`UNIVERSAL_SCREEN_SCALING.md` · `UNIVERSAL_BOOTSTRAP.md` · `UNIVERSAL_PIXEL_DIFF_FORENSICS.md` ·
`figma-pixel-kit/` · `PROJECT_RULES` العام الأصلي · `Assets/PORTFOLIO.md` (ده بتاع مشروع قانوني تاني)

### Rules
- تغييرات بسيطة ومباشرة · verify بعد كل تغيير (`flutter analyze` = 0 errors) · اذكر الملفات المغيّرة.
- مفيش `test/` في المشروع — المطلوب من الـverify هو analyze بس.
- مقاسات UI من وحدات التصميم بس (`ScreenUtil` designSize 375×812) — `.w/.h/.sp/.r`، مفيش `MediaQuery`.
- متغيّرتش نصوص واجهة من غير سؤال · مفيش نصوص placeholder (`test`/`Lorem ipsum`).
- `commit` بس لما يتحط طلب صريح.
- بتكلّم بالعامية المصرية المفهومة (التعليمات في `~/.config/opencode/AGENTS.md` هي المرجع الأعلى في الأسلوب).
