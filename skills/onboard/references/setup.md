# Setup: get Lorekeep running

Share this with anyone starting from scratch, for example a teammate or a tester.

## Prerequisites

- A Claude account on a plan that includes Claude Code (Pro or Max, or API billing). The plugin
  does not provide this; each user needs their own.
- Claude Code, the CLI (installed below). Git is recommended for cloning.

## Install Claude Code

Windows PowerShell:

```
irm https://claude.ai/install.ps1 | iex
```

Windows CMD:

```
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

macOS, Linux, or WSL:

```
curl -fsSL https://claude.ai/install.sh | bash
```

Or, on any platform with Node installed:

```
npm install -g @anthropic-ai/claude-code@latest
```

Close and reopen the terminal so the PATH updates, then run `claude doctor` to confirm the
install.

## Get Lorekeep

```
git clone https://github.com/PIE-AI-cmd/lorekeep.git
claude --plugin-dir ./lorekeep
```

Point `--plugin-dir` at the folder that contains `.claude-plugin`. Do not clone a repo inside a
repo; keep the clone somewhere separate from your working folder.

## First run

In the session, say "onboard me" or "get started". Lorekeep sets up a vault and learns you.

Optional: set `LOREKEEP_VAULT` to your vault path so the hooks always find it.

```
PowerShell:  $env:LOREKEEP_VAULT = "C:\path\to\your-vault"
bash:        export LOREKEEP_VAULT="$HOME/your-vault"
```
