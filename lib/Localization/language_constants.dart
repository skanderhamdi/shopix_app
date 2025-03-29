
import 'package:flutter/material.dart';

const english = 'en';
const finnish = 'fi';

Locale createLocale(String languageCode) {
  switch(languageCode) {
    case english:
      return const Locale(english, "US");
    case finnish:
      return const Locale(finnish, "FI");
    default:
      return const Locale(english, "US");
  }
}