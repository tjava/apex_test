import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/auth/domain/entities/email_token_entity.dart';
import 'package:apex_test/features/auth/domain/usecases/get_email_token_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_email_token_state.dart';

@injectable
class GetEmailTokenCubit extends Cubit<GetEmailTokenState> {
  final GetEmailTokenUsecase getEmailTokenUsecase;
  GetEmailTokenCubit(this.getEmailTokenUsecase) : super(GetEmailTokenInitial());

  Future<void> getEmailToken(String email) async {
    emit(const Loading());

    final result = await getEmailTokenUsecase(email);

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
