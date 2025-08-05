import { test as base, expect } from '@playwright/test';

const test = base.extend({
    // Add any custom fixtures or overrides here
});

test('Check page title', async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('domcontentloaded');
    await expect(page).toHaveTitle(/GitHub · Build and ship software on a single, collaborative platform · GitHub/);
});

test('Check page url', async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('domcontentloaded');
    await expect(page).toHaveURL(/github.vn/, { timeout: 5000 });
});
