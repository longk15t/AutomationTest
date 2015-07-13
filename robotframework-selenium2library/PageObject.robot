*** Variables ***
${LINKEDIN_URL}    https://www.linkedin.com
${GOOGLE_URL}    https://google.com

${SIGNIN_BUTTON}    xpath=//input[contains(@id, 'login-submit')]
${SEARCH_BAR}    xpath=//a[contains(text(), 'Tìm kiếm')]
# Actually, put web drivers into PATH or C:\Python27\Scripts
${WEBDRIVER}    D:\\workspace\\python\\robot-framework\\webdriver\\chromedriver.exe
${BROWSER}    Chrome