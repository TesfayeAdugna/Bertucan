import 'dart:developer';
import 'dart:ui';

import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/components/dialogs/forgot_password_dialog.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final IAuthRepository _authRepository;

  AuthController(this._authRepository);

  final _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) {
    _status.value = value;
  }

  final _user = User(id: -1).obs;
  User get user => _user.value;
  set user(User value) {
    _user.value = value;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await _authRepository.fetchUser();
    getUser();
  }

  void getUser() {
    user = _authRepository.getUser() ?? User(id: -1);
    log(user.toJson().toString());
  }

  final _questionnairies = <QuestionnaireModel>[].obs;
  List<QuestionnaireModel> get questionnairies => _questionnairies.value;
  set questionnairies(List<QuestionnaireModel> value) {
    _questionnairies.value = value;
  }

  final _answeredQuestionnairies = <QuestionnaireModel>[].obs;

  getQuestionnairies() async {
    questionnairies.clear();
    questionnairies = _authRepository.getQuestionnairies();
  }

  setAnswer(QuestionnaireModel questionnaire, List<int> answerIndexes) async {
    questionnaire.answerIndexs = answerIndexes;
    _answeredQuestionnairies.add(questionnaire);
    log(questionnaire.toJson().toString());
    if (questionnairies.length == questionnaire.id) {
      saveQuestionairAnswers();
    }
  }

  saveQuestionairAnswers() async {
    _authRepository.saveQuestionnairAnswers(_answeredQuestionnairies.value);
    Get.offAndToNamed(Routes.homePage);
  }

  Future<void> signUp(UserToSignUp signUpPayload) async {
    status = RxStatus.loading();
    await _authRepository.signUp(signUpPayload).then((value) async {
      if (value.success) {
        await signIn(UserToLogin(
          email: signUpPayload.email,
          password: signUpPayload.password,
        ));
        status = RxStatus.success();
        toast('success', 'user_signed_up_successfully');
      } else {
        status = RxStatus.error();
      }
    }).catchError((onError) {
      status = RxStatus.error();
    });
  }

  Future<void> signIn(UserToLogin loginPayload) async {
    status = RxStatus.loading();
    await _authRepository.signIn(loginPayload).then((value) async {
      if (value != null) {
        user = value;
        await _authRepository.userHaveSetLog().then((value) {
          if (value.success && value.message.isNotEmpty) {
            Get.offAndToNamed(Routes.homePage);
            toast('success', 'loading_previous_log');
          } else {
            Get.offAndToNamed(Routes.questionnairePage);
          }
        });
        status = RxStatus.success();
      } else {
        status = RxStatus.error();
      }
    }).catchError((onError) {
      status = RxStatus.error();
    });
  }

  setPasscode(String passcode) async {
    _authRepository.setPasscode(passcode);
  }

  String? getPasscode() {
    return _authRepository.getPasscode();
  }

  deletePasscode() {
    _authRepository.deletePasscode();
  }

  logout() {
    _authRepository.logOut();
    user = User(id: -1);
    Get.offAllNamed(Routes.loginPage);
  }

  setLocale(Locale locale) {
    log(locale.languageCode);
    Get.updateLocale(locale);
    _authRepository.setLocale(locale);
  }

  getLocale() {
    return _authRepository.getLocale();
  }

  editProfile(UserToEdit userToEdit, picture) async {
    status = RxStatus.loading();
    await _authRepository.editProfile(userToEdit, picture).then((value) {
      if (value.success) {
        status = RxStatus.success();
        getUser();
      } else {
        status = RxStatus.error();
      }
    }).catchError((onError) {
      status = RxStatus.error();
    });
  }

  deleteAccount() async {
    status = RxStatus.loading();
    await _authRepository.deleteAccount().then((value) {
      if (value.success) {
        status = RxStatus.success();
        Get.offAndToNamed(Routes.loginPage);
        toast('success', 'account_deleted_successfully');
      } else {
        status = RxStatus.error();
        toast('error', 'account_not_deleted');
      }
    }).catchError((onError) {
      status = RxStatus.error();
      toast('error', 'account_not_deleted');
    });
  }

  changePassword(PasswordToChange passwordToChange) async {
    status = RxStatus.loading();
    await _authRepository.changePassword(passwordToChange).then((value) {
      if (value.success) {
        status = RxStatus.success();
        toast('success', 'password_changed');
        logout();
      } else {
        status = RxStatus.error();
        toast('error', value.message ?? 'password_not_changed');
      }
    }).catchError((onError) {
      status = RxStatus.error();
      toast('error', 'password_not_changed');
    });
  }

  Future<void> requestResetPassword(
      RequestResetPassword requestResetPassword) async {
    status = RxStatus.loading();
    await _authRepository
        .requestResetPassword(requestResetPassword)
        .then((value) {
      if (value.success) {
        status = RxStatus.success();
        toast('success', 'reset_password_email_sent');
        Get.back();
        Get.dialog(
          ResetForgotPassword(),
          barrierColor: Colors.grey.withOpacity(0.1),
        );
      } else {
        status = RxStatus.error();
        toast('error', value.message ?? 'reset_password_email_not_sent');
      }
    }).catchError((onError) {
      status = RxStatus.error();
      toast('error', 'reset_password_email_not_sent');
    });
  }

  Future<void> resetPassword(ResetPassword resetPassword) async {
    status = RxStatus.loading();
    await _authRepository.resetPassword(resetPassword).then((value) {
      if (value.success) {
        status = RxStatus.success();
        toast('success', 'password_reset');
        Get.back();
      } else {
        status = RxStatus.error();
        toast('error', value.message ?? 'password_not_reset');
      }
    }).catchError((onError) {
      status = RxStatus.error();
      toast('error', 'password_not_reset');
    });
  }
}
