import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/common/constant/env.dart';
import 'package:video_app/features/dashboard/cubit/get_video_cubit.dart';
import 'package:video_app/features/dashboard/repository/video_repositiry.dart';

class MultiBlocWrapper extends StatelessWidget {
  final Widget child;
  final Env env;

  const MultiBlocWrapper({Key? key, required this.child, required this.env})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetVideoCubit(
                videoRepository:
                    RepositoryProvider.of<VideoRepository>(context)))
      ],
      child: child,
    );
  }
}
