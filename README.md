
## Browser Support
- Chrome 70+ (recommended)
- Edge 79+
- Firefox 80+
- Safari 13.1+ (limited PWA support)
- Opera 60+

## Storage
- **LocalStorage**: Files and settings
- **Cache API**: Offline assets
- **IndexedDB**: Future expansion
- **Quota**: ~5-10MB per origin (can be expanded)

## Keyboard Shortcuts
- `Ctrl/Cmd + S`: Save current file
- `Ctrl/Cmd + Enter`: Run code
- `Ctrl/Cmd + F`: Find in editor
- `Ctrl/Cmd + Z/Y`: Undo/Redo
- `F5`: Refresh preview

## Development

### Customization
1. Edit `manifest.json` for app metadata
2. Modify `service-worker.js` for caching strategy
3. Update `offline.html` for offline experience
4. Customize icons in `icons/` folder

### Testing PWA
1. Serve via HTTPS (required for PWA)
2. Use Chrome DevTools → Application → Service Workers
3. Test offline mode in DevTools → Network → Offline
4. Check installability in DevTools → Lighthouse

## Privacy & Security
- No data sent to external servers
- All files stored locally
- No analytics/tracking
- HTTPS required for PWA features

## License
© 2023 SupremeAmer Application Development Organization. All rights reserved.

## Support
For issues or questions:
1. Check browser console for errors
2. Clear browser cache if needed
3. Ensure HTTPS is used for PWA
4. Check storage quota availability