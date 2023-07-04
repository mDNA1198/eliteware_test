import 'package:eliteware_test/presentation/base/base_controller.dart';
import 'package:logging/logging.dart';

class ModuleSelectionController extends BaseController{
  final Logger _logger;

  ModuleSelectionController() : _logger = Logger('ModuleSelectionController');

  @override
  void onInit() {
    _logger.fine('ModuleSelectionController');
    super.onInit();
  }

}