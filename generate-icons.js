// generate-icons.js
// Run with: node generate-icons.js
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

// Icon sizes needed for PWA
const iconSizes = [72, 96, 128, 144, 152, 192, 384, 512];

// SVG template for icons
const svgTemplate = `<?xml version="1.0" encoding="UTF-8"?>
<svg width="512" height="512" viewBox="0 0 512 512" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect width="512" height="512" rx="100" fill="#2C3E50"/>
    <path d="M202.667 138.667H309.333C324.731 138.667 337.333 151.269 337.333 166.667V337.333C337.333 352.731 324.731 365.333 309.333 365.333H202.667C187.269 365.333 174.667 352.731 174.667 337.333V166.667C174.667 151.269 187.269 138.667 202.667 138.667Z" fill="white"/>
    <path d="M160 196H165C330.667 196 352 217.333 352 283V352C352 360.837 345.171 367 336.333 367H319.667C310.829 367 304 360.837 304 352V283C304 267.171 292.463 256 276.667 256H160C151.171 256 144.333 249.837 144.333 241V201C144.333 192.163 151.171 186 160 186Z" fill="white"/>
    <path d="M416 320H424C352 320 336 304 336 232V192C336 183.163 342.829 176 351.667 176H368.333C377.171 176 384 183.163 384 192V232C384 247.837 395.537 259 411.333 259H480C488.837 259 495.667 265.163 495.667 274V316C495.667 324.837 488.837 332 480 332H416Z" fill="white"/>
</svg>`;

console.log('Generating PWA icons...');

// Create icons directory if it doesn't exist
const iconsDir = path.join(__dirname, 'icons');
if (!fs.existsSync(iconsDir)) {
    fs.mkdirSync(iconsDir, { recursive: true });
}

// Create screenshots directory if it doesn't exist
const screenshotsDir = path.join(__dirname, 'screenshots');
if (!fs.existsSync(screenshotsDir)) {
    fs.mkdirSync(screenshotsDir, { recursive: true });
}

// Save SVG template
const svgPath = path.join(iconsDir, 'icon.svg');
fs.writeFileSync(svgPath, svgTemplate);
console.log('✓ Created SVG icon template');

// Instructions for generating PNG icons
console.log('\nTo generate PNG icons, you have several options:');
console.log('1. Use an online PWA icon generator');
console.log('2. Use ImageMagick (install first):');
console.log('   npm install -g imagemagick');
console.log('');
console.log('3. Use the pwa-asset-generator:');
console.log('   npx pwa-asset-generator icon.svg icons/');
console.log('');
console.log('4. Manually create icons at these sizes:');
iconSizes.forEach(size => {
    console.log(`   - icon-${size}.png (${size}x${size})`);
});

console.log('\n✓ Icon generation instructions ready');
console.log('✓ Project structure complete');
console.log('\nNext steps:');
console.log('1. Generate PNG icons in the icons/ folder');
console.log('2. Add screenshots to screenshots/ folder (optional)');
console.log('3. Serve via HTTPS for full PWA functionality');
console.log('4. Test with Chrome DevTools → Lighthouse');