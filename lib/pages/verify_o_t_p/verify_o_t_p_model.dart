import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verify_o_t_p_widget.dart' show VerifyOTPWidget;
import 'package:flutter/material.dart';

class VerifyOTPModel extends FlutterFlowModel<VerifyOTPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField6 widget.
  FocusNode? textField6FocusNode;
  TextEditingController? textField6TextController;
  String? Function(BuildContext, String?)? textField6TextControllerValidator;
  // Stores action output result for [Backend Call - API (send verify staging)] action in Button widget.
  ApiCallResponse? apiResult24z;
  // Stores action output result for [Backend Call - API (verify staging)] action in Button widget.
  ApiCallResponse? response;
  // Stores action output result for [Backend Call - API (sign up staging)] action in Button widget.
  ApiCallResponse? signupResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField6FocusNode?.dispose();
    textField6TextController?.dispose();
  }
}
