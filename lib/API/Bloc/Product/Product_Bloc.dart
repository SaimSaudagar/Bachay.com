import 'package:app/API/Bloc/Product/Product_Event.dart';
import 'package:app/API/Bloc/Product/Product_State.dart';
import 'package:app/API/Repository/Product_Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadAllProducts>((event, emit) async {
      emit(AllProductsLoading());
      try {
        final allProducts = await productRepository.fetchAllProducts();
        emit(AllProductsLoaded(allProducts));
      } catch (e) {
        print(e.toString());
        emit(AllProductsError(e.toString()));
      }
    });
  }
}
