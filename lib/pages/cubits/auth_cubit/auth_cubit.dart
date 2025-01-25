import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> createUserMethod(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errMessage: 'The email already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }

  Future<void> signInUserMethod(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        emit(
            LoginFailure(errMessage: 'Wrong password provided for that user.'));
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure(errMessage: 'Invalid email format.'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
