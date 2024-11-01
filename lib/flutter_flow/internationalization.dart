import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? viText = '',
  }) =>
      [enText, viText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'qck7t3y0': {
      'en': 'Page Title',
      'vi': 'Tiêu đề trang',
    },
    'ry4sqlh8': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // SignInPage
  {
    'lyrxcqxg': {
      'en': 'Welcome Back',
      'vi': 'Chào mừng trở lại',
    },
    'kxou6wgl': {
      'en': 'Sign in to continue your journey',
      'vi': 'Đăng nhập để tiếp tục hành trình của bạn',
    },
    'ijqhdebw': {
      'en': 'Email',
      'vi': 'E-mail',
    },
    'telwoygg': {
      'en': 'Password',
      'vi': 'Mật khẩu',
    },
    '7j00parm': {
      'en': 'Sign In',
      'vi': 'Đăng nhập',
    },
    'unt913n1': {
      'en': 'Don\'t have an account?',
      'vi': 'Bạn chưa có tài khoản?',
    },
    '1d3dc3ji': {
      'en': 'Sign Up',
      'vi': 'Đăng ký',
    },
    'bs6cu55s': {
      'en': 'Forgot Password?',
      'vi': 'Quên mật khẩu?',
    },
  },
  // SignUpPage
  {
    'wbvuyauj': {
      'en': 'Create your Account',
      'vi': 'Tạo tài khoản của bạn',
    },
    '8htkngim': {
      'en': 'Sign up to start your journey',
      'vi': 'Đăng ký để bắt đầu hành trình của bạn',
    },
    'tvwlde8w': {
      'en': 'Email',
      'vi': 'E-mail',
    },
    '7rq10vdt': {
      'en': 'Password',
      'vi': 'Mật khẩu',
    },
    'l7gbl2lf': {
      'en': 'Confirm Password',
      'vi': 'Xác nhận mật khẩu',
    },
    'm9n5bil4': {
      'en': 'Sign Up',
      'vi': 'Đăng ký',
    },
    '2nnri7kk': {
      'en': 'Already have an account?',
      'vi': 'Bạn đã có tài khoản?',
    },
    'nkfydjym': {
      'en': 'Sign In',
      'vi': 'Đăng nhập',
    },
  },
  // VerifyOTP
  {
    'ty0qil2m': {
      'en': 'Verify OTP',
      'vi': 'Xác minh OTP',
    },
    '2r4cc30k': {
      'en': 'Enter the 6-digit code sent to your email',
      'vi': 'Nhập mã 6 chữ số được gửi đến email của bạn',
    },
    'g7i3fdfe': {
      'en': 'Resend',
      'vi': 'Gửi lại',
    },
    'hngg4f8q': {
      'en': 'Verify',
      'vi': 'Xác minh',
    },
    'omudf87k': {
      'en': 'Next resend available at',
      'vi': 'Gửi lại tiếp theo có sẵn tại',
    },
    'utsyojl4': {
      'en': 'Resend',
      'vi': 'Gửi lại',
    },
  },
  // Miscellaneous
  {
    '23lmb297': {
      'en': '',
      'vi': '',
    },
    'nh6s3wpi': {
      'en': '',
      'vi': '',
    },
    'j1ypx2pw': {
      'en': '',
      'vi': '',
    },
    '8ydhhkz2': {
      'en': '',
      'vi': '',
    },
    't4nhtsag': {
      'en': '',
      'vi': '',
    },
    '3n4goe7h': {
      'en': '',
      'vi': '',
    },
    '6emy4e0k': {
      'en': '',
      'vi': '',
    },
    'q7zj1dmm': {
      'en': '',
      'vi': '',
    },
    'v2dmxol2': {
      'en': '',
      'vi': '',
    },
    '06p72cyr': {
      'en': '',
      'vi': '',
    },
    'olozc0we': {
      'en': '',
      'vi': '',
    },
    '102q075x': {
      'en': '',
      'vi': '',
    },
    'd9t3jxbh': {
      'en': '',
      'vi': '',
    },
    '5xfsynpx': {
      'en': '',
      'vi': '',
    },
    '7cs8wgv3': {
      'en': '',
      'vi': '',
    },
    '6uvkp4cl': {
      'en': '',
      'vi': '',
    },
    '5akbfhjl': {
      'en': '',
      'vi': '',
    },
    '42160qdx': {
      'en': '',
      'vi': '',
    },
    'cjvy73z5': {
      'en': '',
      'vi': '',
    },
    '0i7d0w4m': {
      'en': '',
      'vi': '',
    },
    'j6ytfl6z': {
      'en': '',
      'vi': '',
    },
    '3makdyuy': {
      'en': '',
      'vi': '',
    },
    '38vxt0pe': {
      'en': '',
      'vi': '',
    },
    'bv9htmvy': {
      'en': '',
      'vi': '',
    },
    'bglsrz2w': {
      'en': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
