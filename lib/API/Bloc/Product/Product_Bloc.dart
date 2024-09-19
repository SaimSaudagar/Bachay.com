import 'package:app/API/Bloc/Product/Product_Event.dart';
import 'package:app/API/Bloc/Product/Product_State.dart';
import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/Models/Products/Products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  List<Product> _allProducts = []; // Maintain a list of all loaded products
  String? _nextPageUrl;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadAllProducts>((event, emit) async {
      try {
        if (event.nextPageUrl == null) {
          emit(AllProductsLoading());
        } else {
          emit(AllProductsLoadingMore());
        }

        final response = await productRepository.fetchAllProducts(
          event.colors,
          event.ages,
          nextPageUrl: event.nextPageUrl,
        );

        if (event.nextPageUrl == null) {
          _allProducts = response.allProducts?.data ?? [];
        } else {
          _allProducts.addAll(response.allProducts?.data ?? []);
        }

        _nextPageUrl = response.allProducts?.nextPageUrl;

        emit(AllProductsLoaded(
          AllProduct(
            allProducts: AllProducts(
              data: _allProducts,
              currentPage: response.allProducts!.currentPage,
              firstPageUrl: response.allProducts!.firstPageUrl,
              from: response.allProducts!.from,
              lastPage: response.allProducts!.lastPage,
              lastPageUrl: response.allProducts!.lastPageUrl,
              links: response.allProducts!.links,
              nextPageUrl: response.allProducts!.nextPageUrl,
              path: response.allProducts!.path,
              perPage: response.allProducts!.perPage,
              prevPageUrl: response.allProducts!.prevPageUrl,
              to: response.allProducts!.to,
              total: response.allProducts!.total,
            ),
            filter: response.filter,
          ),
        ));
      } catch (e) {
        emit(AllProductsError(e.toString()));
      }
    });

    // Load a single product
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

    // Add to cart
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

    // Load recommended products
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

    // Load most popular products
    on<LoadMostPopularProducts>((event, emit) async {
      emit(MostPopularProductsLoading());
      try {
        final allProducts = await productRepository.fetchMostPopularProducts();
        emit(MostPopularProductsLoaded(allProducts));
      } catch (e) {
        emit(MostPopularProductsError(e.toString()));
      }
    });

    // Load best selling products
    on<LoadBestSellingProducts>((event, emit) async {
      emit(BestSellingProductsLoading());
      try {
        final allProducts = await productRepository.fetchBestSellingProducts();
        emit(BestSellingProductsLoaded(allProducts));
      } catch (e) {
        emit(BestSellingProductsError(e.toString()));
      }
    });

    // Load top rated products
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
