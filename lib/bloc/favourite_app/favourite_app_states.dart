import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:experimenting_bloc_app/model/favourite_item_model.dart';


enum ListStatus{loading, sucess, failure}
class FavouriteAppStates extends Equatable{
  final List<FavouriteItemModel>  favouriteItenList;
  final List<FavouriteItemModel> tempFavouriteItemList;
  final ListStatus listStatus;
  const FavouriteAppStates({this.favouriteItenList= const[], this.tempFavouriteItemList = const [], this.listStatus = ListStatus.loading});

  FavouriteAppStates copywith({List<FavouriteItemModel>? favouriteItenList,List<FavouriteItemModel>? tempFavouriteItemList, ListStatus? listStatus}){
    return FavouriteAppStates(favouriteItenList: favouriteItenList?? this.favouriteItenList,tempFavouriteItemList: tempFavouriteItemList?? this.tempFavouriteItemList, listStatus: listStatus?? this.listStatus);
  }
  @override
  List<Object?> get props => [favouriteItenList,tempFavouriteItemList, listStatus];
}