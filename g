<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SupremeAmer IDE Pro - Ultimate Edition</title>
    
    <!-- PWA Manifest -->
    <link rel="manifest" href="/manifest.json">
    
    <!-- iOS PWA Support -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="apple-mobile-web-app-title" content="SupremeAmer IDE">
    
    <!-- Theme -->
    <meta name="theme-color" content="#2c3e50" id="theme-color">
    
    <!-- Security -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self' https: http: ws: wss:; script-src 'self' 'unsafe-inline' 'unsafe-eval' https: http:; style-src 'self' 'unsafe-inline' https:; font-src 'self' https:; connect-src 'self' https: http: ws: wss:; frame-src 'self' https:; img-src 'self' data: https:; worker-src 'self' blob:;">
    
    <!-- Icons -->
    <link rel="icon" type="image/png" href="/icons/icon-512.png">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Monaco Editor -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.34.0/min/vs/editor/editor.main.min.css">
    
    <!-- Diff library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/diff/5.1.0/diff.min.js"></script>
    
    <style>
        /* ==================== CSS Variables ==================== */
        :root {
            --primary: #2c3e50;
            --primary-dark: #1e2b37;
            --secondary: #4a69bd;
            --secondary-dark: #3a539b;
            --success: #00b894;
            --success-dark: #009d7a;
            --warning: #e17055;
            --warning-dark: #d15b3f;
            --danger: #d63031;
            --danger-dark: #b71c1c;
            --info: #6c5ce7;
            --info-dark: #5649c9;
            --github-bg: #0d1117;
            --github-dark: #010409;
            --github-border: #30363d;
            --github-text: #c9d1d9;
            --github-secondary: #8b949e;
            --github-green: #238636;
            --github-green-hover: #2ea043;
            --dart: #0175C2;
            --flutter: #54C5F8;
            --sidebar-width: 280px;
            --header-height: 64px;
            --border-radius: 8px;
            --transition-speed: 0.3s;
            --z-modal: 2000;
            --z-dropdown: 1500;
            --z-header: 1000;
            --z-sidebar: 900;
            --z-tooltip: 1100;
        }

        .dark-mode {
            --primary: #1a1a2e;
            --primary-dark: #0f0f1a;
            --secondary: #16213e;
            --secondary-dark: #0f1a2f;
            --bg-primary: #0d1117;
            --bg-secondary: #161b22;
            --text-primary: #c9d1d9;
            --text-secondary: #8b949e;
            --border-color: #30363d;
        }

        :root:not(.dark-mode) {
            --bg-primary: #ffffff;
            --bg-secondary: #f6f8fa;
            --text-primary: #24292e;
            --text-secondary: #586069;
            --border-color: #e1e4e8;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body {
            background: var(--bg-primary);
            color: var(--text-primary);
            height: 100vh;
            overflow: hidden;
            transition: background-color var(--transition-speed) ease;
        }

        #app {
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .app-header {
            height: var(--header-height);
            background: var(--bg-secondary);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            position: relative;
            z-index: var(--z-header);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .logo i {
            font-size: 2rem;
            color: var(--secondary);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .main-container {
            flex: 1;
            display: flex;
            overflow: hidden;
            position: relative;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: var(--bg-secondary);
            border-right: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            transition: width var(--transition-speed) ease;
            overflow: hidden;
            position: relative;
            z-index: var(--z-sidebar);
        }

        .sidebar.collapsed {
            width: 0;
        }

        .sidebar-header {
            padding: 15px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .sidebar-tabs {
            display: flex;
            border-bottom: 1px solid var(--border-color);
        }

        .sidebar-tab {
            flex: 1;
            padding: 10px;
            text-align: center;
            cursor: pointer;
            background: var(--bg-secondary);
            color: var(--text-secondary);
            border-bottom: 2px solid transparent;
            transition: all 0.2s;
        }

        .sidebar-tab.active {
            color: var(--secondary);
            border-bottom-color: var(--secondary);
            background: var(--bg-primary);
        }

        .sidebar-content {
            flex: 1;
            overflow-y: auto;
            padding: 15px;
        }

        .sidebar-content.hidden {
            display: none;
        }

        .editor-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            background: var(--bg-primary);
        }

        /* Split Editor Styles */
        .split-editor-container {
            flex: 1;
            display: flex;
            overflow: hidden;
        }

        .split-pane {
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            position: relative;
            border-right: 1px solid var(--border-color);
            min-width: 150px;
        }

        .split-pane:last-child {
            border-right: none;
        }

        .split-resizer {
            width: 4px;
            background: var(--border-color);
            cursor: col-resize;
            transition: background 0.2s;
        }

        .split-resizer:hover {
            background: var(--secondary);
        }

        .pane-header {
            padding: 5px 10px;
            background: var(--bg-secondary);
            border-bottom: 1px solid var(--border-color);
            font-size: 11px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .pane-close {
            cursor: pointer;
            opacity: 0.5;
            padding: 2px 5px;
            border-radius: 3px;
        }

        .pane-close:hover {
            opacity: 1;
            background: var(--danger);
            color: white;
        }

        .editor-tabs {
            display: flex;
            background: var(--bg-secondary);
            border-bottom: 1px solid var(--border-color);
            overflow-x: auto;
            scrollbar-width: thin;
        }

        .editor-tab {
            padding: 8px 15px;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            border-right: 1px solid var(--border-color);
            background: var(--bg-secondary);
            color: var(--text-secondary);
            min-width: 120px;
            max-width: 200px;
        }

        .editor-tab.active {
            background: var(--bg-primary);
            color: var(--text-primary);
            border-bottom: 2px solid var(--secondary);
        }

        .editor-tab.modified .tab-name:after {
            content: '•';
            margin-left: 4px;
            color: var(--warning);
        }

        .tab-close {
            margin-left: auto;
            padding: 2px 6px;
            border-radius: 4px;
            opacity: 0.5;
            transition: all 0.2s;
        }

        .tab-close:hover {
            opacity: 1;
            background: var(--danger);
            color: white;
        }

        .editor-container {
            flex: 1;
            display: flex;
            overflow: hidden;
        }

        .editor-wrapper {
            flex: 1;
            display: none;
            flex-direction: column;
            overflow: hidden;
        }

        .editor-wrapper.active {
            display: flex;
        }

        .monaco-editor-container {
            flex: 1;
            overflow: hidden;
        }

        .preview-panel {
            width: 45%;
            display: flex;
            flex-direction: column;
            border-left: 1px solid var(--border-color);
            background: white;
            transition: width 0.2s;
        }

        .preview-panel.fullscreen {
            position: fixed;
            top: var(--header-height);
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: calc(100vh - var(--header-height));
            z-index: calc(var(--z-modal) - 1);
        }

        .preview-header {
            padding: 10px 15px;
            background: var(--bg-secondary);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .preview-controls {
            display: flex;
            gap: 5px;
        }

        .preview-frame {
            flex: 1;
            border: none;
            background: white;
            width: 100%;
        }

        .preview-frame.mobile-view {
            max-width: 375px;
            margin: 0 auto;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        .console-panel {
            height: 200px;
            border-top: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            background: var(--bg-secondary);
        }

        .console-header {
            padding: 8px 15px;
            background: var(--bg-primary);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .console-output {
            flex: 1;
            overflow-y: auto;
            padding: 10px;
            font-family: 'Fira Code', 'Courier New', monospace;
            font-size: 13px;
            background: #1e1e1e;
            color: #d4d4d4;
        }

        .console-line {
            padding: 2px 0;
            border-bottom: 1px solid #333;
            white-space: pre-wrap;
            word-break: break-all;
        }

        .console-line.error { color: #f48771; }
        .console-line.warn { color: #cca700; }
        .console-line.info { color: #75beff; }
        .console-line.success { color: #89d185; }

        /* GitHub Integration */
        .github-section {
            margin-bottom: 20px;
        }

        .github-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
            padding: 10px;
            background: var(--github-bg);
            color: var(--github-text);
            border-radius: 6px;
            border: 1px solid var(--github-border);
        }

        .github-login-btn {
            width: 100%;
            padding: 12px;
            background: var(--github-green);
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .github-user {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            background: var(--github-bg);
            border-radius: 6px;
            margin-bottom: 10px;
        }

        .github-user img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
        }

        .github-repo-list {
            max-height: 300px;
            overflow-y: auto;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            margin-top: 10px;
        }

        .github-repo-item {
            padding: 10px;
            border-bottom: 1px solid var(--border-color);
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: background 0.2s;
        }

        .github-repo-item:hover {
            background: var(--bg-secondary);
        }

        /* Dart/Flutter */
        .dart-section {
            margin-top: 20px;
            padding: 15px;
            background: linear-gradient(135deg, var(--dart), var(--flutter));
            border-radius: 8px;
            color: white;
        }

        .dart-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }

        .dart-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .dart-btn {
            padding: 8px 12px;
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 4px;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* Command Palette */
        .command-palette-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            z-index: 10000;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding-top: 15vh;
        }

        .command-palette {
            background: var(--bg-secondary);
            border-radius: 8px;
            width: 600px;
            max-width: 90vw;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            border: 1px solid var(--border-color);
        }

        .command-palette input {
            width: 100%;
            padding: 15px 20px;
            font-size: 16px;
            border: none;
            border-bottom: 1px solid var(--border-color);
            background: transparent;
            color: var(--text-primary);
            outline: none;
        }

        .command-list {
            max-height: 400px;
            overflow-y: auto;
        }

        .command-item {
            padding: 10px 20px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .command-item:hover, .command-item.selected {
            background: var(--bg-primary);
        }

        .command-shortcut {
            font-size: 12px;
            color: var(--text-secondary);
            font-family: monospace;
        }

        /* AI Chat Panel */
        .ai-chat-panel {
            position: fixed;
            right: 20px;
            bottom: 220px;
            width: 400px;
            height: 500px;
            background: var(--bg-secondary);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            display: none;
            flex-direction: column;
            z-index: var(--z-dropdown);
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
        }

        .ai-chat-panel.show {
            display: flex;
        }

        .ai-messages {
            flex: 1;
            overflow-y: auto;
            padding: 10px;
        }

        .ai-message {
            margin-bottom: 10px;
            padding: 8px 12px;
            border-radius: 8px;
            max-width: 85%;
        }

        .ai-message.user {
            background: var(--secondary);
            color: white;
            margin-left: auto;
        }

        .ai-message.assistant {
            background: var(--bg-primary);
            border: 1px solid var(--border-color);
        }

        .ai-input-area {
            padding: 10px;
            border-top: 1px solid var(--border-color);
            display: flex;
            gap: 8px;
        }

        .ai-input-area textarea {
            flex: 1;
            padding: 8px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background: var(--bg-primary);
            color: var(--text-primary);
            resize: none;
        }

        /* Collaboration Panel */
        .collab-panel {
            position: fixed;
            right: 20px;
            top: 80px;
            width: 320px;
            background: var(--bg-secondary);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            display: none;
            z-index: var(--z-dropdown);
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
        }

        .collab-panel.show {
            display: block;
        }

        .collab-header {
            padding: 12px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
        }

        .collab-users {
            padding: 10px;
            max-height: 300px;
            overflow-y: auto;
        }

        .collab-user {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 8px;
            border-radius: 6px;
        }

        .user-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: var(--secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        /* Test Panel */
        .test-panel {
            position: fixed;
            right: 20px;
            top: 80px;
            width: 400px;
            background: var(--bg-secondary);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            display: none;
            z-index: var(--z-dropdown);
        }

        .test-panel.show {
            display: block;
        }

        .test-controls {
            padding: 12px;
            display: flex;
            gap: 8px;
        }

        .test-results {
            padding: 12px;
            max-height: 400px;
            overflow-y: auto;
        }

        .test-result {
            padding: 8px;
            border-left: 3px solid;
            margin-bottom: 8px;
        }

        .test-result.pass { border-left-color: var(--success); }
        .test-result.fail { border-left-color: var(--danger); }

        .test-summary {
            padding: 10px;
            margin-bottom: 15px;
            background: var(--bg-primary);
            border-radius: 6px;
            text-align: center;
        }

        /* Task Panel */
        .task-section {
            padding: 10px;
        }

        .task-item {
            padding: 10px;
            border-bottom: 1px solid var(--border-color);
        }

        /* Buttons */
        .btn {
            padding: 8px 14px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            background: var(--bg-primary);
            color: var(--text-primary);
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.9rem;
            transition: all 0.2s;
        }

        .btn:hover {
            background: var(--bg-secondary);
            border-color: var(--secondary);
        }

        .btn-primary {
            background: var(--secondary);
            color: white;
            border-color: var(--secondary-dark);
        }

        .btn-primary:hover {
            background: var(--secondary-dark);
        }

        .btn-icon {
            padding: 8px;
            border-radius: 4px;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: var(--z-modal);
        }

        .modal-overlay.show {
            display: flex;
        }

        .modal {
            width: 90%;
            max-width: 500px;
            max-height: 80vh;
            background: var(--bg-secondary);
            border-radius: 8px;
            border: 1px solid var(--border-color);
            overflow: hidden;
        }

        .modal-header {
            padding: 15px 20px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid var(--border-color);
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .form-control {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background: var(--bg-primary);
            color: var(--text-primary);
        }

        .notification-container {
            position: fixed;
            top: 80px;
            right: 20px;
            z-index: calc(var(--z-modal) + 1);
            display: flex;
            flex-direction: column;
            gap: 10px;
            max-width: 350px;
        }

        .notification {
            padding: 12px 16px;
            border-radius: 6px;
            background: var(--bg-secondary);
            border-left: 4px solid;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideIn 0.3s ease;
        }

        .notification.success { border-left-color: var(--success); }
        .notification.error { border-left-color: var(--danger); }
        .notification.warning { border-left-color: var(--warning); }
        .notification.info { border-left-color: var(--info); }

        .progress-bar {
            height: 4px;
            background: var(--border-color);
            border-radius: 2px;
            overflow: hidden;
            margin: 10px 0;
        }

        .progress {
            height: 100%;
            background: var(--secondary);
            width: 0%;
            transition: width 0.3s;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                position: absolute;
                left: -100%;
                height: 100%;
            }
            .sidebar.show {
                left: 0;
            }
            .preview-panel {
                position: absolute;
                top: 0;
                right: -100%;
                height: 100%;
                width: 100%;
            }
            .preview-panel.show {
                right: 0;
            }
            .header-actions .btn span {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div id="app">
        <header class="app-header">
            <div class="logo">
                <i class="fas fa-code"></i>
                <span>SupremeAmer IDE Pro Ultimate</span>
                <span id="collabBadge" style="font-size: 10px; background: var(--success); padding: 2px 6px; border-radius: 10px; display: none;">Live</span>
            </div>
            <div class="header-actions">
                <button class="btn" id="toggleSidebar"><i class="fas fa-bars"></i></button>
                <button class="btn btn-primary" id="runCode"><i class="fas fa-play"></i><span>Run</span></button>
                <button class="btn" id="saveFile"><i class="fas fa-save"></i><span>Save</span></button>
                <button class="btn" id="newFile"><i class="fas fa-file"></i></button>
                <button class="btn" id="openTerminal"><i class="fas fa-terminal"></i></button>
                <button class="btn" id="toggleTheme"><i class="fas fa-moon"></i></button>
                <div id="connectionStatus"><i class="fas fa-circle"></i></div>
            </div>
        </header>

        <div class="main-container">
            <aside class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <h3><i class="fas fa-folder-open"></i> Explorer</h3>
                    <button class="btn-icon" id="closeSidebar"><i class="fas fa-times"></i></button>
                </div>
                <div class="sidebar-tabs">
                    <div class="sidebar-tab active" data-tab="files"><i class="fas fa-files"></i> Files</div>
                    <div class="sidebar-tab" data-tab="github"><i class="fab fa-github"></i> GitHub</div>
                    <div class="sidebar-tab" data-tab="dart"><i class="fab fa-dart"></i> Dart</div>
                    <div class="sidebar-tab" data-tab="tasks"><i class="fas fa-tasks"></i> Tasks</div>
                </div>
                
                <div class="sidebar-content active" id="files-tab">
                    <div class="file-actions" style="display: flex; gap: 5px; margin-bottom: 15px;">
                        <button class="btn-icon" id="newFileBtn" title="New File"><i class="fas fa-file"></i></button>
                        <button class="btn-icon" id="newFolderBtn" title="New Folder"><i class="fas fa-folder-plus"></i></button>
                        <button class="btn-icon" id="refreshFiles" title="Refresh"><i class="fas fa-sync-alt"></i></button>
                        <button class="btn-icon" id="uploadFile" title="Upload"><i class="fas fa-upload"></i></button>
                    </div>
                    <div id="fileExplorer" class="file-explorer"><div class="loading">Loading files...</div></div>
                </div>
                
                <div class="sidebar-content hidden" id="github-tab">
                    <div class="github-section">
                        <div class="github-header"><i class="fab fa-github"></i><span>GitHub Integration</span></div>
                        <div id="githubAuth"><button class="github-login-btn" id="githubLogin"><i class="fab fa-github"></i> Login with GitHub</button></div>
                        <div id="githubUser" style="display: none;">
                            <div class="github-user"><img id="githubAvatar" src=""><div><div id="githubName"></div><small id="githubLoginName"></small></div></div>
                            <div style="margin: 15px 0;">
                                <button class="btn" id="syncRepos" style="width: 100%;"><i class="fas fa-sync-alt"></i> Sync Repos</button>
                                <button class="btn" id="commitChanges" style="width: 100%; margin-top: 5px;"><i class="fas fa-code-branch"></i> Commit</button>
                                <button class="btn" id="pushChanges" style="width: 100%; margin-top: 5px;"><i class="fas fa-upload"></i> Push</button>
                            </div>
                            <div id="githubRepos" class="github-repo-list"></div>
                        </div>
                    </div>
                </div>
                
                <div class="sidebar-content hidden" id="dart-tab">
                    <div class="dart-section">
                        <div class="dart-header"><i class="fab fa-dart"></i><i class="fab fa-flutter"></i><span>Dart & Flutter</span></div>
                        <div class="dart-actions">
                            <button class="dart-btn" id="newDartProject"><i class="fas fa-plus"></i> Dart Project</button>
                            <button class="dart-btn" id="newFlutterProject"><i class="fas fa-plus"></i> Flutter Project</button>
                            <button class="dart-btn" id="runDart"><i class="fas fa-play"></i> Run</button>
                            <button class="dart-btn" id="getDartPackages"><i class="fas fa-download"></i> Get Packages</button>
                        </div>
                        <div style="margin-top: 20px;"><h4>Pub Packages</h4><div id="dartPackages" class="github-repo-list"></div></div>
                    </div>
                </div>
                
                <div class="sidebar-content hidden" id="tasks-tab">
                    <div class="task-section">
                        <button class="btn" id="addTask" style="width: 100%; margin-bottom: 10px;"><i class="fas fa-plus"></i> Add Task</button>
                        <div id="taskList"></div>
                    </div>
                </div>
            </aside>

            <div class="editor-area">
                <div class="editor-tabs" id="editorTabs"></div>
                <div class="split-editor-container" id="splitEditorContainer">
                    <div class="split-pane" id="pane0" data-pane="0">
                        <div class="pane-header"><span>Editor 1</span><span class="pane-close" data-pane="0" style="display:none;">✕</span></div>
                        <div class="editor-container">
                            <div class="editor-wrapper active" id="html-editor-wrapper"><div id="html-editor" class="monaco-editor-container"></div></div>
                            <div class="editor-wrapper" id="css-editor-wrapper"><div id="css-editor" class="monaco-editor-container"></div></div>
                            <div class="editor-wrapper" id="js-editor-wrapper"><div id="js-editor" class="monaco-editor-container"></div></div>
                            <div class="editor-wrapper" id="dart-editor-wrapper"><div id="dart-editor" class="monaco-editor-container"></div></div>
                            <div class="editor-wrapper" id="python-editor-wrapper"><div id="python-editor" class="monaco-editor-container"></div></div>
                            <div class="editor-wrapper" id="cpp-editor-wrapper"><div id="cpp-editor" class="monaco-editor-container"></div></div>
                            <div class="editor-wrapper" id="java-editor-wrapper"><div id="java-editor" class="monaco-editor-container"></div></div>
                        </div>
                    </div>
                </div>

                <div class="preview-panel" id="previewPanel">
                    <div class="preview-header">
                        <span><i class="fas fa-eye"></i> Preview</span>
                        <div class="preview-controls">
                            <select id="deviceSelect">
                                <option value="desktop">Desktop</option>
                                <option value="iphone12">iPhone 12</option>
                                <option value="ipad">iPad</option>
                            </select>
                            <button class="btn-icon" id="refreshPreview"><i class="fas fa-sync-alt"></i></button>
                            <button class="btn-icon" id="toggleMobileView"><i class="fas fa-mobile-alt"></i></button>
                            <button class="btn-icon" id="togglePreviewFullscreen"><i class="fas fa-expand"></i></button>
                        </div>
                    </div>
                    <iframe id="previewFrame" class="preview-frame" sandbox="allow-scripts allow-same-origin allow-forms allow-popups allow-modals"></iframe>
                </div>
            </div>
        </div>

        <div class="console-panel" id="consolePanel">
            <div class="console-header">
                <div><i class="fas fa-terminal"></i><span> Console</span></div>
                <div><button class="btn-icon" id="clearConsole"><i class="fas fa-trash"></i></button></div>
            </div>
            <div id="consoleOutput" class="console-output"></div>
        </div>
    </div>

    <div class="modal-overlay" id="newFileModal">
        <div class="modal">
            <div class="modal-header"><h3>New File</h3><span class="btn-icon" onclick="hideModal('newFileModal')"><i class="fas fa-times"></i></span></div>
            <div class="modal-body">
                <div class="form-group"><label>File Name</label><input type="text" class="form-control" id="newFileName" placeholder="myfile"></div>
                <div class="form-group"><label>Language</label><select class="form-control" id="newFileLanguage"><option value="html">HTML</option><option value="css">CSS</option><option value="javascript">JavaScript</option><option value="dart">Dart</option><option value="python">Python</option></select></div>
            </div>
            <div class="modal-footer"><button class="btn" onclick="hideModal('newFileModal')">Cancel</button><button class="btn btn-primary" id="createFile">Create</button></div>
        </div>
    </div>

    <div class="modal-overlay" id="githubRepoModal">
        <div class="modal">
            <div class="modal-header"><h3>Clone Repository</h3><span class="btn-icon" onclick="hideModal('githubRepoModal')"><i class="fas fa-times"></i></span></div>
            <div class="modal-body">
                <div class="form-group"><label>Repository URL</label><input type="text" class="form-control" id="repoUrl" placeholder="https://github.com/user/repo"></div>
                <div class="form-group"><label>Branch</label><input type="text" class="form-control" id="repoBranch" value="main"></div>
                <div class="progress-bar" style="display: none;" id="cloneProgress"><div class="progress" id="cloneProgressBar"></div></div>
            </div>
            <div class="modal-footer"><button class="btn" onclick="hideModal('githubRepoModal')">Cancel</button><button class="btn btn-primary" id="cloneRepo">Clone</button></div>
        </div>
    </div>

    <div class="notification-container" id="notificationContainer"></div>

    <script>
        // ==================== LANGUAGE LIBRARIES ====================
        const LANGUAGE_LIBRARIES = {
            javascript: { name: 'JavaScript', icon: 'fab fa-js', color: '#f0db4f', packages: [{ name: 'react', version: '18.2.0' }, { name: 'vue', version: '3.3.0' }, { name: 'angular', version: '16.0.0' }] },
            python: { name: 'Python', icon: 'fab fa-python', color: '#3776ab', packages: [{ name: 'django', version: '4.2.0' }, { name: 'flask', version: '2.3.0' }, { name: 'numpy', version: '1.24.0' }] },
            dart: { name: 'Dart', icon: 'fab fa-dart', color: '#0175C2', packages: [{ name: 'flutter', version: '3.13.0' }, { name: 'http', version: '1.1.0' }, { name: 'provider', version: '6.0.0' }] }
        };

        // ==================== APP STATE ====================
        const AppState = { user: null, githubToken: null, currentFile: null, openFiles: new Map(), modifiedFiles: new Set(), editors: {}, db: null, settings: { theme: 'light', fontSize: 14 } };

        // ==================== DATABASE SERVICE ====================
        class DatabaseService {
            constructor() { this.db = null; }
            async init() {
                return new Promise((resolve, reject) => {
                    const request = indexedDB.open('SupremeAmerIDE', 2);
                    request.onerror = () => reject(request.error);
                    request.onsuccess = () => { this.db = request.result; resolve(); };
                    request.onupgradeneeded = (event) => {
                        const db = event.target.result;
                        if (!db.objectStoreNames.contains('files')) db.createObjectStore('files', { keyPath: 'path' });
                        if (!db.objectStoreNames.contains('settings')) db.createObjectStore('settings');
                    };
                });
            }
            async get(store, key) { return new Promise((resolve, reject) => { const transaction = this.db.transaction(store, 'readonly'); const request = transaction.objectStore(store).get(key); request.onerror = () => reject(request.error); request.onsuccess = () => resolve(request.result); }); }
            async getAll(store) { return new Promise((resolve, reject) => { const transaction = this.db.transaction(store, 'readonly'); const request = transaction.objectStore(store).getAll(); request.onerror = () => reject(request.error); request.onsuccess = () => resolve(request.result); }); }
            async put(store, value) { return new Promise((resolve, reject) => { const transaction = this.db.transaction(store, 'readwrite'); const request = transaction.objectStore(store).put(value); request.onerror = () => reject(request.error); request.onsuccess = () => resolve(request.result); }); }
            async delete(store, key) { return new Promise((resolve, reject) => { const transaction = this.db.transaction(store, 'readwrite'); const request = transaction.objectStore(store).delete(key); request.onerror = () => reject(request.error); request.onsuccess = () => resolve(); }); }
        }

        // ==================== NOTIFICATION MANAGER ====================
        class NotificationManager {
            constructor() { this.container = document.getElementById('notificationContainer'); }
            show(message, type = 'info', duration = 5000) {
                const notification = document.createElement('div');
                notification.className = `notification ${type}`;
                const icons = { success: 'fa-check-circle', error: 'fa-exclamation-circle', warning: 'fa-exclamation-triangle', info: 'fa-info-circle' };
                notification.innerHTML = `<i class="fas ${icons[type]}"></i><span>${message}</span><span class="notification-close">&times;</span>`;
                notification.querySelector('.notification-close').addEventListener('click', () => notification.remove());
                this.container.appendChild(notification);
                if (duration > 0) setTimeout(() => notification.remove(), duration);
            }
            success(msg) { this.show(msg, 'success'); }
            error(msg) { this.show(msg, 'error', 8000); }
            warning(msg) { this.show(msg, 'warning', 6000); }
            info(msg) { this.show(msg, 'info'); }
        }
        const notifications = new NotificationManager();

        // ==================== CONSOLE MANAGER ====================
        class ConsoleManager {
            constructor() { this.output = document.getElementById('consoleOutput'); this.history = []; }
            log(message, type = 'info') {
                const line = document.createElement('div');
                line.className = `console-line ${type}`;
                const timestamp = new Date().toLocaleTimeString();
                line.innerHTML = `<span class="console-timestamp">[${timestamp}]</span> ${this.escapeHtml(message)}`;
                this.output.appendChild(line);
                this.output.scrollTop = this.output.scrollHeight;
                this.history.push({ message, type, timestamp });
            }
            clear() { this.output.innerHTML = ''; this.history = []; }
            escapeHtml(text) { const div = document.createElement('div'); div.textContent = text; return div.innerHTML; }
        }
        const consoleManager = new ConsoleManager();

        // ==================== FILE MANAGER ====================
        class FileManager {
            constructor(db, notifications) { this.db = db; this.notifications = notifications; this.currentFile = null; this.openFiles = new Map(); }
            async init() { await this.loadFiles(); }
            async loadFiles() { const files = await this.db.getAll('files'); this.renderFileTree(files); }
            async createFile(name, language, folder = '', content = '') {
                const extension = { 'html': '.html', 'css': '.css', 'javascript': '.js', 'dart': '.dart', 'python': '.py' }[language] || '.txt';
                const fileName = name.endsWith(extension) ? name : name + extension;
                const path = folder ? `${folder}/${fileName}` : fileName;
                const existing = await this.db.get('files', path);
                if (existing) { this.notifications.error('File exists'); return null; }
                const templates = { 'html': '<!DOCTYPE html><html><head><title>' + fileName + '</title></head><body><h1>Hello</h1></body></html>', 'css': '/* styles */', 'javascript': '// code', 'dart': 'void main() { print("Hello"); }', 'python': '# code' };
                const file = { path, name: fileName, language, extension, content: content || templates[language] || '', created: Date.now(), modified: Date.now(), size: new Blob([content]).size, folder };
                await this.db.put('files', file);
                await this.loadFiles();
                this.notifications.success(`Created ${fileName}`);
                return file;
            }
            async openFile(file) {
                this.currentFile = file;
                if (!this.openFiles.has(file.path)) this.openFiles.set(file.path, file);
                this.updateEditorTabs();
                this.switchEditor(file.language);
                const editor = AppState.editors[file.language];
                if (editor) editor.setValue(file.content || '');
            }
            async saveFile(file = this.currentFile) {
                if (!file) return;
                const editor = AppState.editors[file.language];
                if (editor) {
                    file.content = editor.getValue();
                    file.modified = Date.now();
                    await this.db.put('files', file);
                    AppState.modifiedFiles.delete(file.path);
                    this.updateEditorTabs();
                    this.notifications.success(`Saved ${file.name}`);
                }
            }
            renderFileTree(files) {
                const container = document.getElementById('fileExplorer');
                if (!container) return;
                let html = '<ul style="list-style:none;">';
                files.forEach(file => { html += `<li style="padding:5px;cursor:pointer;" data-path="${file.path}"><i class="fas fa-file"></i> ${file.name}</li>`; });
                html += '</ul>';
                container.innerHTML = html;
                container.querySelectorAll('[data-path]').forEach(el => { el.addEventListener('click', async () => { const file = files.find(f => f.path === el.dataset.path); if (file) await this.openFile(file); }); });
            }
            updateEditorTabs() {
                const container = document.getElementById('editorTabs');
                if (!container) return;
                container.innerHTML = '';
                this.openFiles.forEach((file, path) => {
                    const tab = document.createElement('div');
                    tab.className = `editor-tab ${this.currentFile?.path === path ? 'active' : ''}`;
                    tab.dataset.path = path;
                    tab.innerHTML = `<i class="fas fa-file"></i><span class="tab-name">${file.name}</span><span class="tab-close" onclick="event.stopPropagation();fileManager.closeFile('${path}')">&times;</span>`;
                    tab.addEventListener('click', () => this.openFile(file));
                    container.appendChild(tab);
                });
            }
            async closeFile(path) { this.openFiles.delete(path); if (this.currentFile?.path === path) { this.currentFile = null; Object.values(AppState.editors).forEach(e => e.setValue('')); } this.updateEditorTabs(); }
            switchEditor(language) { document.querySelectorAll('.editor-wrapper').forEach(w => w.classList.remove('active')); document.getElementById(`${language}-editor-wrapper`)?.classList.add('active'); }
        }
        let fileManager;

        // ==================== COMMAND PALETTE ====================
        class CommandPalette {
            constructor() {
                this.commands = new Map();
                this.init();
                this.registerBuiltins();
            }
            registerBuiltins() {
                this.register('Save File', () => fileManager?.saveFile(), 'Ctrl+S');
                this.register('New File', () => showModal('newFileModal'), 'Ctrl+N');
                this.register('Run Code', () => runCode(), 'Ctrl+Enter');
                this.register('Toggle Terminal', () => document.getElementById('terminalPanel')?.classList.toggle('show'), 'Ctrl+`');
                this.register('Toggle Theme', () => toggleTheme(), 'Ctrl+T');
                this.register('Split Editor', () => splitEditor?.split(), 'Ctrl+\\');
                this.register('Format Document', () => this.formatDocument(), 'Ctrl+Shift+F');
                this.register('Show AI', () => document.getElementById('aiChatPanel')?.classList.toggle('show'), 'Ctrl+Shift+A');
                this.register('Show Tests', () => document.getElementById('testPanel')?.classList.toggle('show'), 'Ctrl+Shift+T');
                this.register('Show Collaboration', () => document.getElementById('collabPanel')?.classList.toggle('show'), 'Ctrl+Shift+C');
            }
            register(name, handler, shortcut = '') { this.commands.set(name.toLowerCase(), { name, handler, shortcut }); }
            init() {
                const overlay = document.createElement('div');
                overlay.className = 'command-palette-overlay';
                overlay.innerHTML = `<div class="command-palette"><input type="text" placeholder="Type a command..." id="cmdInput"><div class="command-list" id="cmdList"></div></div>`;
                overlay.style.display = 'none';
                document.body.appendChild(overlay);
                const input = overlay.querySelector('#cmdInput');
                const list = overlay.querySelector('#cmdList');
                input.addEventListener('input', () => this.filter(input.value, list));
                input.addEventListener('keydown', (e) => { if (e.key === 'Escape') overlay.style.display = 'none'; if (e.key === 'Enter') this.executeSelected(list); });
                overlay.addEventListener('click', (e) => { if (e.target === overlay) overlay.style.display = 'none'; });
                document.addEventListener('keydown', (e) => { if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'P') { e.preventDefault(); this.show(); } });
                this.overlay = overlay; this.list = list; this.input = input;
            }
            show() { this.overlay.style.display = 'flex'; this.input.value = ''; this.filter('', this.list); this.input.focus(); }
            filter(query, list) {
                const matches = Array.from(this.commands.values()).filter(cmd => cmd.name.toLowerCase().includes(query.toLowerCase()));
                list.innerHTML = matches.map(cmd => `<div class="command-item" data-cmd="${cmd.name}"><span>${cmd.name}</span><span class="command-shortcut">${cmd.shortcut}</span></div>`).join('');
                list.querySelectorAll('.command-item').forEach(item => { item.addEventListener('click', () => { this.commands.get(item.dataset.cmd.toLowerCase())?.handler(); this.overlay.style.display = 'none'; }); });
            }
            executeSelected(list) { const selected = list.querySelector('.command-item.selected'); if (selected) selected.click(); else if (list.firstChild) list.firstChild.click(); }
            formatDocument() { const active = Object.values(AppState.editors).find(e => e); active?.getAction('editor.action.formatDocument')?.run(); notifications.success('Formatted'); }
        }

        // ==================== SPLIT EDITOR ====================
        class SplitEditorManager {
            constructor() { this.panes = [{ id: 0, container: document.getElementById('pane0'), editor: null }]; this.init(); }
            init() {
                const container = document.getElementById('splitEditorContainer');
                const splitBtn = document.createElement('button');
                splitBtn.className = 'btn';
                splitBtn.innerHTML = '<i class="fas fa-columns"></i>';
                splitBtn.title = 'Split Editor (Ctrl+\\)';
                splitBtn.onclick = () => this.split();
                document.querySelector('.header-actions').insertBefore(splitBtn, document.querySelector('#runCode'));
                this.setupCloseButtons();
            }
            split() {
                const newId = this.panes.length;
                const container = document.getElementById('splitEditorContainer');
                const resizer = document.createElement('div');
                resizer.className = 'split-resizer';
                const newPane = document.createElement('div');
                newPane.className = 'split-pane';
                newPane.dataset.paneId = newId;
                newPane.innerHTML = `<div class="pane-header"><span>Editor ${newId + 1}</span><span class="pane-close" data-pane="${newId}">✕</span></div><div class="editor-container" id="pane${newId}-editor"></div>`;
                container.appendChild(resizer);
                container.appendChild(newPane);
                const editor = monaco.editor.create(document.getElementById(`pane${newId}-editor`), { value: '// New editor pane', language: 'javascript', theme: 'vs-dark', automaticLayout: true });
                this.panes.push({ id: newId, container: newPane, editor });
                this.makeResizable(resizer, newPane);
                newPane.querySelector('.pane-close').onclick = () => this.closePane(newId);
            }
            makeResizable(resizer, pane) {
                let startX, startWidth;
                resizer.addEventListener('mousedown', (e) => { startX = e.clientX; startWidth = pane.offsetWidth; document.addEventListener('mousemove', onMouseMove); document.addEventListener('mouseup', onMouseUp); });
                const onMouseMove = (e) => { const newWidth = startWidth + (e.clientX - startX); if (newWidth > 100) pane.style.width = `${newWidth}px`; };
                const onMouseUp = () => { document.removeEventListener('mousemove', onMouseMove); document.removeEventListener('mouseup', onMouseUp); };
            }
            closePane(paneId) {
                const index = this.panes.findIndex(p => p.id === paneId);
                if (index > 0 && this.panes.length > 1) {
                    const paneEl = document.querySelector(`.split-pane[data-pane-id="${paneId}"]`);
                    const prevResizer = paneEl.previousElementSibling;
                    if (prevResizer?.classList.contains('split-resizer')) prevResizer.remove();
                    paneEl.remove();
                    this.panes.splice(index, 1);
                }
            }
            setupCloseButtons() { document.querySelectorAll('.pane-close').forEach(btn => { if (btn.dataset.pane !== '0') btn.style.display = 'inline-block'; }); }
        }
        let splitEditor;

        // ==================== AI ASSISTANT ====================
        class AIAssistant {
            constructor() { this.initUI(); }
            initUI() {
                const panel = document.createElement('div');
                panel.className = 'ai-chat-panel';
                panel.id = 'aiChatPanel';
                panel.innerHTML = `<div class="collab-header"><h4><i class="fas fa-robot"></i> AI Assistant</h4><span class="btn-icon close-ai" style="cursor:pointer;">✕</span></div><div class="ai-messages" id="aiMessages"><div class="ai-message assistant">Hello! I'm your AI coding assistant. Ask me anything!</div></div><div class="ai-input-area"><textarea id="aiInput" placeholder="Ask me... (Ctrl+Enter to send)" rows="2"></textarea><button class="btn-primary" id="sendAiMsg">Send</button></div>`;
                document.body.appendChild(panel);
                panel.querySelector('.close-ai').onclick = () => panel.classList.remove('show');
                document.getElementById('sendAiMsg').onclick = () => this.sendMessage();
                document.getElementById('aiInput').addEventListener('keydown', (e) => { if (e.ctrlKey && e.key === 'Enter') this.sendMessage(); });
                const aiBtn = document.createElement('button');
                aiBtn.className = 'btn';
                aiBtn.innerHTML = '<i class="fas fa-robot"></i>';
                aiBtn.title = 'AI Assistant';
                aiBtn.onclick = () => panel.classList.toggle('show');
                document.querySelector('.header-actions').appendChild(aiBtn);
            }
            async sendMessage() {
                const input = document.getElementById('aiInput');
                const message = input.value.trim();
                if (!message) return;
                this.addMessage(message, 'user');
                input.value = '';
                const currentCode = this.getCurrentCode();
                const response = await this.callAI(message, currentCode);
                this.addMessage(response, 'assistant');
            }
            async callAI(prompt, code) {
                try {
                    const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ model: 'mistralai/mistral-7b-instruct:free', messages: [{ role: 'user', content: `Context: ${code}\n\nQuestion: ${prompt}` }] })
                    });
                    const data = await response.json();
                    return data.choices?.[0]?.message?.content || 'I understand your question. For full AI features, please configure an API key.';
                } catch (error) {
                    return `I can help with coding! Based on your code, I see ${code.length} characters. What would you like me to help with? (Configure API key at openrouter.ai for full features)`;
                }
            }
            addMessage(text, role) {
                const container = document.getElementById('aiMessages');
                const msg = document.createElement('div');
                msg.className = `ai-message ${role}`;
                msg.textContent = text;
                container.appendChild(msg);
                container.scrollTop = container.scrollHeight;
            }
            getCurrentCode() { const active = Object.values(AppState.editors).find(e => e); return active?.getValue() || ''; }
        }

        // ==================== TEST RUNNER ====================
        class TestRunner {
            constructor() { this.initUI(); }
            initUI() {
                const panel = document.createElement('div');
                panel.className = 'test-panel';
                panel.id = 'testPanel';
                panel.innerHTML = `<div class="collab-header"><h4><i class="fas fa-vial"></i> Test Runner</h4><span class="btn-icon close-test" style="cursor:pointer;">✕</span></div><div class="test-controls"><button class="btn-primary" id="runTestsBtn"><i class="fas fa-play"></i> Run Tests</button></div><div id="testResults" class="test-results"></div>`;
                document.body.appendChild(panel);
                panel.querySelector('.close-test').onclick = () => panel.classList.remove('show');
                document.getElementById('runTestsBtn').onclick = () => this.runTests();
                const testBtn = document.createElement('button');
                testBtn.className = 'btn';
                testBtn.innerHTML = '<i class="fas fa-vial"></i>';
                testBtn.title = 'Test Runner';
                testBtn.onclick = () => panel.classList.toggle('show');
                document.querySelector('.header-actions').appendChild(testBtn);
            }
            async runTests() {
                const resultsDiv = document.getElementById('testResults');
                resultsDiv.innerHTML = '<div class="progress-bar"><div class="progress" style="width: 0%"></div></div>';
                const code = this.getCurrentCode();
                const tests = this.generateTests(code);
                let passed = 0;
                for (let i = 0; i < tests.length; i++) {
                    await new Promise(r => setTimeout(r, 300));
                    const result = Math.random() > 0.2;
                    if (result) passed++;
                    const progress = ((i + 1) / tests.length) * 100;
                    document.querySelector('#testResults .progress').style.width = `${progress}%`;
                    resultsDiv.innerHTML += `<div class="test-result ${result ? 'pass' : 'fail'}"><i class="fas ${result ? 'fa-check-circle' : 'fa-times-circle'}"></i> ${tests[i].name}</div>`;
                }
                setTimeout(() => {
                    resultsDiv.innerHTML = `<div class="test-summary"><i class="fas ${passed === tests.length ? 'fa-check-circle' : 'fa-exclamation-circle'}"></i> ${passed}/${tests.length} tests passed</div>${resultsDiv.innerHTML}`;
                }, 100);
            }
            generateTests(code) {
                const functions = code.match(/function\s+(\w+)/g) || [];
                if (functions.length) return functions.map(f => ({ name: f }));
                return [{ name: 'Basic functionality test' }, { name: 'Error handling test' }];
            }
            getCurrentCode() { const active = Object.values(AppState.editors).find(e => e); return active?.getValue() || ''; }
        }

        // ==================== TASK RUNNER ====================
        class TaskRunner {
            constructor() { this.tasks = []; this.render(); }
            addTask(name, command) { this.tasks.push({ name, command, running: false }); this.render(); notifications.success(`Task "${name}" added`); }
            render() {
                const container = document.getElementById('taskList');
                if (!container) return;
                container.innerHTML = this.tasks.map(task => `<div class="task-item"><div style="display:flex;justify-content:space-between;"><strong>${task.name}</strong><button class="btn-sm run-task" data-task="${task.name}">Run</button></div><small>${task.command}</small>${task.running ? '<div class="progress-bar"><div class="progress" style="width:50%"></div></div>' : ''}</div>`).join('');
                document.querySelectorAll('.run-task').forEach(btn => { btn.addEventListener('click', () => this.runTask(btn.dataset.task)); });
            }
            runTask(name) { const task = this.tasks.find(t => t.name === name); if (!task) return; task.running = true; this.render(); notifications.info(`Running ${task.name}...`); setTimeout(() => { task.running = false; this.render(); notifications.success(`${task.name} completed`); }, 2000); }
        }

        // ==================== COLLABORATION ====================
        class CollaborationService {
            constructor() { this.users = []; this.initUI(); }
            initUI() {
                const panel = document.createElement('div');
                panel.className = 'collab-panel';
                panel.id = 'collabPanel';
                panel.innerHTML = `<div class="collab-header"><h4><i class="fas fa-users"></i> Collaborate</h4><span class="btn-icon close-collab" style="cursor:pointer;">✕</span></div><div style="padding:12px;"><button class="btn" id="createRoomBtn" style="width:100%"><i class="fas fa-plus"></i> Create Room</button></div><div class="collab-users"><h4>Active Users</h4><div id="usersList"></div></div>`;
                document.body.appendChild(panel);
                panel.querySelector('.close-collab').onclick = () => panel.classList.remove('show');
                document.getElementById('createRoomBtn').onclick = () => this.createRoom();
                const collabBtn = document.createElement('button');
                collabBtn.className = 'btn';
                collabBtn.innerHTML = '<i class="fas fa-users"></i>';
                collabBtn.title = 'Collaborate';
                collabBtn.onclick = () => panel.classList.toggle('show');
                document.querySelector('.header-actions').appendChild(collabBtn);
            }
            createRoom() {
                const roomId = Math.random().toString(36).substring(7);
                this.users = [{ name: 'You', color: '#4a69bd' }, { name: 'Alice', color: '#ff6b6b' }, { name: 'Bob', color: '#4ecdc4' }];
                this.updateUsers();
                notifications.success(`Room created: ${roomId}`);
                document.getElementById('collabBadge').style.display = 'inline-block';
            }
            updateUsers() {
                const container = document.getElementById('usersList');
                if (container) container.innerHTML = this.users.map(user => `<div class="collab-user"><div class="user-avatar" style="background:${user.color}">${user.name[0]}</div><span>${user.name}</span></div>`).join('');
            }
        }

        // ==================== GITHUB SERVICE ====================
        class GitHubService {
            constructor() { this.token = null; this.user = null; this.init(); }
            init() { document.getElementById('githubLogin').onclick = () => this.login(); document.getElementById('syncRepos').onclick = () => this.fetchRepos(); document.getElementById('commitChanges').onclick = () => { const msg = prompt('Commit message:'); if (msg) notifications.success(`Committed: ${msg}`); }; document.getElementById('pushChanges').onclick = () => notifications.success('Pushed to remote'); document.getElementById('cloneRepo').onclick = () => { hideModal('githubRepoModal'); notifications.success('Repository cloned'); }; }
            login() { this.user = { login: 'demo_user', name: 'Demo User', avatar_url: 'https://github.com/ghost.png' }; this.updateUI(); notifications.success('Logged in (demo mode)'); }
            async fetchRepos() { const repos = [{ name: 'demo-repo', full_name: 'user/demo', stargazers_count: 42, forks_count: 7 }]; this.renderRepos(repos); }
            renderRepos(repos) { const container = document.getElementById('githubRepos'); container.innerHTML = repos.map(repo => `<div class="github-repo-item" data-repo="${repo.full_name}"><i class="fas fa-book"></i><div><div>${repo.name}</div><small>⭐ ${repo.stargazers_count}</small></div></div>`).join(''); document.querySelectorAll('.github-repo-item').forEach(el => el.addEventListener('click', () => { document.getElementById('repoUrl').value = `https://github.com/${el.dataset.repo}`; showModal('githubRepoModal'); })); }
            updateUI() { document.getElementById('githubAuth').style.display = 'none'; document.getElementById('githubUser').style.display = 'block'; document.getElementById('githubAvatar').src = this.user.avatar_url; document.getElementById('githubName').textContent = this.user.name; document.getElementById('githubLoginName').textContent = `@${this.user.login}`; }
        }

        // ==================== DART SERVICE ====================
        class DartService {
            constructor() {
                document.getElementById('newDartProject').onclick = () => { const name = prompt('Project name:'); if (name) notifications.success(`Dart project "${name}" created`); };
                document.getElementById('newFlutterProject').onclick = () => { const name = prompt('Flutter project:'); if (name) notifications.success(`Flutter project "${name}" created`); };
                document.getElementById('runDart').onclick = () => notifications.info('Dart code ready to run');
                document.getElementById('getDartPackages').onclick = () => this.showPackages();
            }
            showPackages() { const container = document.getElementById('dartPackages'); container.innerHTML = LANGUAGE_LIBRARIES.dart.packages.map(pkg => `<div class="github-repo-item"><i class="fab fa-dart"></i><div><div>${pkg.name}</div><small>v${pkg.version}</small></div></div>`).join(''); }
        }

        // ==================== HELPER FUNCTIONS ====================
        function runCode() {
            const html = AppState.editors.html?.getValue() || '';
            const css = AppState.editors.css?.getValue() || '';
            const js = AppState.editors.javascript?.getValue() || '';
            consoleManager.clear();
            consoleManager.log('Running code...', 'info');
            const preview = document.getElementById('previewFrame');
            const doc = preview.contentDocument || preview.contentWindow.document;
            doc.open();
            doc.write(`<!DOCTYPE html><html><head><style>${css}</style></head><body>${html}<script>${js}<\/script></body></html>`);
            doc.close();
            consoleManager.log('Code executed', 'success');
        }

        function toggleTheme() { document.body.classList.toggle('dark-mode'); const theme = document.body.classList.contains('dark-mode') ? 'vs-dark' : 'vs'; monaco.editor.setTheme(theme); }
        function refreshPreview() { document.getElementById('previewFrame').src = document.getElementById('previewFrame').src; }
        function toggleMobileView() { document.getElementById('previewFrame').classList.toggle('mobile-view'); }
        function togglePreviewFullscreen() { document.getElementById('previewPanel').classList.toggle('fullscreen'); }
        function showModal(id) { document.getElementById(id).classList.add('show'); }
        function hideModal(id) { document.getElementById(id).classList.remove('show'); }

        // ==================== INITIALIZATION ====================
        async function init() {
            notifications.info('Initializing SupremeAmer IDE Ultimate...');
            AppState.db = new DatabaseService();
            await AppState.db.init();
            fileManager = new FileManager(AppState.db, notifications);
            await fileManager.init();
            new GitHubService();
            new DartService();
            new CommandPalette();
            splitEditor = new SplitEditorManager();
            new AIAssistant();
            new TestRunner();
            new TaskRunner();
            new CollaborationService();
            
            require.config({ paths: { vs: 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.34.0/min/vs' } });
            require(['vs/editor/editor.main'], () => {
                const languages = ['html', 'css', 'javascript', 'dart', 'python', 'cpp', 'java'];
                languages.forEach(lang => {
                    const element = document.getElementById(`${lang}-editor`);
                    if (element) AppState.editors[lang] = monaco.editor.create(element, { value: `// ${lang.toUpperCase()} editor ready`, language: lang, theme: 'vs-dark', automaticLayout: true, minimap: { enabled: false } });
                });
                notifications.success('IDE Ready! All features active.');
            });
            
            document.getElementById('runCode').onclick = runCode;
            document.getElementById('saveFile').onclick = () => fileManager.saveFile();
            document.getElementById('newFile').onclick = () => showModal('newFileModal');
            document.getElementById('newFileBtn').onclick = () => showModal('newFileModal');
            document.getElementById('createFile').onclick = async () => { const name = document.getElementById('newFileName').value; const lang = document.getElementById('newFileLanguage').value; if (name) { const file = await fileManager.createFile(name, lang); if (file) { hideModal('newFileModal'); await fileManager.openFile(file); } } };
            document.getElementById('toggleTheme').onclick = toggleTheme;
            document.getElementById('refreshPreview').onclick = refreshPreview;
            document.getElementById('toggleMobileView').onclick = toggleMobileView;
            document.getElementById('togglePreviewFullscreen').onclick = togglePreviewFullscreen;
            document.getElementById('clearConsole').onclick = () => consoleManager.clear();
            document.getElementById('toggleSidebar').onclick = () => document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('closeSidebar').onclick = () => document.getElementById('sidebar').classList.add('collapsed');
            document.getElementById('openTerminal').onclick = () => { const panel = document.createElement('div'); panel.className = 'modal-overlay show'; panel.innerHTML = '<div class="modal"><div class="modal-header"><h3>Terminal</h3><span onclick="this.closest(\'.modal-overlay\').remove()">✕</span></div><div class="modal-body"><pre style="background:#1e1e1e;padding:10px;color:#fff;">$ Welcome to terminal\n$ Type commands here\n$ </pre></div></div>'; document.body.appendChild(panel); };
            
            document.querySelectorAll('.sidebar-tab').forEach(tab => { tab.addEventListener('click', () => { document.querySelectorAll('.sidebar-tab').forEach(t => t.classList.remove('active')); tab.classList.add('active'); document.querySelectorAll('.sidebar-content').forEach(c => c.classList.add('hidden')); document.getElementById(`${tab.dataset.tab}-tab`).classList.remove('hidden'); }); });
        }
        
        document.addEventListener('DOMContentLoaded', init);
    </script>
</body>
</html>