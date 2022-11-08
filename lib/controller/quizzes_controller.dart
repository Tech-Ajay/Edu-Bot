import 'package:get/get.dart';
// import 'package:institute/core/controllers/role_controller.dart';
// import 'package:institute/core/controllers/view_controllers/quiz_list_controller.dart';
// import 'package:institute/core/models/quiz_model.dart';

class QuizzesController extends GetxController {
//   QuizListController quizListController = Get.put(QuizListController());
//   RoleController roleController = Get.find<RoleController>();
   RxInt indexPage = 0.obs;
//   int _noOfApprovals = 0;

//   int get noOfApprovals => this._noOfApprovals;
//   set noOfApprovals(int value) {
//     this._noOfApprovals = value;
//     update();
//   }

//   @override
//   void onInit() async {
//     await refreshApprovals();
//     update();
//     super.onInit();
//   }

//   void onBackFromCreateQuiz(QuizModel model) {
//     quizListController.listQuizzesAfterCreate(model);
//   }

//   Future refreshApprovals() async {
//     if (roleController.selectedRole.value.roleType == 'Admin') {
//       noOfApprovals = await roleController.getPendingRolesNumberForAdmin(
//         instituteId: roleController.selectedRole.value.instituteId ?? '',
//       );
//     } else {
//       noOfApprovals = await roleController.getPendingRolesNumberForTeacher(
//         instituteId: roleController.selectedRole.value.instituteId ?? '',
//         memberClass: roleController.selectedRole.value.memberClass ?? '',
//       );
//     }
//     update();
//   }
}
