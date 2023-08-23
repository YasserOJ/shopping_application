import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shopping_application/core/constants/app_constants.dart';
import 'package:shopping_application/core/exceptions/generic_exception.dart';
import 'package:shopping_application/core/exceptions/server_exception.dart';
import 'package:shopping_application/modules/shop/data/data_source/products_remote_data_source.dart';
import 'package:shopping_application/modules/shop/data/data_source/products_remote_data_source_imp.dart';
import 'package:shopping_application/modules/shop/data/models/product_response_model.dart';

import '../../../../base_service_mock.mocks.dart';
import '../../../../test_assets/file_reader.dart';

void main() {
  late ProductsRemoteDataSource dataSource;
  late MockBaseServiceMock mockBaseService;
  late http.Response wsHttpResponse;

  setUp(() {
    mockBaseService = MockBaseServiceMock();
    dataSource = ProductsRemoteDataSourceImp(
      mockBaseService,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(
      mockBaseService.getWS(
        uri: productsUri,
      ),
    ).thenAnswer((_) async {
      wsHttpResponse = http.Response(
        jsonString('shop_products_success_response.json'),
        200,
      );
      return wsHttpResponse;
    });
  }

  void setUpMockHttpClientServerException() {
    when(
      mockBaseService.getWS(
        uri: productsUri,
      ),
    ).thenAnswer((_) => throw ServerException());
  }

  void setUpMockHttpClientGenericException() {
    when(
      mockBaseService.getWS(
        uri: productsUri,
      ),
    ).thenAnswer((_) => throw GenericException());
  }

  group('getAllShopProducts Success', () {
    final dynamic decodedJson = jsonDecode(
      jsonString('shop_products_success_response.json'),
    );
    final ProductResponseModel productResponseModel =
        ProductResponseModel.fromMap(
      decodedJson[0],
    );
    test('verify baseService.getWS called once', () async {
      //arrange
      setUpMockHttpClientSuccess200();

      //act
      await dataSource.getProductsList();

      //assert
      verify(
        mockBaseService.getWS(
          uri: productsUri,
        ),
      ).called(1);
    });

    test(
        'should return ProductResponseModel when the response code is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSource.getProductsList();

      //arrange
      expect(
        result[0].id,
        productResponseModel.id,
      );
    });
  });
  group('getAllShopProducts Failure', () {
    test('should return ServerException when the response code is  (Failure)',
        () async {
      //arrange
      setUpMockHttpClientServerException();
      //act
      //arrange
      await expectLater(dataSource.getProductsList(), throwsException);
      //expect(() => dataSource.getProductsList(), throwsException);
    });
    test('should return GenericException when the response code is  (Failure)',
        () async {
      //arrange
      setUpMockHttpClientGenericException();
      //act
      //arrange
      await expectLater(dataSource.getProductsList(), throwsException);
      //expect(() => dataSource.getProductsList(), throwsException);
    });
  });
}
