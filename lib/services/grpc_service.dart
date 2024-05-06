import 'package:bdaya_social_task/gen/bdaya/social_training/v1/service.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GrpcService {
  final channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
    host: 'localhost',
    port: 50051,
    transportSecure: false,
  );

  PostServiceClient get postApi => PostServiceClient(channel);
}


//50051