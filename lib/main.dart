import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pdf/model/bookmark.dart';
import 'package:pdf/model/pdfmodel.dart';
import 'package:pdf/model/resultmodel.dart';
import 'package:pdf/service/pdf_service.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Syncfusion PDF Viewer Demo',
    home: HomePage(),
  ));
}

/// Represents Homepage for Navigation
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

TextEditingController textFieldController = TextEditingController();
PdfViewerController pdfViewerController = PdfViewerController();
PageController pageController = PageController();

class _HomePage extends State<HomePage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// https://662cec9d0547cdcde9df7c23.mockapi.io/book
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
              child: Icon(Icons.arrow_circle_up_sharp), onPressed: () {
                                pdfViewerController.jumpToPage(int.parse('1'));

              }),
              SizedBox(height: 10,width: 10,),
                FloatingActionButton.small(
              child: Icon(Icons.arrow_circle_down_sharp), onPressed: () {
                                pdfViewerController.jumpToPage(pdfViewerController.pageCount);

              }), 
              SizedBox(height: 10,width: 10,),
          FloatingActionButton(onPressed: () {
            saveBookMark({
              'page': pdfViewerController.pageNumber,
              'key': 'asset/alhala.pdf'
            });
          }),
                       

        ],
      ),
      appBar: AppBar(
        title: TextField(
          controller: textFieldController,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              // _pdfViewerKey.currentState?.openBookmarkView();
              pdfViewerController
                  .jumpToPage(int.parse(textFieldController.text));
            },
          ),
        
        ],
      ),
      body: FutureBuilder<List<ResultModel>>(
        future:serviceUI().getAllBook() , 
        builder:(context,snapshot){
          if(snapshot.hasData){
           
            List<PdfModel> temp = snapshot.data as List<PdfModel>;
                    return PageView.builder(itemBuilder: (context, index) {
                      return SfPdfViewer.asset(temp[index].key,
                      controller: pdfViewerController,);
                      
                    },); 
          }else {
            return CircularProgressIndicator();
          }


        }
         ),
    );
  }
}

saveBookMark(Map map) async {
  Dio dio = Dio();
  await dio.post('https://662cec9d0547cdcde9df7c23.mockapi.io/book', data: map);
}


//SfPdfViewer.asset(
    //    'asset/alhala.pdf',
      //  key: _pdfViewerKey,
        //controller: pdfViewerController,
      //),