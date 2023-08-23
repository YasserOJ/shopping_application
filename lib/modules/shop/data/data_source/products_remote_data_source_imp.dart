import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/constants/app_constants.dart';
import 'package:shopping_application/core/exceptions/generic_exception.dart';
import 'package:shopping_application/core/exceptions/server_exception.dart';
import 'package:shopping_application/core/service/base_service.dart';
import 'package:shopping_application/modules/shop/data/data_source/products_remote_data_source.dart';
import 'package:shopping_application/modules/shop/data/models/product_response_model.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImp implements ProductsRemoteDataSource {
  final BaseService baseService;

  ProductsRemoteDataSourceImp(this.baseService);

  @override
  Future<List<ProductResponseModel>> getProductsList() async {
    try {
      final http.Response response = await baseService.getWS(uri: productsUri);
      final dynamic decodedJson = jsonDecode(response.body);
      final List<ProductResponseModel> products =
          List<ProductResponseModel>.from(
        decodedJson.map(
          (x) => ProductResponseModel.fromMap(x),
        ),
      );
      return products;
    } on ServerException catch (serverException) {
      throw ServerException(
        info: serverException.info,
      );
    } on GenericException catch (serverException) {
      throw GenericException(
        statusCode: serverException.statusCode,
        message: serverException.message,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
