import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/common/constant/env.dart';
import 'package:video_app/common/utils/internet_checker.dart';
import 'package:video_app/features/dashboard/repository/all_video_repository.dart';
import 'package:video_app/features/dashboard/repository/video_repositiry.dart';
import 'package:video_app/https/api_provider.dart';

class MultiRepositoryWrapper extends StatelessWidget {
  final Widget child;
  final Env env;
  const MultiRepositoryWrapper(
      {super.key, required this.child, required this.env});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Env>(
          create: (context) => env,
          lazy: true,
        ),
        RepositoryProvider<InternetCheck>(
          create: (context) => InternetCheck(),
        ),
        RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider(
            baseUrl: RepositoryProvider.of<Env>(context).baseUrl,
          ),
          lazy: true,
        ),
        RepositoryProvider(create: (context) => AllVideoRepository()),
        RepositoryProvider(
            create: (context) => VideoRepository(
                env: env,
                allVideoRepository:
                    RepositoryProvider.of<AllVideoRepository>(context),
                apiProvider: RepositoryProvider.of<ApiProvider>(context)))
      ],
      child: child,
    );
  }
}
