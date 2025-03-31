
import 'package:flutter/material.dart';

const english = 'en';
const finnish = 'fi';
const french = 'fr';

Locale createLocale(String languageCode) {
  switch(languageCode) {
    case english:
      return const Locale(english, "US");
    case finnish:
      return const Locale(finnish, "FI");
    case french:
      return const Locale(french, "FR");
    default:
      return const Locale(english, "US");
  }
}