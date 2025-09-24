import 'package:remote/remote/core/dio_service.dart';
import 'package:remote/remote/virus_total/virus_total_api.dart';
import 'package:remote/remote/virus_total/virus_total_remote_datasource.dart';
import 'package:remote/remote/virus_total/virus_total_remote_datasource_impl.dart';
import 'package:riverpod/riverpod.dart';

final virusTotalRemoteDataSourceProvider =
    Provider.family<VirusTotalRemoteDataSource, String>(
      (ref, apiKey) => VirusTotalRemoteDatasourceImpl(
        VirusTotalApi(DioService.instance(apiKey)),
      ),
    );
