(function () {
	'use strict';

	angular
		.module('App')
		.controller('ScanMailController', ScanMailController);

	ScanMailController.$inject = ['$scope', '$ionicPopup', 'Modals', 'Model', '$sqliteService'];
	function ScanMailController($scope, $ionicPopup, Modals, Model, $sqliteService) {
       

	}
})();