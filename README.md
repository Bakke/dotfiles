# Bakke’s dotfiles
Mainly for Arch Linux desktop, but also works for Ubuntu servers.

## Install
```
# Clone repo
git clone https://github.com/Bakke/dotfiles.git ~/.dotfiles

# Run install script
~/.dotfiles/install.sh

# Rerun after changes (safe to repeat, only adds)
git -C ~/.dotfiles pull && ~/.dotfiles/install.sh

# Answers to the optional-groups questions are saved in
# ~/.config/dotfiles-install.conf; pass --ask to answer them again
~/.dotfiles/install.sh --ask
```

## Filen sync (Claude Code sessions, zsh history)
`filen-sync` keeps per-machine state in step between machines through the
Filen mount. Layout: `~/Filen/sync/<thing>/hosts/<host-id>/`. Each host mirrors
its own data into its host folder and pulls from the others. If `~/Filen` is
not mounted the run is a no-op.

- `claude`: `~/.claude/{projects,file-history}` (newest file wins, missing files
  created) and `history.jsonl` (union, ordered by timestamp). Sessions, per-project
  memory, file history for /rewind and prompt history.
- `zsh`: `~/.zsh_history`, which needs `EXTENDED_HISTORY` (set in `system/env`).
  The result is the union of all hosts ordered by timestamp, minus entries any
  host has deleted since the previous run, capped to the newest `SAVEHIST`
  entries (read from `system/env`, override with `FILEN_SYNC_ZSH_KEEP`). Deleting
  a line from the file on one machine removes it everywhere on the next sync;
  zsh trimming the file counts as deleting. The last-seen copy of each file
  lives in `~/.local/state/filen-sync/zsh/`. Running shells see entries newer
  than their own through `SHARE_HISTORY`; older merged entries show up in new
  shells. Entries written before `EXTENDED_HISTORY` was on have no timestamp
  and sort first, so they are the first to age out.

Files: `scripts/filen-sync`, `config/systemd/user/filen-sync.{service,timer}`,
`install/common/filen-sync.sh` (installer, also offered by `install/arch.sh`).

```
# Set up on a machine (idempotent; host ids must differ between machines,
# default is hostname + part of /etc/machine-id)
~/.dotfiles/install/common/filen-sync.sh [host-id] [--no-hooks]

filen-sync --now [module...]                # manual run, e.g. `filen-sync --now zsh`
journalctl --user -u filen-sync -n 50       # logs
```

The installer symlinks the script and units, enables a 2 min timer, and adds
`Stop`/`SessionEnd` hooks to `~/.claude/settings.json` that kick the service
(backup in `settings.json.pre-filen-sync.bak`). Config overrides go in
`~/.config/filen-sync.conf` (`FILEN_SYNC_HOST_ID`, `FILEN_SYNC_MODULES`,
`FILEN_SYNC_MOUNT`, ...). Requires the same username and project paths on both
machines, a systemd user instance, rsync and jq.

## Atlassian MCP (Bitbucket PRs for Claude Code)
Claude Code opens Bitbucket PRs and reads pipeline logs through the Atlassian
Rovo MCP server (`https://mcp.atlassian.com/v2/mcp`). Merge is denied and other
writes go through an allowlist hook that permits only PR creation, comments and
tasks. The hook also requires new PRs to close the source branch after merge.
Approve, request changes, commits, branches and pipeline runs stay manual.

Files: `scripts/atlassian-mcp-headers` (auth header from the keyring),
`config/claude/hooks/atlassian-write-allowlist`, `install/common/atlassian-mcp.sh`
(installer, run by `install/arch.sh` on full installs).

**Once per organization (org admin):** in admin.atlassian.com, check that the
Bitbucket workspace is linked to the organization, then enable API token
authentication under Rovo → Rovo MCP Server. This applies to all users. If the
org has an IP allowlist, it also applies to MCP calls made with API tokens.

**Per user and machine:**
1. Create a token at
   `https://id.atlassian.com/manage-profile/security/api-tokens?autofillToken&expiryDays=max&appId=mcp-v2&selectedScopes=all`.
   That link preselects every product. Untick all scopes except
   `read:bitbucket:agent-interface` and `write:bitbucket:agent-interface`.
   Note the expiry date. The token is shown only once.
2. Store it as `email:token` in the keyring:
   ```
   secret-tool store --label 'Atlassian MCP' service atlassian-mcp
   ```
3. Run the installer, then check the connection:
   ```
   ~/.dotfiles/install/common/atlassian-mcp.sh
   claude mcp get atlassian                    # Status: Connected
   ```

The installer registers the server at user scope in `~/.claude.json`. It also
adds the `executeDestructive` deny rule and the hook to `~/.claude/settings.json`
(backup in `settings.json.pre-atlassian-mcp.bak`). Changes apply to new sessions.

To rotate the token, create a new one, rerun step 2 (it overwrites the entry),
then revoke the old token.

If the server connects but `discover` finds no Bitbucket operations, the token
has classic Bitbucket scopes instead of the agent-interface ones above, and
needs to be recreated.

# Update submodules
```
git submodule update --remote
```

### Temp fix for e1000e suspend issue
https://bbs.archlinux.org/viewtopic.php?id=298146

```
sudo rmmod e1000e # To disable ethernet card
sudo modprobe e1000e # To enable ethernet card
```

Or blacklist the module
```
echo "blacklist e1000e" | sudo tee /etc/modprobe.d/e1000e.conf
```

### MacBook Pro 2012 WiFi fix

```
yay -S broadcom-wl
sudo modprobe -r wl
sudo modprobe wl
```
