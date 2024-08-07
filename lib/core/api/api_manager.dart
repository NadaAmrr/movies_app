

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/constants/constants.dart';
import 'package:movies/core/api/endpoints.dart';
import 'package:movies/core/utils/constants.dart';
import 'package:movies/models/release_res_model.dart';

class ApiManager {
  ///popular
//   static Future<PopularResponse> fetchPopular() async {
//     try {
//       Uri url = Uri.https(Constants.baseURl, Endpoints.popular, {
//         "api_key": MyConstants.apiKey,
//       });
//       http.Response response = await http.get(url);
//       Map<String, dynamic> json = jsonDecode(response.body);
//       return PopularResponse.fromJson(json);
//     } catch (e) {
//       print("Error from popular api ==========");
//       throw e;
//     }
//   }
//   ///release
  static Future<ReleaseResModel> fetchNewReleases() async {
    try {
      var url = Uri.https(Constants.baseURl, Endpoints.upcoming, {
        'api_key': MyConstants.apiKey,
      });
      print(url);
      http.Response response = await http.get(
        url,
      );
      Map<String, dynamic> json = jsonDecode(response.body);
      return ReleaseResModel.fromJson(json);
    } catch (e) {
      print("Error from releases api ==========");
      throw e;
    }
  }
//   ///top rated
//   static Future<TopRatedResponse> fetchRecommend() async {
//     try {
//       Uri url = Uri.https(Constants.baseURl, Endpoints.topRated, {
//         "api_key": MyConstants.apiKey,
//       });
//       http.Response response = await http.get(url);
//       Map<String, dynamic> json = jsonDecode(response.body);
//       return TopRatedResponse.fromJson(json);
//     } catch (e) {
//       print("Error from recommended api ==========");
//       throw e;
//     }
//   }
//  ///Search
//   static Future<SearchResponse> search({required String query}) async {
//     try {
//       Uri uri = Uri.https(Constants.baseURl, Endpoints.search, {
//         "api_key": MyConstants.apiKey,
//         'query': query,
//       });
//       var response = await http.get(uri);
//       SearchResponse movies = SearchResponse.fromJson(jsonDecode(response.body));
//       return movies;
//     } catch (e) {
//       print("Error from Search api ==========");
//       throw e;
//     }
//   }
//   ///Details
//   static Future<DetailsModel> details(id) async {
//     try {
//       Uri url = Uri.https(Constants.baseURl, "${Endpoints.details}/$id", {
//         "api_key": MyConstants.apiKey,
//       });
//       http.Response response = await http.get(url);
//       Map<String, dynamic> json = jsonDecode(response.body);
//       return DetailsModel.fromJson(json);
//     } catch (e) {
//       print("Error from details api ==========");
//       throw e;
//     }
//   }
// // more like this
//  static Future<SamilierResponse>getSamilier(id)async{
//     try{
//       Uri url=Uri.https(Constants.baseURl,"${Endpoints.moreLikeThis}/$id/similar",{
//         "api_key":MyConstants.apiKey
//       });
//
//       http.Response response=await http.get(url);
//       Map<String,dynamic> json=jsonDecode(response.body);
//  return SamilierResponse.fromJson(json);
//     }catch(e){
// print("Something Went error");
// throw e;
//     }
// }
//
// static Future<GeneResponse>getgenre()async{
//     try{
//       Uri url=Uri.https(Constants.baseURl,"${Endpoints.movieList}",{
//         "api_key":MyConstants.apiKey
//       });
//       http.Response response=await http.get(url);
//       Map<String,dynamic> json=jsonDecode(response.body);
//       return GeneResponse.fromJson(json);
//
//     }
//         catch(e){
//           print("Something Went error");
//           throw e;
//         }
// }
//  static Future<DetailsDiscover>getgenreDiscover()async{
//     try{
//       Uri url=Uri.https(Constants.baseURl,"${Endpoints.discover}",{
//         "api_key":MyConstants.apiKey
//       });
//       http.Response response=await http.get(url);
//       Map<String,dynamic> json=jsonDecode(response.body) ;
//       return DetailsDiscover.fromJson(json);
//     }
//         catch(e){
//       print("SomeThing went error");
//       throw e;
//         }
// }
  
}
