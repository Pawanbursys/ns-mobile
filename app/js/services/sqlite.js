(function () {
	'use strict';

	angular
		.module('App')
		.service('$sqliteService', $sqliteService);

	$sqliteService.$inject = ['$q', '$cordovaSQLite', '$http'];
	function $sqliteService($q, $cordovaSQLite, $http) {

		var self = this;
		var _db;

		self.db = function () {
			if (!_db) {
				if (window.sqlitePlugin !== undefined) {
					console.log("native sqlite");
					_db = window.sqlitePlugin.openDatabase({ name: "pre.db", location: 2, createFromLocation: 1 });
				} else {
					// For debugging in the browser
					console.log("web sqlite");
					_db = window.openDatabase("winsort.db", "1.0", "Database", 200000);
				}
			}
			return _db;
		};

		self.getFirstItem = function (query, parameters) {
			var deferred = $q.defer();
			self.executeSql(query, parameters).then(function (res) {

				if (res.rows.length > 0)
					return deferred.resolve(res.rows.item(0));
				else
					return deferred.reject("There aren't items matching");
			}, function (err) {
				return deferred.reject(err);
			});

			return deferred.promise;
		};

		self.getFirstOrDefaultItem = function (query, parameters) {
			var deferred = $q.defer();
			self.executeSql(query, parameters).then(function (res) {

				if (res.rows.length > 0)
					return deferred.resolve(res.rows.item(0));
				else
					return deferred.resolve(null);
			}, function (err) {
				return deferred.reject(err);
			});

			return deferred.promise;
		};

		self.getItems = function (query, parameters) {
			var deferred = $q.defer();
			self.executeSql(query, parameters).then(function (res) {
				var items = [];
				for (var i = 0; i < res.rows.length; i++) {
					items.push(res.rows.item(i));
				}
				return deferred.resolve(items);
			}, function (err) {
				return deferred.reject(err);
			});

			return deferred.promise;
		};

		// self.preloadDataBase = function (enableLog) {
		// 	var deferred = $q.defer();

		// 	//window.open("data:text/plain;charset=utf-8," + JSON.stringify({ data: window.queries.join('').replace(/\\n/g, '\n') }));
		// 	if (window.sqlitePlugin === undefined) {
		// 		if (enableLog) console.log('%c ***************** Starting the creation of the database in the browser ***************** ', 'background: #222; color: #bada55');
		// 		self.db().transaction(function (tx) {
		// 			for (var i = 0; i < window.queries.length; i++) {
		// 				var query = window.queries[i].replace(/\\n/g, '\n');

		// 				if (enableLog) console.log(window.queries[i]);
		// 				tx.executeSql(query);
		// 			}
		// 		}, function (error) {
		// 			deferred.reject(error);
		// 		}, function () {
		// 			if (enableLog) console.log('%c ***************** Completing the creation of the database in the browser ***************** ', 'background: #222; color: #bada55');
		// 			deferred.resolve("OK");
		// 		});
		// 	} else {
		// 		window.sqlitePlugin.selfTest(function () {
		// 			console.log('SELF test OK');
		// 		});
		// 		deferred.resolve("OK");
		// 	}

		// 	return deferred.promise;
		// };

		self.executeSql = function (query, parameters) {
			return $cordovaSQLite.execute(self.db(), query, parameters);
		};



		self.preloadDataBase = function (enableLog) {
			var deferred = $q.defer();
			console.log("called preloadDataBase", self.db());
			this.createTable().then(function () {
				self.insertData().then(function () {
					deferred.resolve("OK");
				});
			});

			return deferred.promise;
		};

		self.createTable = function (enableLog) {
			var deferred = $q.defer();
			//console.log("called createTable");
			$http.get('scripts/create.sql').success(function (data) {
				var statements = data.split(";");
				//console.log(statements.length);

					self.db().transaction(function (tx) {
							console.log("tx",tx);
							for (var i = 0; i < statements.length; i++) {
								var statement = statements[i].trim();
								if (statement !== '') {
										var query = statement.replace(/\n/g, " ")+";";
										console.log("query",query);
										tx.executeSql(query);
								}
							}
						
								
					}, function (error) {
						deferred.reject(error);
					}, function () {
						if (enableLog) console.log('%c ***************** Completing the creation of the database in the browser ***************** ', 'background: #222; color: #bada55');
						deferred.resolve("OK");
					});
	
				});

				return deferred.promise;
			};

			self.insertData = function (enableLog) {
				var deferred = $q.defer();
				console.log("called insertData");
				deferred.resolve("OK");

				return deferred.promise;
			};
		}
	})();