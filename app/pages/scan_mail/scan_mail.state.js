angular.module('App')
.config(function($stateProvider, $urlRouterProvider) {
	$stateProvider.state('app.scan_mail', {
            url: "/scan_mail",
            cache: false,
            views: {
                viewContent: {
                    templateUrl: "templates/scan_mail.html",
                    controller: 'ScanMailController'
                }
            }
    });
});