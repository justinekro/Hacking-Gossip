$(document).on('turbolinks:load', function(){
  var gossips = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '../gossips/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });

  gossips.initialize();

  $('.typeahead').typeahead({
    source: gossips
  });
})