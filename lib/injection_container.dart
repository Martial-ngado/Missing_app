import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:missing/repositores/firebase_repository.dart';
import 'package:missing/repositores/firebase_repository_implementation.dart';
import 'package:missing/uses-cases/post_usecases/create_post.dart';
import 'package:missing/uses-cases/post_usecases/delete_post.dart';
import 'package:missing/uses-cases/post_usecases/read_post.dart';
import 'package:missing/uses-cases/post_usecases/read_single_post.dart';
import 'package:missing/uses-cases/post_usecases/update_post.dart';
import 'package:missing/uses-cases/user_usecases/create_user.dart';
import 'package:missing/uses-cases/user_usecases/get_current_uid.dart';
import 'package:missing/uses-cases/user_usecases/get_single_other_user.dart';
import 'package:missing/uses-cases/user_usecases/get_single_user.dart';
import 'package:missing/uses-cases/user_usecases/get_users.dart';
import 'package:missing/uses-cases/user_usecases/is_sign_in.dart';
import 'package:missing/uses-cases/user_usecases/sign_in_user.dart';
import 'package:missing/uses-cases/user_usecases/sign_out_user.dart';
import 'package:missing/uses-cases/user_usecases/sign_up_user.dart';
import 'package:missing/uses-cases/user_usecases/update_user.dart';

import 'cubit/auth/auth_cubit.dart';
import 'cubit/credential/credential_cubit.dart';
import 'cubit/post/get_single_post/get_single_post_cubit.dart';
import 'cubit/post/post_cubit.dart';
import 'cubit/user/get_single_other_user/get_single_other_user_cubit.dart';
import 'cubit/user/get_single_user/get_single_user_cubit.dart';
import 'cubit/user/user_cubit.dart';
import 'data_source/remote_data_source.dart';
import 'data_source/remote_data_source_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(
        () => AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentUidUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
        () => CredentialCubit(
      signUpUseCase: sl.call(),
      signInUserUseCase: sl.call(),
    ),
  );

  sl.registerFactory(
        () => UserCubit(
        updateUserUseCase: sl.call(),
        getUsersUseCase: sl.call(),

    ),
  );

  sl.registerFactory(
        () => GetSingleUserCubit(
        getSingleUserUseCase: sl.call()
    ),
  );

  sl.registerFactory(
        () => GetSingleOtherUserCubit(
        getSingleOtherUserUseCase: sl.call()
    ),
  );
  sl.registerFactory(
        () => PostCubit(
        createPostUseCase: sl.call(),
        deletePostUseCase: sl.call(),
        readPostUseCase: sl.call(),
        updatePostUseCase: sl.call()
    ),
  );

  sl.registerFactory(
        () => GetSinglePostCubit(
        readSinglePostUseCase: sl.call()
    ),
  );

  // Post Cubit Injection









  // Use Cases

  //post use cases
  sl.registerLazySingleton(() => CreatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadPostsUseCase(repository: sl.call()));

  sl.registerLazySingleton(() => UpdatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => DeletePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => ReadSinglePostUseCase(repository: sl.call()));
  // User
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUseCase(repository: sl.call()));

  sl.registerLazySingleton(() => GetSingleOtherUserUseCase(repository: sl.call()));

  // Cloud Storage







  // Repository

  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  // Remote Data Source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() => FirebaseRemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseAuth: sl.call(), firebaseStorage: sl.call()));

  // Externals

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseStorage);
}