// ========================================================
// [LATIHAN 3] PENAMBAHAN VALIDASI KETAT DENGAN REGEXP
// ========================================================
import 'package:rpl_keamanan2/utils/logger.dart';

class Validators {
  /// Memvalidasi format email.
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  /// Memvalidasi bahwa [value] tidak kosong.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Memvalidasi panjang [value] antara [min] dan [max].
  static bool hasValidLength(String value, {int min = 1, int max = 100}) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  /// Membersihkan input dari karakter berbahaya untuk mencegah serangan XSS / SQLi.
  static String sanitize(String input) {
    return input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;')
        .trim();
  }

  /// Validasi nomor telepon (harus angka saja dan panjang 10-13 digit).
  static bool isValidPhone(String phone) {
    final regex = RegExp(r'^[0-9]{10,13}$');
    return regex.hasMatch(phone);
  }

  /// Validasi URL (wajib diawali http:// atau https://).
  static bool isValidUrl(String url) {
    final regex = RegExp(r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$');
    return regex.hasMatch(url);
  }

  /// Validasi password (min 8 karakter, mengandung 1 huruf kapital, 1 angka, dan 1 simbol).
  static bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  /// Fungsi validator pendukung untuk FormField Teks umum.
  static String? validateText(String? value, {String fieldName = 'Field', int minLength = 1, int maxLength = 100}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    if (!hasValidLength(value, min: minLength, max: maxLength)) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }
    return null;
  }

  /// Fungsi validator pendukung untuk FormField Email.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!isValidEmail(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }

  /// Fungsi validator pendukung untuk FormField Nomor Telepon.
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (!isValidPhone(value.trim())) {
      return 'Nomor telepon tidak valid (Hanya angka, 10-13 digit)';
    }
    Logger.debug('Validasi telepon berhasil diproses');
    return null;
  }

  /// Fungsi validator pendukung untuk FormField URL.
  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL tidak boleh kosong';
    }
    if (!isValidUrl(value.trim())) {
      return 'Format URL tidak valid (Wajib diawali http:// atau https://)';
    }
    return null;
  }

  /// Fungsi validator pendukung untuk FormField Password.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (!isValidPassword(value)) {
      return 'Password wajib min 8 karakter, ada huruf kapital, angka, dan simbol';
    }
    return null;
  }
}
