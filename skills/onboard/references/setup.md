# Setup: get Lorekeep running

Share this with anyone starting from scratch, for example a teammate or a tester. There are two
ways to run Lorekeep: the Claude Code CLI, or the Cowork desktop app. Pick one.

## Prerequisites

- A Claude account on a plan that includes Claude Code or Cowork. The plugin does not provide
  this; each user needs their own.
- Git is recommended, so the vault can be version controlled and backed up.

## Path A: Claude Code (CLI)

Install Claude Code.

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

Close and reopen the terminal so the PATH updates, then run `claude doctor` to confirm. Then get
Lorekeep:

```
git clone https://github.com/PIE-AI-cmd/lorekeep.git
claude --plugin-dir ./lorekeep
```

Point `--plugin-dir` at the folder that contains `.claude-plugin`. Do not clone a repo inside a
repo; keep the clone separate from your working folder.

## Path B: Cowork (desktop app)

Install or update the Claude desktop app and sign in. Install the Lorekeep plugin, then connect
the folder that holds your vault: open settings, enable computer use or folder access, and select
the folder. Grant read and write.

## Connect your computer, the bridge

Either path, Lorekeep must reach your real vault folder before it can help. Once connected it
verifies the link:

- Reads `CLAUDE.md` and confirms the top-level folders.
- Checks the git remote is reachable, and reports any uncommitted changes before the first sync,
  so nothing is lost on a fresh clone or pull.

It adapts to the state it finds: no bridge yet, bridge on but no vault selected, vault selected
but git not configured, or fully connected. Each state gets one clear next action.

Second machine: if you are adding a laptop to an existing setup, clone or pull the vault rather
than scaffolding a new one.

Fallback: on mobile, or with the desktop app closed, there is no bridge. Lorekeep can still
discuss and draft against a cloud mirror, but it cannot write back or push until you connect.

## First run

In the session, say "onboard me" or "get started". Lorekeep connects to your vault, sets it up if
needed, and learns you.

Optional (Claude Code): set `LOREKEEP_VAULT` to your vault path so the hooks always find it.

```
PowerShell:  $env:LOREKEEP_VAULT = "C:\path\to\your-vault"
bash:        export LOREKEEP_VAULT="$HOME/your-vault"
```
