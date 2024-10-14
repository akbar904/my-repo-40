
import 'package:my_app_1/app/app.bottomsheets.dart';
import 'package:my_app_1/app/app.dialogs.dart';
import 'package:my_app_1/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		// Mock data for S&P 500 metrics
		_sp500Metrics = [
			{'company': 'Company A', 'price': 150.23, 'change': '+1.5%'},
			{'company': 'Company B', 'price': 250.78, 'change': '-0.8%'},
			{'company': 'Company C', 'price': 320.43, 'change': '+0.3%'},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Steve Rocks!',
			description: 'Check out the S&P 500 metrics!',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Update',
			description: 'Here are the latest mock metrics for S&P 500.',
		);
	}
}
