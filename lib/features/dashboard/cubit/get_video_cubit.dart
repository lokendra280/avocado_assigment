import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/common/cubit/data_state.dart';
import 'package:video_app/features/dashboard/model/user_model.dart';
import 'package:video_app/features/dashboard/repository/video_repositiry.dart';
import 'package:video_app/https/response.dart';

class GetVideoCubit extends Cubit<CommonState> {
  final VideoRepository videoRepository;
  GetVideoCubit({required this.videoRepository}) : super(CommonInitial());

  getVideo() async {
    emit(CommonLoading());
    await Future.delayed(const Duration(milliseconds: 200));
    final res = await videoRepository.getvideolist();
    if (res.status == Status.success) {
      if (res.data != null && res.data!.isNotEmpty) {
        emit(CommonDataFetchSuccess<UserModel>(data: res.data!));
      } else {
        emit(const CommonNoData());
      }
    } else {
      emit(CommonError(message: res.message ?? "something went worng"));
    }
  }
}
