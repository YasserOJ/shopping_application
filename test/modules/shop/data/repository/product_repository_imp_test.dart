import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_application/core/common_models/api_result_model.dart';
import 'package:shopping_application/core/exceptions/generic_exception.dart';
import 'package:shopping_application/core/exceptions/server_exception.dart';
import 'package:shopping_application/core/utils/connectivity/network_info.dart';
import 'package:shopping_application/modules/shop/data/data_source/products_remote_data_source.dart';
import 'package:shopping_application/modules/shop/data/models/product_response_model.dart';
import 'package:shopping_application/modules/shop/data/repository/product_repository_imp.dart';
import 'package:shopping_application/modules/shop/domain/repository/product_repository.dart';

import '../../../../test_assets/file_reader.dart';
import 'product_repository_imp_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  MockSpec<ProductsRemoteDataSource>(),
  MockSpec<NetworkInfo>()
])
void main() {
  late ProductRepository repository;
  late MockProductsRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo networkInfo;
  late List<ProductResponseModel> dataSourceResponse;

  setUp(() {
    mockRemoteDataSource = MockProductsRemoteDataSource();
    networkInfo = MockNetworkInfo();
    networkInfo.isConnected;
    repository = ProductRepositoryImp(
      mockRemoteDataSource,
      networkInfo,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(networkInfo.isConnected).thenAnswer((_) async {
      return true;
    });
    when(mockRemoteDataSource.getProductsList()).thenAnswer((_) async {
      final wsHttpResponse = http.Response(
        jsonString('shop_products_success_response.json'),
        200,
      );
      final decodedJson = jsonDecode(wsHttpResponse.body);
      dataSourceResponse = List<ProductResponseModel>.from(
        decodedJson.map(
          (x) => ProductResponseModel.fromMap(x),
        ),
      );
      return dataSourceResponse;
    });
  }

  void setUpMockHttpClientServerFailure() {
    when(networkInfo.isConnected).thenAnswer((_) async {
      return true;
    });
    when(
      mockRemoteDataSource.getProductsList(),
    ).thenAnswer((_) async => throw ServerException());
  }

  void setUpMockHttpClientGenericFailure() {
    when(networkInfo.isConnected).thenAnswer((_) async {
      return true;
    });
    when(
      mockRemoteDataSource.getProductsList(),
    ).thenAnswer((_) async => throw GenericException());
  }

  group('getAllShopProducts Success', () {
    test('verify baseService.getWS called once', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await repository.getAllProducts();

      //assert
      verify(
        mockRemoteDataSource.getProductsList(),
      ).called(1);
    });

    test(
        'should return ProductResponseModel when the response code is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await repository.getAllProducts();

      //arrange
      switch (result) {
        case Success(data: final data):
          expect(data[0].id, dataSourceResponse[0].id);
        case Failure(errorModel: final _):
          break;
      }
    });
  });
  group('getAllShopProducts Failure', () {
    test('should return ServerException when the response code is  (Failure)',
        () async {
      //arrange
      setUpMockHttpClientServerFailure();
      //act
      final result = repository.getAllProducts();
      //arrange
      switch (result) {
        case Failure(errorModel: final error):
          expect(error.message, 'Status code is different than success codes');
      }
    });
    test('should return GenericException when the response code is  (Failure)',
        () async {
      //arrange
      setUpMockHttpClientGenericFailure();
      //act
      final result = repository.getAllProducts();
      //arrange
      switch (result) {
        case Failure(errorModel: final error):
          expect(error.message, 'Server Exception');
      }
    });
  });
}
