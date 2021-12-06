# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a CHANGELOG](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

In place of release version numbers, we organize via deploys to Production (by Date/Time).

## 2021-12-01: Add Foundation 6

- Add Foundation 6 (from Zurb)
  - format menu, tables
- Extract layout.scss, font_awesome.scs fom application.scss
- Style:
  - Format menu, tables
  - Convert "custom" element subheader to .subheader
  - Add padding to div.main
  - Add :after images for internal/external links
- Removed gem "spinners"
- Rename HtmlValidationScan to HtmlValidationPageScan (convention *_page_scan.rb)

## 2021-12-01: Add favicon, fix issues

- FIX: PageScan.descendants (again - for testing too, this time)
- FIX: website#html_validation_page_scan (redirect_back caused multiple scans)
- FIX: webpages#show, correct website URL link (was local)
- WORKAROUND: page_scans#index limits to 25 (needs pagination)
- Rename HtmlValidationScan to HtmlValidation*Page*Scan
- Add accessible-icon as favicon

## 2021-11-24: Present Validator info

- add validator URL to PageScan#show and tooltips
- docs: adds bashtetikn pronunciation
- corrects PageScan.descendants via models/concerns/sti_preloader
- deploy: improve WEB_CONCURRENCY support

## 2021-11-23: Scan all pages

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
