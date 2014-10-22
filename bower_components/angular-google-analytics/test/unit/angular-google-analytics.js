/* global module, angular, console, describe, expect, it, before, beforeEach, inject, spyOn, AnalyticsProvider */

'use strict';

describe('angular-google-analytics', function(){

    beforeEach(module('angular-google-analytics'));
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.setAccount('UA-XXXXXX-xx');
    }));

   describe('automatic trackPages with ga.js', function() {

      it('should inject the GA script', function() {
        inject(function(Analytics) {
          expect(document.querySelectorAll("script[src='http://www.google-analytics.com/ga.js']").length).toBe(1);
        });
      });

      it('should generate pageTracks', function() {
        inject(function(Analytics) {
          expect(Analytics._logs.length).toBe(0);
          Analytics.trackPage('test');
          expect(Analytics._logs.length).toBe(1);
          Analytics.trackEvent('test');
          expect(Analytics._logs.length).toBe(2);
        });
      });

      it('should generate an trackpage to routeChangeSuccess', function() {
        inject(function(Analytics, $rootScope) {
          $rootScope.$broadcast('$routeChangeSuccess');
          expect(Analytics._logs.length).toBe(1);
        });
      });
  });

  describe('supports dc.js', function() {
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.useDisplayFeatures(true);
    }));

    it('should inject the DC script', function() {
      inject(function(Analytics) {
        expect(document.querySelectorAll("script[src='http://stats.g.doubleclick.net/dc.js']").length).toBe(1);
      });
    });
  });

  describe('e-commerce transactions', function() {

      it('should add transcation', function() {
        inject(function(Analytics) {
          expect(Analytics._logs.length).toBe(0);
          Analytics.addTrans('1', '', '2.42', '0.42', '0', 'Amsterdam', '', 'Netherlands');
          expect(Analytics._logs.length).toBe(1);
        });
      });

      it('should add an item to transaction', function() {
        inject(function(Analytics) {
          expect(Analytics._logs.length).toBe(0);
          Analytics.addItem('1', 'sku-1', 'Test product 1', 'Testing', '1', '1');
          expect(Analytics._logs.length).toBe(1);
          Analytics.addItem('1', 'sku-2', 'Test product 2', 'Testing', '1', '1');
          expect(Analytics._logs.length).toBe(2);
        });
      });

      it('should track the transaction', function() {
        inject(function(Analytics) {
          expect(Analytics._logs.length).toBe(0);
          Analytics.trackTrans();
          expect(Analytics._logs.length).toBe(1);
        });
      });
  });

  describe('NOT automatic trackPages', function() {
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.trackPages(false);
    }));

    it('should NOT generate an trackpage to routeChangeSuccess', function() {
      inject(function(Analytics, $rootScope) {
        $rootScope.$broadcast('$routeChangeSuccess');
        expect(Analytics._logs.length).toBe(0);
      });
    });
  });

  describe('Supports ignoreFirstPageLoad', function() {
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.ignoreFirstPageLoad(true);
    }));

    it('Supports ignoreFirstPageLoad config', function() {
      inject(function(Analytics, $rootScope) {

        expect(Analytics.ignoreFirstPageLoad).toBe(true);
      });
    });
  });

  describe('supports analytics.js', function() {
    var cookieConfig = {
      cookieDomain: 'foo.example.com',
      cookieName: 'myNewName',
      cookieExpires: 20000
    };

    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.useAnalytics(true);
      AnalyticsProvider.setCookieConfig(cookieConfig);
      AnalyticsProvider.useDisplayFeatures(true);
      AnalyticsProvider.useECommerce(true);
      AnalyticsProvider.useEnhancedLinkAttribution(true);
      AnalyticsProvider.setExperimentId('12345');
    }));

    it('should inject the Analytics script', function() {
      inject(function(Analytics) {
        expect(document.querySelectorAll("script[src='//www.google-analytics.com/analytics.js']").length).toBe(1);
      });
    });

    it('should support displayfeatures config', function() {
      inject(function(Analytics) {
        expect(Analytics.displayFeatures).toBe(true);
      });
    });

    it('should support ecommerce config', function () {
      inject(function(Analytics) {
        expect(Analytics.ecommerce).toBe(true);
      });
    });

    it('should support enhancedLinkAttribution config', function () {
      inject(function(Analytics) {
        expect(Analytics.enhancedLinkAttribution).toBe(true);
      });
    });

    it('should support experimentId config', function () {
      inject(function(Analytics) {
        expect(Analytics.experimentId).toBe('12345');
      });
    });

    it('should allow transaction clearing', function () {
      inject(function (Analytics) {
        expect(Analytics._logs.length).toBe(0);
        Analytics.clearTrans();
        expect(Analytics._logs.length).toBe(1);
      });
    });

    it('should allow sending custom events', function () {
      inject(function (Analytics) {
        var social = {
          hitType: 'social',
          socialNetwork: 'facebook',
          socialAction: 'like',
          socialTarget: 'http://mycoolpage.com',
          page: '/my-new-page'
        };

        expect(Analytics._logs.length).toBe(0);
        Analytics.send(social);
        expect(Analytics._logs.length).toBe(1);
        expect(Analytics._logs[0]).toEqual({
          '0': 'send',
          '1': social
        });
      });
    });

    it('should allow setting custom dimensions, metrics or experiment', function(){
      inject(function (Analytics) {
        var data = {
          name: "dimension1",
          value: "value1"
        };
        expect(Analytics._logs.length).toBe(0);
        Analytics.set(data.name, data.value);
        expect(Analytics._logs.length).toBe(1);
        expect(Analytics._logs[0]).toEqual({
          '0': 'set',
          '1': data.name,
          '2': data.value
        });
      });
    });
  });

  describe('e-commerce transactions with analytics.js', function() {
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.useAnalytics(true);
      AnalyticsProvider.useECommerce(true);
    }));

    it('should add transcation', function() {
      inject(function(Analytics) {
        expect(Analytics._logs.length).toBe(0);
        Analytics.addTrans('1', '', '2.42', '0.42', '0', 'Amsterdam', '', 'Netherlands');
        expect(Analytics._logs.length).toBe(1);
        expect(Analytics._logs[0]['0']).toBe('ecommerce:addTransaction');
      });
    });

    it('should add an item to transaction', function() {
      inject(function(Analytics) {
        expect(Analytics._logs.length).toBe(0);
        Analytics.addItem('1', 'sku-1', 'Test product 1', 'Testing', '1', '1');
        expect(Analytics._logs.length).toBe(1);
        expect(Analytics._logs[0]['0']).toBe('ecommerce:addItem');
      });
    });

    it('should track the transaction', function() {
      inject(function(Analytics) {
        expect(Analytics._logs.length).toBe(0);
        Analytics.trackTrans();
        expect(Analytics._logs.length).toBe(1);
        expect(Analytics._logs[0]['0']).toBe('ecommerce:send');
      });
    });
  });

  describe('supports arbitrary page events', function() {
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.setPageEvent('$stateChangeSuccess');
    }));

    it('should inject the Analytics script', function() {
      inject(function(Analytics, $rootScope) {
        $rootScope.$broadcast('$stateChangeSuccess');
        expect(Analytics._logs.length).toBe(1);
      });
    });

    it('should inject the Analytics script', function() {
      inject(function(Analytics, $rootScope) {
        $rootScope.$broadcast('$stateChangeSuccess');
        expect(Analytics._logs.length).toBe(1);
      });
    });

  });

  describe('supports RegExp path scrubbing', function() {
    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.setRemoveRegExp(new RegExp(/\/\d+?$/));
    }));

    it('should scrub urls', function() {
      inject(function(Analytics, $rootScope, $location) {
        $location.path('/some-crazy/page/with/numbers/123456');
        expect(Analytics.getUrl()).toBe('/some-crazy/page/with/numbers');
      });

    });

  });

  describe('supports multiple tracking objects', function() {
    var trackers = [
      { tracker: 'UA-12345-12', name: "tracker1" },
      { tracker: 'UA-12345-34', name: "tracker2" }
    ];

    beforeEach(module(function(AnalyticsProvider) {
      AnalyticsProvider.setAccount(trackers);
      AnalyticsProvider.useAnalytics(true);
    }));

    it('should call ga create event for each tracker', function () {
      inject(function($window) {
        spyOn($window, 'ga');
        inject(function(Analytics) {
            expect($window.ga).toHaveBeenCalledWith('create', trackers[0].tracker, 'auto', { name: trackers[0].name });
            expect($window.ga).toHaveBeenCalledWith('create', trackers[1].tracker, 'auto', { name: trackers[1].name });
        });
      });
    });

    describe('#trackPage', function () {
      it('should call ga send pageview event for each tracker', function () {
        inject(function($window) {
          spyOn($window, 'ga');
          inject(function(Analytics) {
              Analytics.trackPage('/mypage', 'My Page');
              expect($window.ga).toHaveBeenCalledWith(trackers[0].name + '.send', 'pageview', { page: '/mypage', title: 'My Page' });
              expect($window.ga).toHaveBeenCalledWith(trackers[1].name + '.send', 'pageview', { page: '/mypage', title: 'My Page' });
          });
        });
      });
    });
  });
});

