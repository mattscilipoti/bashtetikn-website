# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a CHANGELOG](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

In place of release version numbers, we organize via deploys to Production (by Date/Time).

## Upcoming: Scan all pages

- install FontAwesome (https://github.com/tomkra/font_awesome5_rails)
- add FontAwesomeHelper#font_awesome_icon
- add PageScansHelper#page_scan_link_to
- add rspec-html-matchers for rspec
- use microscope icon for HtmlValidationScan

## 2021-11-19 HtmlValidationScans are async

- Add PageScanJob for async scans
  - Used by Webpage#validate_html
- Add PageScans#queued_at, scanned_at, state
- Extract helper: datetime_el
- Added gem: spinners
- Webpage#show lists PageScans
- Extracted partials for websites/_table and webpages/_table

## 2021-11-19 Websites have many Webpages

- Websites have many Webpages
- Convert haml to slim
- Webpage can ValidateHTML
- Create HtmlValidationScan < PageScan
- Convert to simple_form
