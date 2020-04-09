import pytest
from py.xml import html

def pytest_html_report_title(report):
   report.title = "Dummy request test report - LongTran"

@pytest.fixture()
def base_url():
   return "https://httpbin.org"