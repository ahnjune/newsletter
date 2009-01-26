// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.observe(window, "load", function() {
  var field = $$('form input[type="text"]').first();
  if (field) {
    field.focus();
  }
})