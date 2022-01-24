
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @welcomeText.
  ///
  /// In ru, this message translates to:
  /// **'добро пожаловать в этот уникальный по своей сути и бесполезности проект'**
  String get welcomeText;

  /// No description provided for @welcomeButtonText.
  ///
  /// In ru, this message translates to:
  /// **'шавернуться'**
  String get welcomeButtonText;

  /// No description provided for @registrationTitle.
  ///
  /// In ru, this message translates to:
  /// **'что написать на твоем стаканчике?'**
  String get registrationTitle;

  /// No description provided for @registrationTextFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'сюда'**
  String get registrationTextFieldHint;

  /// No description provided for @registrationButtonText.
  ///
  /// In ru, this message translates to:
  /// **'поехали'**
  String get registrationButtonText;

  /// No description provided for @homeListTitle.
  ///
  /// In ru, this message translates to:
  /// **'меню'**
  String get homeListTitle;

  /// No description provided for @homeMakeOrderButton.
  ///
  /// In ru, this message translates to:
  /// **'заказать'**
  String get homeMakeOrderButton;

  /// No description provided for @drawerAmountOfShawerma.
  ///
  /// In ru, this message translates to:
  /// **'съедено шавермы: '**
  String get drawerAmountOfShawerma;

  /// No description provided for @drawerViewOrders.
  ///
  /// In ru, this message translates to:
  /// **'заказы'**
  String get drawerViewOrders;

  /// No description provided for @ordersListOrderTitle.
  ///
  /// In ru, this message translates to:
  /// **'заказ от '**
  String get ordersListOrderTitle;

  /// No description provided for @stShawerma_png.
  ///
  /// In ru, this message translates to:
  /// **'шаверма_стандарт.png'**
  String get stShawerma_png;

  /// No description provided for @stShawerma_jpg.
  ///
  /// In ru, this message translates to:
  /// **'шаверма_стандарт.jpg'**
  String get stShawerma_jpg;

  /// No description provided for @stShawerma_svg.
  ///
  /// In ru, this message translates to:
  /// **'шаверма_стандарт.svg'**
  String get stShawerma_svg;

  /// No description provided for @chShawerma_png.
  ///
  /// In ru, this message translates to:
  /// **'шаверма_сырная.png'**
  String get chShawerma_png;

  /// No description provided for @chShawerma_jpg.
  ///
  /// In ru, this message translates to:
  /// **'шаверма_сырная.jpg'**
  String get chShawerma_jpg;

  /// No description provided for @chShawerma_svg.
  ///
  /// In ru, this message translates to:
  /// **'шаверма_сырная.svg'**
  String get chShawerma_svg;

  /// No description provided for @cup_png.
  ///
  /// In ru, this message translates to:
  /// **'кофе.png'**
  String get cup_png;

  /// No description provided for @cup_jpg.
  ///
  /// In ru, this message translates to:
  /// **'кофе.jpg'**
  String get cup_jpg;

  /// No description provided for @cup_svg.
  ///
  /// In ru, this message translates to:
  /// **'кофе.svg'**
  String get cup_svg;

  /// No description provided for @tea_png.
  ///
  /// In ru, this message translates to:
  /// **'чай.png'**
  String get tea_png;

  /// No description provided for @tea_jpg.
  ///
  /// In ru, this message translates to:
  /// **'чай.jpg'**
  String get tea_jpg;

  /// No description provided for @tea_svg.
  ///
  /// In ru, this message translates to:
  /// **'чай.svg'**
  String get tea_svg;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
