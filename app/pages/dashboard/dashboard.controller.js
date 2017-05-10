(function () {
	'use strict';

	angular
		.module('App')	
		.controller('DashboardController', DashboardController);
	
	DashboardController.$inject = ['$scope', '$ionicPopup', 'Modals', 'Model', '$sqliteService'];
	function DashboardController($scope, $ionicPopup, Modals, Model, $sqliteService) {
       
		$scope.input_value = "";
		$scope.show_details = true;
		$sqliteService.preloadDataBase();
		// $scope.valuee = "";
		// $scope.obj = "";

		// $scope.addToDb = function (value) {
		// };

		$scope.showFromDb = function () {
			console.log("function called");
			
			$sqliteService.executeSql ('show tables').then(function (res) {
				console.log("values are ",res);
				
				// res.forEach(i => {
				// $scope.obj +=i.Name;
				// 	console.log(i.Name);
				// });
			});
		};



		$scope.onScanBtnClick = function () {
			console.log("SCANNING");
		};
		$scope.onSearchBtnClick = function () {
			console.log("SEARCHING");
			if ($scope.show_details) {
				$scope.show_details = false;
			}
		};

		$scope.users = [];

		$scope.HelloWorld = function () {
			$ionicPopup.alert({
				title: 'Hello World',
				template: '<h1>This is the best template to start with Ionic Framework!</h1>',
				cssClass: 'animated bounceInDown'
			});

		};

		$scope.showUsers = function () {
			Model.Users.getAll().then(function (users) {
				$scope.users = angular.copy(users);
			});
			Modals.openModal($scope, 'templates/modals/users.html', 'animated rotateInDownLeft');
		};

		$scope.closeModal = function () {
			Modals.closeModal();
			$scope.users = [];
		};
		$scope.helloBuddy = function (hell) {
			console.log(hell);
		};


		//Center content
		//1. http://codepen.io/mhartington/pen/gcHeL
		//2. http://codepen.io/anon/pen/meQJvp
	}

})();