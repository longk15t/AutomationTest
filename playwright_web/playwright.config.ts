import { defineConfig, devices } from '@playwright/test';
import * as dotenv from 'dotenv';

export default defineConfig({
  testDir: './tests',
  expect: { timeout: 30 * 1000 },
  timeout: 30 * 1000,
  fullyParallel: false,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 1 : 0,
  workers: process.env.CI ? 1 : 1,
  reporter: [
    ['html', { outputFolder: 'playwright-report', open: 'never' }],
    ['json', { outputFile: 'test-results/results.json' }],
    ['junit', { outputFile: 'test-results/results.xml' }],
    ['playwright-ctrf-json-reporter', {
        screenshot: true,              // Optional: Include screenshots in the report. Defaults to 'false'.
        testType: 'e2e',                // Optional: Specify the test type (e.g., 'api', 'e2e'). Defaults to 'e2e'.
        appName: 'PlaywrightWeb',               // Optional: Specify the name of the application under test.
        appVersion: '1.0.0',            // Optional: Specify the version of the application under test.
        osPlatform: 'windows',            // Optional: Specify the OS platform.
        osRelease: '11',             // Optional: Specify the OS release version.
        buildUrl: "https://github.com",    // Optional: Specify the build url.
        repositoryName: "AutomationTest",    // Optional: Specify the repository name.
        repositoryUrl: "https://github.com/longk15t/AutomationTest", // Optional: Specify the repository url.
        branchName: "master",             // Optional: Specify the branch name.
        testEnvironment: "production"      // Optional: Specify the test environment (e.g. staging, production).
    }]
  ],
  outputDir: 'test-results',

  use: {
    baseURL: 'https://github.com/',
    headless: true,
    launchOptions: { slowMo: 500 },
    actionTimeout: 30 * 1000,
    navigationTimeout: 30 * 1000,
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
    permissions: ['geolocation'],
  },

  projects: [
    {
      name: 'chrome',
      use: {
        ...devices['Desktop Chrome'],
        viewport: { width: 1920, height: 1080 },
      },
    },
  ],
});
