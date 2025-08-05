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
    ['html', { outputFolder: 'playwright-report', open: 'never' }]
    ['json', { outputFile: 'test-results/results.json' }],
    ['junit', { outputFile: 'test-results/results.xml' }],
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
      name: 'chromium',
      use: {
        ...devices['Desktop Chrome'],
        viewport: { width: 1920, height: 1080 },
      },
    },
  ],
});
