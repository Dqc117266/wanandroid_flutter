import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/banner_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/repository/home_repository.dart';

class GetBannerUseCase {
  final HomeRepository homeRepository;

  GetBannerUseCase(this.homeRepository);

  Future<Result<BaseResponse<List<BannerModel>>>> call() async {
    final result = await homeRepository.getBanner();
    return result;
  }
}