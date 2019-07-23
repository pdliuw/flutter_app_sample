import 'package:flutter_app_sample/component/BasePresenter.dart';

///MVP--View-
abstract class BaseView<T extends BasePresenter> {
  setPresenter(T presenter);
}
