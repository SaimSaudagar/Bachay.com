import 'package:app/Models/Home/Featured_Product.dart';
import 'package:bloc/bloc.dart';
import '../../Repository/Homepage_Repo.dart';
import '../../Repository/Product_Repository.dart';
import 'Product_Event.dart';
import 'Product_State.dart';


// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductRepository repository;

//   ProductBloc(this.repository) : super(ProductInitial()) {
//     on<FetchProducts>((event, emit) async {
//       emit(ProductLoading());
//       try {
//         final products = await repository.fetchProducts();
//         emit(ProductLoaded(products));
//       } catch (e) {
//         emit(ProductError(e.toString()));
//       }
//     });
//   }
// }


// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductRepository repository;

//   ProductBloc(this.repository) : super(ProductInitial()) {
//     on<FetchProducts>((event, emit) async {
//       emit(ProductLoading());
//       try {
//         final products = await repository.fetchProducts();
//         emit(ProductLoaded(products));
//       } catch (e) {
//         emit(ProductError(e.toString()));
//       }
//     });
//   }
// }


// all_products_bloc.dart


class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final HomeRepository homeRepository;

  AllProductsBloc({required this.homeRepository}) : super(AllProductsInitial()) {
    on<LoadAllProducts>(_onLoadAllProducts);
  }

  Future<void> _onLoadAllProducts(
    LoadAllProducts event,
    Emitter<AllProductsState> emit,
  ) async {
    emit(AllProductsLoading());
    try {
      final products = await homeRepository.fetchFeaturedProducts();
      emit(AllProductsLoaded(products.products)); // Ensure it returns a List<FeaturedProduct>
    } catch (e) {
      emit(AllProductsError());
    }
  }
}
