# MCP Setup Guide

Model Context Protocol (MCP) allows AI agents to connect to external tools and services. This guide covers common integrations for product teams.

---

## What is MCP?

MCP is an open protocol that lets AI agents interact with external tools like:
- Design tools (Figma)
- Project management (Jira, Linear)
- Communication (Gmail, Slack)
- Documentation (Notion, Google Docs)

**Benefits:**
- Access real-time data from your tools
- Take actions (create issues, send emails)
- Keep context across conversations

---

## Before You Start

MCP setup varies by agent platform:

| Platform | MCP Support | Configuration |
|----------|-------------|---------------|
| Claude Code | ✅ Native | Settings → Integrations |
| Cursor | ✅ Via extensions | Settings → MCP |
| Augment Code | ✅ Native | MCP config file |
| Codex | 🔄 Varies | Check docs |

---

## Figma Integration

### What it enables

- Read design files and components
- Extract design tokens
- Understand component structure

### Setup

1. **Get Figma API token:**
   - Go to Figma → Settings → Personal Access Tokens
   - Create new token with read access

2. **Configure MCP:**
   ```json
   {
     "mcpServers": {
       "figma": {
         "command": "npx",
         "args": ["-y", "@anthropic/mcp-server-figma"],
         "env": {
           "FIGMA_ACCESS_TOKEN": "your-token-here"
         }
       }
     }
   }
   ```

3. **Test:** Ask your agent "What components are in my Figma file [URL]?"

---

## Jira/Linear Integration

### What it enables

- Read and create issues
- Update issue status
- Search across projects

### Jira Setup

1. **Get API token:**
   - Atlassian → Account Settings → Security → API tokens

2. **Configure MCP:**
   ```json
   {
     "mcpServers": {
       "jira": {
         "command": "npx",
         "args": ["-y", "@anthropic/mcp-server-jira"],
         "env": {
           "JIRA_URL": "https://your-domain.atlassian.net",
           "JIRA_EMAIL": "your-email@company.com",
           "JIRA_API_TOKEN": "your-token"
         }
       }
     }
   }
   ```

### Linear Setup

1. **Get API key:**
   - Linear → Settings → API → Personal API keys

2. **Configure MCP:**
   ```json
   {
     "mcpServers": {
       "linear": {
         "command": "npx",
         "args": ["-y", "@anthropic/mcp-server-linear"],
         "env": {
           "LINEAR_API_KEY": "your-api-key"
         }
       }
     }
   }
   ```

---

## Gmail Integration

### What it enables

- Read and search emails
- Draft and send emails
- Manage labels

### Setup

1. **Enable Gmail API:**
   - Go to Google Cloud Console
   - Create project or select existing
   - Enable Gmail API
   - Create OAuth credentials

2. **Configure MCP:**
   ```json
   {
     "mcpServers": {
       "gmail": {
         "command": "npx",
         "args": ["-y", "@anthropic/mcp-server-gmail"],
         "env": {
           "GOOGLE_CLIENT_ID": "your-client-id",
           "GOOGLE_CLIENT_SECRET": "your-client-secret"
         }
       }
     }
   }
   ```

3. **Authorize:** First run will prompt OAuth flow

---

## Google Calendar Integration

### What it enables

- View calendar events
- Create/update events
- Check availability

### Setup

1. **Enable Calendar API:**
   - Same Google Cloud project as Gmail
   - Enable Google Calendar API

2. **Configure MCP:**
   ```json
   {
     "mcpServers": {
       "calendar": {
         "command": "npx",
         "args": ["-y", "@anthropic/mcp-server-google-calendar"],
         "env": {
           "GOOGLE_CLIENT_ID": "your-client-id",
           "GOOGLE_CLIENT_SECRET": "your-client-secret"
         }
       }
     }
   }
   ```

---

## Troubleshooting

### Common Issues

**"MCP server not found"**
- Ensure Node.js is installed
- Run `npx -y @anthropic/mcp-server-[name]` manually to test

**"Authentication failed"**
- Check API tokens are correct
- Verify token permissions
- Regenerate token if expired

**"Connection timeout"**
- Check network connectivity
- Verify service URLs are correct

### Testing Your Setup

Ask your agent:
- "List my recent Figma files"
- "Show my open Jira tickets"
- "What's on my calendar today?"

---

## Security Notes

⚠️ **Important:**

- Never commit API tokens to version control
- Use environment variables for secrets
- Regularly rotate API tokens
- Review token permissions (use minimal access)

---

## Resources

- [MCP Documentation](https://modelcontextprotocol.io/)
- [Anthropic MCP Servers](https://github.com/anthropics/mcp-servers)
- [MCP Community Servers](https://github.com/modelcontextprotocol/servers)
