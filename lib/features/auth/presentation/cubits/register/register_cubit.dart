import 'package:apex_test/core/constants/string_constant.dart';
import 'package:apex_test/features/auth/domain/entities/user_response_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:apex_test/features/auth/domain/usecases/register_usecase.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  Future<void> register(RegisterPayloadEntity registerPayloadEntity) async {
    emit(const Loading());

    final result = await registerUsecase(registerPayloadEntity);

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        }
        emit(Error(failure.message ?? kGenericError));
      },
      (UserResponseEntity userResponseEntity) => emit(Loaded(userResponseEntity)),
    );
  }

  void showPassword(bool val) {
    emit(ShowPassword(val ? false : true));
  }
}
