
//$(document).ready(function(){
//	$("h1").click(function(){
//		$(this).hide();
//		});
	
//});

//$(document).ready(function(){
//    $("button").click(function(){
//        $("h1:first").addClass("high");
    //});
//});

//$(document).ready(function(){
//    $("#remove").click(function(){
//        $("h1:first").removeClass("high");
//    });
//});

$(function () {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $("#tags").autocomplete({
        source: availableTags
    });
});
