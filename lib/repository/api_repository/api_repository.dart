import 'package:smit_jagani_flutter_task/config/api_constant.dart';
import 'package:smit_jagani_flutter_task/utils/services/api_service.dart';

class ApiRepository {
  final ApiClient _apiClient = ApiClient();

  Future fetchData({int? offset}) async {
    /// Call the API to fetch data
    return await _apiClient.getData(
      url: "${ApiConstant.fetchData}?offset=$offset",
    );
  }

  Future fetchImage({String? url}) async {
    /// Call the API to fetch Image
    return await _apiClient.getData(
      url: url,
      isBaseUrlUse: false,
    );
  }
}
