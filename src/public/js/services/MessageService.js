/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .factory('MessageService', [
        function () {
            'use strict';

            var listeners = {};
            var queue = [];

            var Listener = function (pEvent, pKey, pCallback) {
              this.event = pEvent;
              this.callback = pCallback;
              this.key = pKey;
            };

            return {
                listen: function (pEvent, pKey, pCallback) {
                  if (!listeners[pKey]) {
                    listeners[pKey] = {};
                  }

                  if (!listeners[pKey][pEvent]) {
                    listeners[pKey][pEvent] = new Listener(pEvent, pKey, pCallback);
                  }

                  for (var i = 0; i < queue.length; i++) {
                      var event = queue[i];
                      if (pEvent === event) {
                        pCallback(event.data);
                      }
                  }
                },
                send: function (pEvent, pData) {
                  for (var key in listeners) {
                    var listener = listeners[key];
                    if (listener[pEvent]) {
                      listener[pEvent].callback(pData);
                    }
                  }
                  queue.push({
                      event: pEvent,
                      data: pData
                  });
                }
            };
        }]);
