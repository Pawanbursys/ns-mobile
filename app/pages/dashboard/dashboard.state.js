angular.module('App')
.config(function($stateProvider, $urlRouterProvider) {
	$stateProvider.state('app.dashboard', {
            url: "/dashboard",
            cache: false,
            views: {
                viewContent: {
                    templateUrl: "templates/dashboard.html",
                    controller: 'DashboardController'
                }
            }
    });
});