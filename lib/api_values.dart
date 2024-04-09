



import 'package:dio/dio.dart';

class APIvalue {
  static List<String> url = [
    'https://mitra-fintech-beta.vercel.app/',
    'https://api-prod-kvm.mitrafintech.com/',
  ];

  static int isbeta = 0;

  //==========================================Login, SignUp And Update Account==================================================

  // String sendOTPURL = "${url[isbeta]}api/v1/auth/send-otp";


//=================================================================================================================

  Dio dio = Dio();

//---------------------------------------------------------------------------------------------------------------

  // Future<dynamic> sendOTP(String mobile, String sig) async {
  //   try {
  //     dynamic data = {
  //       'mobile': mobile,
  //       'signature': sig,
  //     };

  //     Response response = await dio.get(sendOTPURL, queryParameters: data);
  //     var data1 = response.data['status'].toString();

  //     return data1;
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }





  //---------------------------------------------------------------------------------------//
}

APIvalue apiValue = APIvalue();
