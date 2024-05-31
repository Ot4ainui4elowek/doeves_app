import 'package:dio/dio.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_in_request_model.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_in_response_model.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_up_request_model.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'authorization_client_data_source.g.dart';

@RestApi(baseUrl: '')
abstract class AuthorizationClientDataSource {
  factory AuthorizationClientDataSource(Dio dio, {String baseUrl}) =
      _AuthorizationClientDataSource;

  @POST('/api/v1/user/login')
  Future<HttpResponse<SignInResponseModel>> signIn(
      @Body() SignInRequestModel data);
  @POST('/api/v1/user/make')
  Future<HttpResponse<SignUpResponseModel>> signUp(
      @Body() SignUpRequestModel data);
}
