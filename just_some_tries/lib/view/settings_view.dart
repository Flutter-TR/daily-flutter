import 'package:flutter/material.dart';

import '../localizations/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Sayfanın iskeletini Scaffold widgeti ile kurduk
    return Scaffold(
      appBar: AppBar(
        /// [AppBar]'ın [title] parametresine sayfanın başlığını verdik
        ///
        title: Text(
          /// Uygulamanın dil dosyalarındaki metinlere iki şekilde erişebiliriz
          /// 1) [context.translate()] metodunu kullanarak
          /// [BuildContext] üzerinden;
          context.translate('general_settings'),

          /// 2)[translate()] metodunu kullanarak
          /// [AppLocalizations] sınıfı  üzerinden;
          /// AppLocalizations.of(context)!.translate('general_settings'),
          /// Kodumuzu daha kısaltığı için biz ilk yöntemi terchi edeceğiz.
        ),
      ),

      /// [body] parametresinde birden fazla elaman vermek ve kaydırma özelliği
      /// kazandırmak için ListView widgeti kullandık.
      body: ListView(
        children: [
          /// [_buildListTile] metodu text isimli bir parametre alarak
          /// Card ile sarılmış ListTile widgetini bize döndürecek.
          _buildListTile(
            context.translate('account'),
          ),
          _buildListTile(
            context.translate('country'),
          ),
          _buildListTile(
            context.translate('data_usage'),
          ),
          _buildListTile(
            context.translate('display_and_sound'),
          ),
          _buildListTile(
            context.translate('english'),
          ),
          _buildListTile(
            context.translate('notifactions'),
          ),
          _buildListTile(
            context.translate('permissions'),
          ),
          _buildListTile(
            context.translate('phone_language'),
          ),
          _buildListTile(
            context.translate('privacy'),
          ),
          _buildListTile(
            context.translate('turkish'),
          ),
        ],
      ),
    );
  }

  ///  ListView'ın children'ına yerleştireceğimiz elemanları ortak bir tasarımda
  ///  olması için bu metodu oluşturduk.
  Card _buildListTile(String text) {
    return Card(
      child: ListTile(
        title: Text(text),
        trailing: Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}