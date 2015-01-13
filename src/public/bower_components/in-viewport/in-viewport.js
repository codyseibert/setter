/**
* @license in-viewport v0.4.2 | github.com/vvo/in-viewport#license
*/

(function(win, doc){
  var instances = [];

  win['inViewport'] = inViewport;

  function inViewport(elt, params, cb) {
    var opts = {
      container: doc.body,
      offset: 0
    };

    if (params === undefined || typeof params === 'function') {
      cb = params;
      params = {};
    }

    var container = opts.container = params['container'] || opts.container;
    var offset = opts.offset = params['offset'] || opts.offset;

    for (var i = 0; i < instances.length; i++) {
      if (instances[i].container === container) {
        return instances[i].inViewport(elt, offset, cb);
      }
    }

    return instances[
      instances.push(createInViewport(container)) - 1
    ].inViewport(elt, offset, cb)
  }

  function addEvent( el, type, fn ) {
    if (el.attachEvent) {
      el.attachEvent( 'on' + type, fn );
    } else {
      el.addEventListener( type, fn, false );
    }
  }

  function debounce(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    }
  }

  // https://github.com/jquery/sizzle/blob/3136f48b90e3edc84cbaaa6f6f7734ef03775a07/sizzle.js#L708
  var contains = document.documentElement.compareDocumentPosition ?
    function( a, b ) {
      return !!(a.compareDocumentPosition( b ) & 16);
    } :
    document.documentElement.contains ?
    function( a, b ) {
      return a !== b && ( a.contains ? a.contains( b ) : false );
    } :
    function( a, b ) {
      while ( (b = b.parentNode) ) {
        if ( b === a ) {
          return true;
        }
      }
      return false;
    };

  function createInViewport(container) {
    var watches = [];
    var watching = [];

    var scrollContainer = container === doc.body ? win : container;
    var debouncedCheck = debounce(checkElements, 15);

    addEvent(scrollContainer, 'scroll', debouncedCheck);


    if (scrollContainer === win) {
      addEvent(win, 'resize', debouncedCheck);
    }

    if (typeof window['MutationObserver'] === 'function') {
      observeDOM(watching, container, debouncedCheck);
    }

    function inViewport(elt, offset, cb) {
      if (!contains(doc.documentElement, elt) ||
          !contains(doc.documentElement, container)) {
          if (cb) {
            return setTimeout(addWatch(elt, offset, cb), 0);
          } else {
            return false;
          }
      }

      var eltRect = elt.getBoundingClientRect();
      var containerRect = container.getBoundingClientRect();

      var pos = {
        left: eltRect.left,
        top: eltRect.top
      };

      var viewport = {
        width: offset,
        height: offset
      };

      if (container === doc.body) {
        viewport.width += doc.documentElement.clientWidth;
        viewport.height += doc.documentElement.clientHeight;

        // We update body rect computing because
        // when you have relative/absolute childs, you get bad compute
        // we need to create a new Object, because it's read only
        containerRect = {
          bottom: container.scrollHeight,
          top: 0,
          left: 0,
          right: container.scrollWidth
        };
      } else {
        pos.left -= containerRect.left;
        pos.top -= containerRect.top;
        viewport.width += container.clientWidth;
        viewport.height += container.clientHeight;
      }

      var visible =
      // 1. They must overlap
      !(
        eltRect.right < containerRect.left ||
        eltRect.left > containerRect.right ||
        eltRect.bottom < containerRect.top ||
        eltRect.top > containerRect.bottom
      ) && (
      // 2. They must be visible in the viewport
        pos.top <= viewport.height &&
        pos.left <= viewport.width
      );

      if (visible) {
        if (cb) {
          watching.splice(indexOf.call(watching, elt), 1);
          cb(elt);
        } else {
          return true;
        }
      } else {
        if (cb) {
          setTimeout(addWatch(elt, offset, cb), 0);
        } else {
          return false;
        }
      }
    }

    function addWatch(elt, offset, cb) {
      if (indexOf.call(watching, elt) === -1) {
        watching.push(elt);
      }

      return function() {
        watches.push(function() {
          inViewport(elt, offset, cb);
        });
      }
    }

    function checkElements() {
      var cb;
      while(cb = watches.shift()) {
        cb();
      }
    }

    return {
      container: container,
      inViewport: inViewport
    }
  }

  function indexOf(value) {
    for (var i = this.length; i-- && this[i] !== value;) {}
    return i;
  }

  function observeDOM(elements, container, cb) {
    var observer = new MutationObserver(watch);
    var filter = Array.prototype.filter;

    observer.observe(container, {
      childList: true,
      subtree: true
    });

    function watch(mutations) {
      // some new DOM nodes where previously watched
      // we should check their positions
      if (mutations.some(knownNodes) === true) {
        setTimeout(cb, 0);
      }
    }

    function isWatched(node) {
      return indexOf.call(elements, node) !== -1;
    }

    function knownNodes(mutation) {
      return filter.call(mutation.addedNodes, isWatched).length > 0
    }
  }

})(window, document);