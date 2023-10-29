import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/common/common_error_widget.dart';
import 'package:video_app/common/cubit/data_state.dart';
import 'package:video_app/common/navigation/navigation_service.dart';
import 'package:video_app/common/shimmer_widget.dart';
import 'package:video_app/common/utils/size_utils.dart';
import 'package:video_app/features/dashboard/cubit/get_video_cubit.dart';
import 'package:video_app/features/dashboard/model/user_model.dart';
import 'package:video_app/features/dashboard/ui/widget/video_card.dart';
import 'package:video_app/features/dashboard/ui/widget/view_video_Details.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final allNews =
    //     RepositoryProvider.of<AllKrishiRepository>(context).getkrishi;

    return BlocBuilder<GetVideoCubit, CommonState>(
      builder: (context, state) {
        if (state is CommonLoading) {
          return SizedBox(
            child: ListViewPlaceHolder(
              itemHeight: 200.hp,
              numberofItem: 1,
            ),
          );
        } else if (state is CommonError) {
          return CommonErrorWidget(
            hideImage: true,
            message: state.message,
          );
        } else if (state is CommonNoData) {
          return const Center(child: Text(("Data Not Found")));
        } else if (state is CommonDataFetchSuccess<UserModel>) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(vertical: 5.hp, horizontal: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 0,
              mainAxisSpacing: 9.hp,
            ),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final data = state.data[index];
              return SizedBox(
                child: VideoCards(
                  onPressed: () {
                    NavigationService.push(
                        target: VideoDetailsWidget(userModel: data));
                  },
                  date: "hello",
                  // imageUrl: data.media.medias.first.path,
                  title: data.title,
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
