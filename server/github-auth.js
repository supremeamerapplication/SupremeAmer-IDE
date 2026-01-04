// server/github-auth.js
const express = require('express');
const cors = require('cors');
const axios = require('axios');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

// GitHub OAuth configuration
const GITHUB_CLIENT_ID = process.env.GITHUB_CLIENT_ID;
const GITHUB_CLIENT_SECRET = process.env.GITHUB_CLIENT_SECRET;
const GITHUB_REDIRECT_URI = process.env.GITHUB_REDIRECT_URI || 'http://localhost:3000/auth/github/callback';

// Exchange code for access token
app.post('/auth/github/token', async (req, res) => {
    try {
        const { code } = req.body;
        
        const response = await axios.post('https://github.com/login/oauth/access_token', {
            client_id: GITHUB_CLIENT_ID,
            client_secret: GITHUB_CLIENT_SECRET,
            code: code,
            redirect_uri: GITHUB_REDIRECT_URI
        }, {
            headers: {
                'Accept': 'application/json'
            }
        });
        
        if (response.data.error) {
            return res.status(400).json({
                error: response.data.error_description || 'Failed to get access token'
            });
        }
        
        res.json({
            access_token: response.data.access_token,
            token_type: response.data.token_type,
            scope: response.data.scope
        });
    } catch (error) {
        console.error('Token exchange error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Proxy GitHub API requests (to avoid CORS issues)
app.post('/api/github-proxy', async (req, res) => {
    try {
        const { endpoint, method = 'GET', data, token } = req.body;
        
        if (!token) {
            return res.status(401).json({ error: 'No access token provided' });
        }
        
        const response = await axios({
            method: method,
            url: `https://api.github.com${endpoint}`,
            headers: {
                'Authorization': `Bearer ${token}`,
                'Accept': 'application/vnd.github.v3+json',
                'Content-Type': 'application/json'
            },
            data: data
        });
        
        res.json(response.data);
    } catch (error) {
        console.error('GitHub API error:', error.response?.data || error.message);
        res.status(error.response?.status || 500).json({
            error: error.response?.data?.message || 'GitHub API error'
        });
    }
});

// Webhook endpoint for GitHub events
app.post('/webhooks/github', async (req, res) => {
    try {
        const event = req.headers['x-github-event'];
        const payload = req.body;
        
        console.log(`GitHub webhook received: ${event}`);
        
        // Handle different events
        switch (event) {
            case 'push':
                console.log(`Push to ${payload.repository.full_name} on branch ${payload.ref}`);
                // Handle push event
                break;
                
            case 'pull_request':
                console.log(`PR ${payload.action}: #${payload.pull_request.number} ${payload.pull_request.title}`);
                // Handle PR event
                break;
                
            case 'issues':
                console.log(`Issue ${payload.action}: #${payload.issue.number} ${payload.issue.title}`);
                // Handle issue event
                break;
        }
        
        res.status(200).send('OK');
    } catch (error) {
        console.error('Webhook error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`GitHub Auth Server running on port ${PORT}`);
});