import 'package:whatasapp_status/Bloc/Bloc.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenEvent.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenState.dart';
import 'package:whatasapp_status/helper/getFilesList.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  @override
  mapEventToState(event) {
    if (event is InitilizeFiles) {
      emit(Loading());
      GetFileList.getFilesList().then((value) => emit(LoadingCompleted()));
    } else if (event is RefreshFiles) {
       emit(Loading());
      GetFileList.getFilesList().then((value) => emit(LoadingCompleted()));
    }
  }
}
