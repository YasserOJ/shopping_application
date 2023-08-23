import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/common_models/api_result_model.dart';
import 'package:shopping_application/core/usecase/generic_usecase.dart';
import 'package:shopping_application/modules/shop/domain/entity/product_entity.dart';
import 'package:shopping_application/modules/shop/domain/repository/product_repository.dart';

@injectable
class GetAllProductsUseCase
    implements GenericUseCase<List<ProductEntity>, NoParams> {
  final ProductRepository productRepository;

  GetAllProductsUseCase(this.productRepository);

  @override
  Future<ApiResultModel<List<ProductEntity>>> call(NoParams params) async {
    return await productRepository.getAllProducts();
  }
}
