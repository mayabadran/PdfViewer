
import 'package:dio/dio.dart';
import 'package:pdf/model/errormodel.dart';
import 'package:pdf/model/pdfmodel.dart';
import 'package:pdf/model/resultmodel.dart';

abstract class PdfService{
  Dio dio=Dio();
  String baseUrl='https://662cec9d0547cdcde9df7c23.mockapi.io/book';
late Response response;
  Future <List<PdfModel>> getAllBook();
  Future<ResultModel> getOneBook();
  createBook(PdfModel);
  DeleteBook(num id);
}
class serviceUI extends PdfService {
  @override
  DeleteBook(num id) {
    // TODO: implement DeleteBook
    throw UnimplementedError();
  }

  @override
  createBook(PdfModel) {
    // TODO: implement createBook
    throw UnimplementedError();
  }

  @override
  Future<List<PdfModel>> getAllBook()async {
  //  try {
    response=await dio.get(baseUrl);
// if(response.statusCode==200){
  List<PdfModel> pdf_model= List.generate(response.data.length, (index) => PdfModel.fromMap(response.data[index]));
  print(response);
return pdf_model;
// }else{    return [ErrorModel(message: "no internet"),];}

//   }
//   catch(e){    return [ErrorModel(message: "no internet"),];}
  
  }
  @override
  Future<ResultModel> getOneBook() {
    // TODO: implement getOneBook
    throw UnimplementedError();
  }
  
}