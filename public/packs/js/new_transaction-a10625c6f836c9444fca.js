/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/new_transaction.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/new_transaction.js":
/*!*************************************************!*\
  !*** ./app/javascript/packs/new_transaction.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

var amount_form = document.querySelector('#transaction_amount');
amount_form.value = "0";
var amount_display = document.querySelector('.amount_display');
amount_display.textContent = "$" + amount_form.value;
var buttons = document.querySelectorAll('.number_input');
buttons.forEach(function (button) {
  button.addEventListener('click', function () {
    if (amount_form.value == "0") {
      amount_form.value = button.textContent;
    } else {
      if (amount_form.value.includes(".")) {
        decimal_count = amount_form.value.split(".")[1].length;

        if (decimal_count < 2) {
          amount_form.value += button.textContent;
        }
      } else {
        amount_form.value += button.textContent;
      }
    }

    amount_display.textContent = "$" + amount_form.value;
  });
});
var backspace = document.querySelector('.backspace');
backspace.addEventListener('click', function () {
  if (amount_form.value.length == 1) {
    amount_form.value = "0";
  } else {
    amount_form.value = amount_form.value.slice(0, -1);
  }

  amount_display.textContent = "$" + amount_form.value;
});
var decimal_point = document.querySelector('.decimal_point');
decimal_point.addEventListener('click', function () {
  if (!amount_form.value.includes(".")) {
    amount_form.value += ".";
  }

  amount_display.textContent = "$" + amount_form.value;
});

/***/ })

/******/ });
//# sourceMappingURL=new_transaction-a10625c6f836c9444fca.js.map