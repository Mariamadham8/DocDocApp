part of 'signup_cubit.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial<T>;
  const factory SignupState.loading() = Loading<T>;
  const factory SignupState.success(T data) = Success<T>;
  const factory SignupState.error(String message) = Error<T>;
}
