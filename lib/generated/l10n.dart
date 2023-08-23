// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Localized {
  Localized();

  static Localized? _current;

  static Localized get current {
    assert(_current != null,
        'No instance of Localized was loaded. Try to initialize the Localized delegate before accessing Localized.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Localized> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Localized();
      Localized._current = instance;

      return instance;
    });
  }

  static Localized of(BuildContext context) {
    final instance = Localized.maybeOf(context);
    assert(instance != null,
        'No instance of Localized present in the widget tree. Did you add Localized.delegate in localizationsDelegates?');
    return instance!;
  }

  static Localized? maybeOf(BuildContext context) {
    return Localizations.of<Localized>(context, Localized);
  }

  /// `Discover`
  String get discover_label {
    return Intl.message(
      'Discover',
      name: 'discover_label',
      desc: '',
      args: [],
    );
  }

  /// `Best modern products`
  String get home_subtitle_label {
    return Intl.message(
      'Best modern products',
      name: 'home_subtitle_label',
      desc: '',
      args: [],
    );
  }

  /// `Search your Products`
  String get search_for_products_hint_label {
    return Intl.message(
      'Search your Products',
      name: 'search_for_products_hint_label',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get product_details_label {
    return Intl.message(
      'Product Details',
      name: 'product_details_label',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get add_to_cart_label {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart_label',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural,one{Total (1 item):}other{Total ({count} items):}}`
  String cart_total_items_label(num count) {
    return Intl.plural(
      count,
      one: 'Total (1 item):',
      other: 'Total ($count items):',
      name: 'cart_total_items_label',
      desc: '',
      args: [count],
    );
  }

  /// `Cart`
  String get cart_label {
    return Intl.message(
      'Cart',
      name: 'cart_label',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get check_out_label {
    return Intl.message(
      'Check Out',
      name: 'check_out_label',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localized> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Localized> load(Locale locale) => Localized.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
