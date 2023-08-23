import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/common_models/api_result_model.dart';
import 'package:shopping_application/core/common_models/error_model.dart';
import 'package:shopping_application/core/exceptions/generic_exception.dart';
import 'package:shopping_application/core/exceptions/server_exception.dart';
import 'package:shopping_application/core/utils/connectivity/network_info.dart';
import 'package:shopping_application/modules/shop/data/data_source/products_remote_data_source.dart';
import 'package:shopping_application/modules/shop/data/models/product_response_model.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';
import 'package:shopping_application/modules/shop/domain/repository/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImp extends ProductRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImp(this.productsRemoteDataSource, this.networkInfo);

  @override
  Future<ApiResultModel<List<ProductEntity>>> getAllProducts() async {
    final bool isDeviceConnected = await networkInfo.isConnected;
    if (isDeviceConnected) {
      try {
        final List<ProductResponseModel> result =
            await productsRemoteDataSource.getProductsList();
        final List<ProductEntity> productEntities =
            result.map((product) => product.mapToEntity()).toList();
        return Success(productEntities);
      } on ServerException catch (serverException) {
        return Failure(
          ErrorModel(message: serverException.info),
        );
      } on GenericException catch (serverException) {
        return Failure(
          ErrorModel(
            message: serverException.message,
            statusCode: serverException.statusCode,
          ),
        );
      } catch (e) {
        return Failure(ErrorModel());
      }
    } else {
      return Failure(ErrorModel());
    }
  }
}
