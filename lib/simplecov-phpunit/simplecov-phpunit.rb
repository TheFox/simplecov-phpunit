
require 'simplecov'

module SimpleCov
	module Formatter
		
		class PHPUnit < SimpleCov::Formatter::SimpleFormatter
			
			def initialize()
				super()
				
				@base_dir_path = Dir.pwd
				@coverage_dir_path = "#{@base_dir_path}/coverage"
				@index_html_file = File.open("#{@coverage_dir_path}/index.html", 'wb')
				
				@version_html = %{<a href="https://github.com/TheFox/simplecov-phpunit">SimpleCov PHPUnit Formatter #{PHPUnitFormatter::VERSION}</a>}
				@ruby_version_html = %{<a href="https://www.ruby-lang.org/en/">Ruby #{RUBY_VERSION}</a>}
				
				simplecov_version = Gem.latest_spec_for('simplecov').version.to_s
				@simplecov_version_html = %{<a href="https://github.com/colszowka/simplecov">SimpleCov #{simplecov_version}</a>}
			end
			
			def format(result)
				puts
				puts "write coverage for '#{@base_dir_path}'"
				
				total_status = status_by_percent(result.files.covered_percent)
				total_percent_f = '%.2f' % result.files.covered_percent
				
				@index_html_file.write(%{<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<title>Code Coverage for #{@base_dir_path}</title>
		
		<link href="_assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="_assets/css/style.css" rel="stylesheet">
		
		<!--[if lt IE 9]>
		<script src="_assets/js/html5shiv.min.js"></script>
		<script src="_assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>&nbsp;</td>
					<td colspan="3"><div align="center"><strong>Code Coverage</strong></div></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="3"><div align="center"><strong>Lines</strong></div></td>
				</tr>
			</thead>
			<tr>
				<td class="#{total_status}">Total</td>
				<td class="#{total_status} big">
					<div class="progress">
						<div class="progress-bar progress-bar-#{total_status}" role="progressbar" aria-valuenow="#{total_percent_f}" aria-valuemin="0" aria-valuemax="100" style="width: #{total_percent_f}%">
							<span class="sr-only">#{total_percent_f}% covered (#{total_status})</span>
						</div>
					</div>
				</td>
				<td class="#{total_status} small"><div align="right">#{total_percent_f}%</div></td>
				<td class="#{total_status} small"><div align="right">#{result.files.covered_lines}&nbsp;/&nbsp;#{result.files.lines_of_code}</div></td>
			</tr>
})
				
				result.files.each do |file|
					relative_file_path = file.filename[@base_dir_path.size.next..-1]
					# file_name = File.basename(file.filename)
					html_file_path = relative_file_path
						.split('/')
						.join('_') + '.html'
					
					puts "write coverage '#{relative_file_path}'"
					
					file_status = status_by_percent(file.covered_percent)
					file_percent_f = '%.2f' % file.covered_percent
					
					@index_html_file.write(%{

<tr>
	<td class="#{file_status}"><span class="glyphicon glyphicon-file"></span> <a href="#{html_file_path}">#{relative_file_path}</a></td>
	<td class="#{file_status} big">
		<div class="progress">
			<div class="progress-bar progress-bar-#{file_status}" role="progressbar" aria-valuenow="100.00" aria-valuemin="0" aria-valuemax="100" style="width: #{file_percent_f}%">
				<span class="sr-only">#{file_percent_f}% covered (#{file_status})</span>
			</div>
		</div>
	</td>
	<td class="#{file_status} small"><div align="right">#{file_percent_f}%</div></td>
	<td class="#{file_status} small"><div align="right">#{file.covered_lines.count}&nbsp;/&nbsp;#{file.lines_of_code}</div></td>
</tr>

})
					
					@html_file = File.open("#{@coverage_dir_path}/#{html_file_path}", 'wb')
					@html_file.write(%{<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<title>Code Coverage for #{file.filename}</title>
		
		<link href="_assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="_assets/css/style.css" rel="stylesheet">
		
		<!--[if lt IE 9]>
		<script src="_assets/js/html5shiv.min.js"></script>
		<script src="_assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ol class="breadcrumb">
							<li><a href="index.html">#{@base_dir_path}</a></li>
							<li class="active">#{relative_file_path}</li>
						</ol>
					</div>
				</div>
			</div>
		</header>
		<div class="container">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td>&nbsp;</td>
						<td colspan="3"><div align="center"><strong>Code Coverage</strong></div></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="3"><div align="center"><strong>Lines</strong></div></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="#{file_status}">Total</td>
						<td class="#{file_status} big">
							<div class="progress">
								<div class="progress-bar progress-bar-#{file_status}" role="progressbar" aria-valuenow="#{file_percent_f}" aria-valuemin="0" aria-valuemax="100" style="width: #{file_percent_f}%">
									<span class="sr-only">#{file_percent_f}% covered (#{file_status})</span>
								</div>
							</div>
						</td>
						<td class="#{file_status} small"><div align="right">#{file_percent_f}%</div></td>
						<td class="#{file_status} small"><div align="right">#{file.covered_lines.count}&nbsp;/&nbsp;#{file.lines_of_code}</div></td>
					</tr>
				</tbody>
			</table>
			<table id="code" class="table table-borderless table-condensed">
				<tbody>
})
					
					file.lines.each do |line|
						# puts "  line #{line.line_number} #{line.coverage} #{line.status} #{line.src}"
						
						if line.covered?
							@html_file.write(%{<tr class="covered-by-large-tests"><td><div align="right"><a name="#{line.line_number}"></a><a href="##{line.line_number}">#{line.line_number}</a></div></td><td class="codeLine"><span class="default">#{line.src}</span></td></tr>})
						elsif line.missed?
							@html_file.write(%{<tr class="danger"><td><div align="right"><a name="#{line.line_number}"></a><a href="##{line.line_number}">#{line.line_number}</a></div></td><td class="codeLine"><span class="default">#{line.src}</span></td></tr>})
						elsif line.skipped?
							@html_file.write(%{<tr class="warning"><td><div align="right"><a name="#{line.line_number}"></a><a href="##{line.line_number}">#{line.line_number}</a></div></td><td class="codeLine"><span class="default">#{line.src}</span></td></tr>})
						else
							@html_file.write(%{<tr><td><div align="right"><a name="#{line.line_number}"></a><a href="##{line.line_number}">#{line.line_number}</a></div></td><td class="codeLine"><span class="default">#{line.src}</span></td></tr>})
						end
						
					end
					
					@html_file.write(%{
				</tbody>
			</table>
			<footer>
				<hr/>
				<h4>Legend</h4>
				<p>
				<span class="success"><strong>Executed</strong></span>
				<span class="danger"><strong>Not Executed</strong></span>
				<span class="warning"><strong>Skipped Code</strong></span>
				</p>
				<p>
				<small>Generated by #{@version_html} using #{@ruby_version_html} and #{@simplecov_version_html} at #{result.created_at.strftime('%F %T %z')}.</small>
				</p>
			</footer>
		</div>

		<script src="_assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="_assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="_assets/js/holder.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				var $window   = $(window)
				, $top_link = $('#toplink')
				, $body     = $('body, html')
				, offset    = $('#code').offset().top;

				$top_link.hide().click(function(event){
					event.preventDefault();
					$body.animate({scrollTop:0}, 800);
				});
				
				$window.scroll(function(){
					if($window.scrollTop() > offset){
						$top_link.fadeIn();
					}
					else{
						$top_link.fadeOut();
					}
				}).scroll();
				
				$('.popin').popover({trigger: 'hover'});
			});
		</script>
	</body>
</html>
})
					
					@html_file.close
				end
				
				@index_html_file.write(%{
		</table>
		<footer>
			<hr/>
			<h4>Legend</h4>
			<p>
				<span class="danger"><strong>Low</strong>: 0% to 49%</span>
				<span class="warning"><strong>Medium</strong>: 50% to 89%</span>
				<span class="success"><strong>High</strong>: 90% to 100%</span>
			</p>
			<p>
				<small>Generated by #{@version_html} using #{@ruby_version_html} and #{@simplecov_version_html} at #{result.created_at.strftime('%F %T %z')}.</small>
			</p>
		</footer>
	</div>
	<script src="_assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="_assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="_assets/js/holder.min.js" type="text/javascript"></script>
</html>
})
				
				@index_html_file.close
				
				puts 'done'
				puts
			end
			
			private
			
			def status_by_percent(percent)
				if percent >= 50.0 && percent < 90.0
					'warning'
				elsif percent >= 90.0
					'success'
				else
					'danger'
				end
			end
			
		end
		
	end
end
