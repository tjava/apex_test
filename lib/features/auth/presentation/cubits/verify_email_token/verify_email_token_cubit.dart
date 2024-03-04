import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/auth/domain/entities/email_token_entity.dart';
import 'package:apex_test/features/auth/domain/usecases/verify_email_token_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'verify_email_token_state.dart';

@injectable
class VerifyEmailTokenCubit extends Cubit<VerifyEmailTokenState> {
  final VerifyEmailTokenUsecase verifyEmailTokenUsecase;
  VerifyEmailTokenCubit(this.verifyEmailTokenUsecase) : super(VerifyEmailTokenInitial());

  Future<void> verifyEmailToken(Map<String, dynamic> params) async {
    emit(const Loading());

    final result = await verifyEmailTokenUsecase(params);

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        }
        emit(Error(failure.message!));
      },
      (EmailTokenEntity emailTokenEntity) => emit(Loaded(emailTokenEntity)),
    );
  }
}
