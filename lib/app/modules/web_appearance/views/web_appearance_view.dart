import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siajte_app/app/widgets/appbar_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/web_appearance_controller.dart';

class WebAppearanceView extends GetView<WebAppearanceController> {
  const WebAppearanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AppbarWidget(),
        ),
        body: FutureBuilder(
          future: controller.saveAndLaunchFile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SfPdfViewer.asset(
              snapshot.data.toString(),
            );
          },
        )

        //     WebViewWidget(
        //   controller: WebViewController()
        //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
        //     ..setBackgroundColor(const Color(0x00000000))
        //     ..setNavigationDelegate(
        //       NavigationDelegate(
        //         onProgress: (int progress) {
        //           // Update loading bar.
        //         },
        //         onPageStarted: (String url) {},
        //         onPageFinished: (String url) {},
        //         onWebResourceError: (WebResourceError error) {},
        //         onNavigationRequest: (NavigationRequest request) {
        //           if (request.url.startsWith('https://www.youtube.com/')) {
        //             return NavigationDecision.prevent;
        //           }
        //           return NavigationDecision.navigate;
        //         },
        //       ),
        //     )
        //     ..loadRequest(Uri.parse(Get.arguments ?? 'flutter.dev')),
        // ),
        );
  }
}
