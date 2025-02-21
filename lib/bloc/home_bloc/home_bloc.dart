import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProducts) {
      yield ProductLoading();
      try {
        // Simulate fetching products from a repository or API
        await Future.delayed(Duration(seconds: 2));
        yield ProductLoaded(products: ['Product 1', 'Product 2', 'Product 3']);
      } catch (e) {
        yield ProductError(message: 'Failed to load products');
      }
    }
  }
}
