// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//datepicker
$(function() {
    $("#interview_date_of_interview").datepicker();
});
$(function() {
    $("#interview_date_of_joining").datepicker();
});
$(function() {
    $("#interview_cv_recieved_on").datepicker();
});
//jquery_autocomplete
$(function() {
		var availableTags = [
			"Java",
			"AIX Admin",
                        "SQL Server",
                        "PL SQL",
                        "Oracle",
                        "Lotus Notes",
                        "Cognos",
			"Ruby on Rails"
		];
		$( "#interview_skills" ).autocomplete({
			source: availableTags
		});
	});
//dialog
$(document).ready(function() {
	$('.details').each(function() {
		var $dialog = $('<div></div>');
		var $link = $(this).one('click', function() {
			$dialog
				.load($link.attr('href') + ' #test')
				.dialog({
					title: $link.attr('Candidate Details'),
					width: 500,
                                        minHeight: 600,
					modal: true,
                                        show: 'slide'

				});
                                 
			$link.click(function() {
				$dialog.dialog('open');
				return false;
			});
			return false;
		});
	});

});

