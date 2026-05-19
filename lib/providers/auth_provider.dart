import 'package:flutter/material.dart';
import 'package:morjops/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // نموذج للمستخدم للاختبار
  static final mockUser = User(
    id: '1',
    name: 'محمد أحمد',
    email: 'mohammad@example.com',
    phone: '+963 9XX XXX XXX',
    createdAt: DateTime.now(),
    qualification: 'بكالوريوس',
    skills: ['إدارة', 'التخطيط', 'البرمجة'],
    bio: 'متخصص في إدارة المشاريع',
  );

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(seconds: 2));

      // التحقق البسيط
      if (email.isEmpty || password.isEmpty) {
        throw Exception('البريد الإلكتروني وكلمة المرور مطلوبة');
      }

      if (!email.contains('@')) {
        throw Exception('البريد الإلكتروني غير صحيح');
      }

      // تحديث المستخدم الحالي
      _currentUser = mockUser.copyWith(email: email);
      _isLoggedIn = true;

      // حفظ في Shared Preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(seconds: 2));

      // التحقق من البيانات
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        throw Exception('جميع الحقول مطلوبة');
      }

      if (!email.contains('@')) {
        throw Exception('البريد الإلكتروني غير صحيح');
      }

      if (password != confirmPassword) {
        throw Exception('كلمات المرور غير متطابقة');
      }

      if (password.length < 6) {
        throw Exception('كلمة المرور يجب أن تكون 6 أحرف على الأقل');
      }

      // إنشاء مستخدم جديد
      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        phone: '',
        createdAt: DateTime.now(),
      );

      _isLoggedIn = true;

      // حفظ في Shared Preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userName', name);
      await prefs.setString('userEmail', email);

      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      _currentUser = null;
      _isLoggedIn = false;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('userEmail');
      await prefs.remove('userName');

      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateProfile(String name, String phone, String qualification) async {
    if (_currentUser == null) return;

    try {
      _currentUser = _currentUser!.copyWith(
        name: name,
        phone: phone,
        qualification: qualification,
      );

      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
