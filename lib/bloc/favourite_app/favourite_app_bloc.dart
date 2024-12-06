import 'package:bloc/bloc.dart';
import 'package:experimenting_bloc_app/bloc/favourite_app/favourite_app_event.dart';
import 'package:experimenting_bloc_app/bloc/favourite_app/favourite_app_states.dart';
import 'package:experimenting_bloc_app/model/favourite_item_model.dart';
import 'package:experimenting_bloc_app/repository/favourite_repository.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteRepository favouriteRepository;
  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppStates()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }
  void fetchList(
      FavouriteAppEvent event, Emitter<FavouriteAppStates> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copywith(
        favouriteItenList: List.from(favouriteList),
        listStatus: ListStatus.sucess));
  }

  void _addFavouriteItem(
      FavouriteItem event, Emitter<FavouriteAppStates> emit) async {
      final index = favouriteList.indexWhere((element) => element.id == event.item.id); 
      if(event.item.isFavourite){
        if(tempFavouriteList.contains(favouriteList[index])){
          tempFavouriteList.remove(favouriteList[index]);
          tempFavouriteList.add(event.item);
        }
        
      }else{
        if(tempFavouriteList.contains(favouriteList[index])){
          tempFavouriteList.remove(favouriteList[index]);
          tempFavouriteList.add(event.item);
        }
      }
      favouriteList[index] = event.item;
      emit(state.copywith(favouriteItenList: List.from(favouriteList),tempFavouriteItemList: List.from(tempFavouriteList)));
}

  void _selectItem(
      SelectItem event, Emitter<FavouriteAppStates> emit) async {
        tempFavouriteList.add(event.item);
        emit(state.copywith(tempFavouriteItemList: List.from(tempFavouriteList))); 
}

  void _unSelectItem(
      UnSelectItem event, Emitter<FavouriteAppStates> emit) async {
     tempFavouriteList.remove(event.item);
     emit(state.copywith(tempFavouriteItemList: List.from(tempFavouriteList)));
}

  void _deleteItem(
      DeleteItem event, Emitter<FavouriteAppStates> emit) async {
        for(int i=0; i< tempFavouriteList.length; i++){
          favouriteList.remove(tempFavouriteList[i]);
        }
        tempFavouriteList.clear();
        emit(state.copywith(favouriteItenList: List.from(favouriteList), tempFavouriteItemList: List.from(tempFavouriteList)));
}
}