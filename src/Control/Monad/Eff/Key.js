"use strict";

// module Control.Monad.Eff.Key

exports.navigator = function (o) {
  return function () {
    return o.navigator;
  };
};

exports.platform = function (o) {
  return function () {
    return o.platform;
  };
};

