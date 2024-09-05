class FilterDate {
  static const FilterDateList = [
    {'value': '7_days', 'name': '7 Days', 'code': '7D', 'selected': false},
    {'value': '7_days', 'name': '14 Days', 'code': '14D', 'selected': false},
    {
      'value': 'month_to_date',
      'name': 'Month To Date',
      'code': 'MTD',
      'selected': false
    },
    {'value': '30_days', 'name': '30 Days', 'code': '1M', 'selected': true},
    {'value': '90_days', 'name': '90 Days', 'code': '3M', 'selected': false},
    {
      'value': 'year_to_date',
      'name': 'Year To Date',
      'code': 'YTD',
      'selected': false
    },
    {'value': '1_year', 'name': '1 Year', 'code': '1Y', 'selected': false},
    {'value': '2_year', 'name': '2 Years', 'code': '2Y', 'selected': false},
    {
      'value': 'custom_date',
      'name': 'Custom Date',
      'code': 'CUS',
      'selected': false,
      'startDate': '',
      'endDate': ''
    },
  ];
}
