
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
			{'name': 'AAPL', 'price': 150.55, 'change': 1.5},
			{'name': 'GOOGL', 'price': 2800.12, 'change': -15.3},
			{'name': 'AMZN', 'price': 3402.22, 'change': 10.1},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Displaying mock data for S&P 500',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Notice',
			description: 'This is a notice for S&P 500 metrics',
		);
	}
}
