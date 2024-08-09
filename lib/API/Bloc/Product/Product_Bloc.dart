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
        final allProducts =
            await productRepository.fetchAllProducts(event.colors, event.ages);
        emit(AllProductsLoaded(allProducts));
      } catch (e) {
        print(e.toString());
        emit(AllProductsError(e.toString()));
      }
    });

    on<LoadSingleProduct>((event, emit) async {
      emit(SingleProductLoading());
      try {
        final allProducts =
            await productRepository.fetchSingleproduct(event.productId);
        emit(SingleProductLoaded(allProducts));
      } catch (e) {
        emit(SingleProductError(e.toString()));
      }
    });

    on<AddToCart>((event, emit) async {
      emit(AddToCartLoading());
      try {
        final status =
            await productRepository.addToCart(event.productId, event.quantity);
        emit(AddToCartLoaded(status));
      } catch (e) {
        emit(AddToCartError(e.toString()));
      }
    });
  }
}
