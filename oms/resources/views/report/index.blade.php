<h1>My First Report</h1>


@foreach ($reports as $report)
	<h2>{{ $report->report_name }}
	<p>{{ $report->status }}</p>
	<hr>
@endforeach