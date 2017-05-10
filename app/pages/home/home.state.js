angular.module('App')
.config(function($stateProvider, $urlRouterProvider) {
	$stateProvider.state('app.home', {
            url: "/home",
            cache: false,
            views: {
                viewContent: {
                    templateUrl: "templates/home.html",
                    controller: 'HomeController'
                }
            }
    });
});