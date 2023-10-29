import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/features/dashboard/cubit/get_video_cubit.dart';
import 'package:video_app/features/dashboard/ui/widget/video_list_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetVideoCubit(videoRepository: RepositoryProvider.of(context))
            ..getVideo(),
      child: const VideoListWidget(),
    );
  }
}
