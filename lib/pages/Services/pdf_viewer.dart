import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfviewerScreen extends StatefulWidget {
  final String source;
  const PdfviewerScreen(this.source) ;

  @override
  PdfViewerScreen createState() => PdfViewerScreen();
}

class PdfViewerScreen extends State<PdfviewerScreen> {
  bool _isLoading = true;
  PDFDocument document;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
        widget.source,
    cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ),
    );
    setState(() => _isLoading = false);
  }

  // changePDF(value) async {
  //   setState(() => _isLoading = true);
  //   if (value == 1) {
  //     document = await PDFDocument.fromAsset('images/Sample1.pdf');
  //   } else if (value == 2) {
  //     document = await PDFDocument.fromURL(
  //       "https://ibad.org.lb/sites/default/files/alsera-alnabaweyya-almo7ababa.pdf",
  //       /* cacheManager: CacheManager(
  //         Config(
  //           "customCacheKey",
  //           stalePeriod: const Duration(days: 2),
  //           maxNrOfCacheObjects: 10,
  //         ),
  //       ), */
  //     );
  //   } else {
  //     document = await PDFDocument.fromAsset('images/Sample1.pdf');
  //   }
  //   setState(() => _isLoading = false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                //uncomment below line to preload all pages
                 lazyLoad: false,
                // uncomment below line to scroll vertically
                 scrollDirection: Axis.vertical,

                //uncomment below code to replace bottom navigation with your own
                /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
              ),
      ),
    );
  }
}
