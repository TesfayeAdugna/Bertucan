import 'dart:ui';

import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IAuthRepository {
  Future<NormalResponse> signUp(UserToSignUp signUpPayload);
  Future<User?> signIn(UserToLogin loginPayload);
  Future<NormalResponse> logOut();
  List<QuestionnaireModel> getQuestionnairies();
  List<QuestionnaireModel> setQuestionnairies();
  void saveQuestionnairAnswers(List<QuestionnaireModel> questionnaires);
  void setPasscode(String passcode);
  Future<NormalResponse> resetPassword(ResetPassword resetPassword);
  Future<NormalResponse> requestResetPassword(
      RequestResetPassword requestResetPassword);

  String? getPasscode();
  void deletePasscode();
  void setLocale(Locale locale);
  Locale getLocale();
  Future<NormalResponse> deleteAccount();
  Future<NormalResponse> editProfile(UserToEdit userToEdit, String pricture);
  Future<NormalResponse> changePassword(PasswordToChange passwordToChange);
  User? getUser();
  Future<User?> fetchUser();
  Future<NormalResponse> userHaveSetLog();
}
