import '/flutter_flow/flutter_flow_util.dart';
import 'verify_o_t_p_widget.dart' show VerifyOTPWidget;
import 'package:flutter/material.dart';

class VerifyOTPModel extends FlutterFlowModel<VerifyOTPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField6 widget.
  FocusNode? textField6FocusNode;
  TextEditingController? textField6TextController;
  String? Function(BuildContext, String?)? textField6TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField6FocusNode?.dispose();
    textField6TextController?.dispose();
  }
}
