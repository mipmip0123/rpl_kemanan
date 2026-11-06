// ========================================================
// [LATIHAN 5] UNIT TEST UNTUK VALIDATORS
// ========================================================
import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan2/utils/validators.dart';

void main() {
  group('Latihan 5 - Kelompok Pengujian Unit Validators', () {
    
    // a) Test isValidEmail()
    test('Menguji isValidEmail() dengan skenario string email', () {
      expect(Validators.isValidEmail('informatika@amikom.ac.id'), true);
      expect(Validators.isValidEmail('bukanFormatEmail.com'), false);
    });

    // b) Test sanitize()
    test('Menguji sanitize() dengan input karakter HTML XSS berbahaya', () {
      final inputBahaya = "<script>alert('malicious')</script>";
      final hasil = Validators.sanitize(inputBahaya);
      
      expect(hasil.contains('<'), false);
      expect(hasil.contains('>'), false);
      expect(hasil, "&lt;script&gt;alert(&#39;malicious&#39;)&lt;/script&gt;");
    });

    // c) Test validateText()
    test('Menguji validateText() dengan batasan nilai kosong', () {
      expect(Validators.validateText('', fieldName: 'Nama'), 'Nama tidak boleh kosong');
    });
  });
}
