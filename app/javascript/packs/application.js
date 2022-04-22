// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application size_stockic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("@rails/ujs").start()
require("turbolinks").start()  //私はいつもコメントアウトします
require("@rails/activestorage").start()
require("channels")
require('jquery') //これを追記
import "cocoon"   //cocoonを動かすための記述


