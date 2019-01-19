$( document ).ready(function() {
$('input.typeahead').typeahead({
source: function (query, process) {
return $.get('search_data.php', { query: query }, function (data) {
data = $.parseJSON(data);
return process(data);
});
},
showHintOnFocus:'all'
});
});