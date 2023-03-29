import 'package:get_it/get_it.dart';
import 'package:tif_assignment/viewModels/home_viewModel.dart';
import 'package:tif_assignment/viewModels/searchViewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => SearchViewModel());
}
