// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.observe(window, "load", function() {
  
  // focus the form fields
  var field = $$('form input[type="text"]').first();
  if (field) {
    field.focus();
  }

  // color the tables
  $$('table').each(function(table) {
    var odd = true;
    table.select("tr").each(function(tr) {
      var ths = tr.select("th");
      if (ths.length == 0) {
        tr.addClassName(odd ? "odd" : "even");
        odd = !odd;
      }
    })
  })
  
  // rollup the flash
  var flash = $("flash");
  if (flash) {
    new Effect.BlindUp("flash", {delay: 3});
  }
})

