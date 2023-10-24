

import 'package:zilli/Repositories/authentication_repo.dart';
import 'package:zilli/Repositories/withdraw_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repositories/quiz_repo.dart';

final personalProfileProvider = FutureProvider.autoDispose((ref) {
  return AuthRepo().userProfileInfo();
});


final withdrawMethodProvider = FutureProvider((ref) {
  return WithdrawRepo().withdrawMethodInfo();
});

final withdrawCurrencyProvider = FutureProvider((ref) {
  return WithdrawRepo().withdrawCurrencyInfo();
});

final withdrawHistoryProvider = FutureProvider.autoDispose((ref) {
  return WithdrawRepo().withdrawHistoryInfo();
});

final userHistoryProvider = FutureProvider.autoDispose((ref) {
  return WithdrawRepo().userHistoryInfo();
});

final quizProvider = FutureProvider((ref) {
  return QuizRepo().allQuizzes();
});

