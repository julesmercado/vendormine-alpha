var app = angular.module('vendormine',["checklist-model"]);
app
	.config(['$httpProvider',
			'$locationProvider',
			 function($httpProvider, $locationProvider) {
    		 $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
}])


/*app
	.controller('addSupplyCtrl',[
		'$scope',
		'$http',
		function addSupplyCtrl ( $scope, $http ) {
			$scope.pricings = [
				"Per Hour",
				"Per Pax",
				"Fixed Rate" 
			];

			$scope.supply = {};

			$scope.addSupply = function addSupply() {
				console.log($scope.supply);
			}

			$scope.getPricingModel = function getPricingModel() {
				$http.get('/suppliers/get_pricing_model')
				.success( function onSuccess(response) {
					$scope.pricings = response;
				});
			}

			//$scope.getPricingModel();
		}
	]);

app
	.directive ( 'supplyPanel',[
		function () {
			return {
				"restrict": "A",
				"scope": true,
				"templateUrl": "/assets/supply-panel.html",
				"controller": "addSupplyCtrl", 
				"link": function onLink ( scope, element, attributeSet) {

				}

			}
		}

	]);*/

app
	.controller ( 'appController',[
		'$scope',
		'$http',
		function appController ( $scope, $http ) {
			$scope.sessionUser;

			$scope.getSessionUser = function getSessionUser() {
				$http.get('/suppliers/get_session_user')
				.success(function onSuccess ( response ) {
					$scope.sessionUser = response;
					$scope.$broadcast( 'sessionUser', $scope.sessionUser );
				});
			}

			$scope.getSessionUser();
		}
	]);


app
	.controller ( 'createBundleCtrl',[
		'$scope',
		'$http',
		function craeteBundleCtrl ( $scope, $http ) {
			$scope.sessionUser;
			$scope.user;
			$scope.bundleData = {};
			$scope.bundle = {
				supplies : []
			}
			$scope.pricings = [
				"Per Hour",
				"Per Pax",
				"Fixed Rate" 
			];

			$scope.$on ( 'sessionUser', function ( sessionUser, response ) {
				$scope.sessionUser = response;
				$scope.user = response;
				console.log($scope.sessionUser);
			});

			$scope.getSupplies = function getSupplies(sessionUser) {
				$http.get('/suppliers/' + sessionUser.id + '/supplies/new')
				.success(function onSuccess( response ) {
					$scope.supplies = response;
				});
			}

			$scope.createBundle = function createBundle(sessionUser) {
				console.log($scope.bundle);
				var bundle = {
					"bundle_name" : $scope.bundle.bundle_name,
					"pricing"	: $scope.bundle.pricing,
					"bundle_price"	: $scope.bundle.price,
					"bundle_desc"	: $scope.bundle.desc,
					"supplies"		: $scope.bundel.supplies
				}
				$http.get('/suppliers/' + sessionUser.id + '/bundle_supplies/' + bundle)
				.success(function onSuccess( response ) {
					
				});
			}

			console.log($scope.sessionUser);
		}
	]);

app
	.directive ( 'bundlePanel', [
		function () {
			return {
				"restrict" : "A",
				"scope"	: true,
				"templateUrl" : "/assets/bundle-panel.html",
				"controller"  : "createBundleCtrl",
				"link" : function onLink( scope, element, attributeSet ) {
					
				}
			}
		}
	]); 
