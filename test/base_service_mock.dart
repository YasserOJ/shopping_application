import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_application/core/service/base_service.dart';

class BaseServiceMock extends Mock implements BaseService {}

@GenerateMocks(<Type>[BaseServiceMock])
class Mocks {}
