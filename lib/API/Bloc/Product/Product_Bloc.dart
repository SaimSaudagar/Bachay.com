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

    on<LoadRcommendedProducts>((event, emit) async {
      emit(RecommendedProductsLoading());
      try {
        final allProducts =
            await productRepository.fetchRecommendedProducts(event.productId);
        emit(RecommendedProductsLoaded(allProducts));
      } catch (e) {
        emit(RecommendedProductsError(e.toString()));
      }
    });

    on<LoadMostPopularProducts>((event, emit) async {
      emit(MostPopularProductsLoading());
      try {
        final allProducts = await productRepository.fetchMostPopularProducts();
        emit(MostPopularProductsLoaded(allProducts));
      } catch (e) {
        emit(MostPopularProductsError(e.toString()));
      }
    });

    on<LoadBestSellingProducts>((event, emit) async {
      emit(BestSellingProductsLoading());
      try {
        final allProducts = await productRepository.fetchBestSellingProducts();
        emit(BestSellingProductsLoaded(allProducts));
      } catch (e) {
        emit(BestSellingProductsError(e.toString()));
      }
    });

    on<LoadTopRatedProducts>((event, emit) async {
      emit(TopRatedProductsLoading());
      try {
        final allProducts = await productRepository.fetchTopRatedProducts();
        emit(TopRatedProductsLoaded(allProducts));
      } catch (e) {
        emit(TopRatedProductsError(e.toString()));
      }
    });
  }
}
