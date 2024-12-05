import 'package:bloc/bloc.dart';
import 'package:experimenting_bloc_app/bloc/image_picker/image_picker_event.dart';
import 'package:experimenting_bloc_app/bloc/image_picker/image_picker_state.dart';
import 'package:experimenting_bloc_app/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState>{
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()){
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(pickImageFromGallery);
  }

  void cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.captureImage();
    emit(state.copywith(file: file));
  }

    void pickImageFromGallery(GalleryImagePicker event, Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copywith(file: file));
  }
}