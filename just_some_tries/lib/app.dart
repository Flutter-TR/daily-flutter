import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations/app_localizations.dart';
import 'view/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      debugShowCheckedModeBanner: false,

      /// Desteklenen Diller
      supportedLocales: const [
        Locale('en', 'US'), // Amerikan İngilizcesi
        Locale('tr', 'TR'), // Türkçe
      ],

      /// [Delegate: Temsilci] listesi
      localizationsDelegates: const [                         
        /// Uygulama için kendi oluşturduğumuz delegate
        AppLocalizations.delegate,

        /// Material widget kütüphanesi için delegate
        GlobalMaterialLocalizations.delegate,

        /// Widgetlar için Locale değerine göre metin yönünü belirler
        /// [TextDirection.ltr] Metin Yönü - Soldan sağa (left to right) (Varsayılan)
        /// [TextDirection.rtl] Metin Yönü - Sağdan sola(right to left)
        GlobalWidgetsLocalizations.delegate,

        /// Cupertino widget kütüphanesi için delegate
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) { 
        /// [locale]: Cihazın dili null değilse
        if (locale != null) {
          debugPrint("Algılanan cihaz dili: Dil Kodu: ${locale.languageCode}, Ülke Kodu: ${locale.countryCode}");
          for (var supportedLocale in supportedLocales) {
            /// Cihazın dil kodu desteklenen diller arasındaki dil kodlarının içinde var mı?
            if (supportedLocale.languageCode == locale.languageCode) {
              /// Varsa desteklenen dili döndür
              return supportedLocale;
            }
          }
        }
        debugPrint("Algılanan cihaz dili desteklenen diller arasında bulunmuyor.");

        /// [locale]: Cihazın dili null ise
        /// Yoksa [supportedLocales] Listesindeki ilk sonucu döndür.
        debugPrint(
            "Uygulamanın başlatılması istenen dil: Dil Kodu: ${supportedLocales.first.languageCode}, Ülke Kodu: ${supportedLocales.first.countryCode}");
        return supportedLocales.first;
      },
      home: const SettingsView(),
    );
  }
}