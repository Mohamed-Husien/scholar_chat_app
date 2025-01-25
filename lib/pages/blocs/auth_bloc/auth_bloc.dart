import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(RegisterLoading());
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailure(
                errMessage: 'The password provided is too weak.'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure(
                errMessage: 'The email already exists for that email.'));
          }
        } catch (e) {
          emit(RegisterFailure(errMessage: e.toString()));
        }
      }
    });
  }
}
