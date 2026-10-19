# revolver

Switch DNS resolvers at random.

## Usage

```shell
revolver <command> [args] [options]
```

### Commands

- `init` — Generate a sample resolvers data file.
- `list [name]` — List all resolvers, or one named.
- `spin` — Select a random resolver, without switching to it.
- `status` — Show the current DNS configuration.
- `switch [name]` — Switch to a random resolver, or to one named.

### Options

- `-d`, `--data`, `--data_file`, `--data_filepath`, `--resolvers_data_filepath` — a filepath to a resolvers JSON file. Defaults to `~/.config/revolver/resolvers.json`.
- `-f`, `--format FORMAT` — `console` (the default) or `json`. Applies to `list`, `spin` and `status`.
- `-v`, `--version` — show the version.

## Resolvers

The resolvers are built in as `Revolver::RESOLVERS`, and `init` writes them out as a JSON file to edit. A data file, once there, is read in place of the built-in list.

## VPN

`status` reports the DNS actually in use rather than the configured one where a VPN is up, reading the servers out of the active WireGuard configuration.

## Running it unattended

Switching a resolver calls `networksetup`, which wants a password. For automated execution, either an entry in `/etc/sudoers`:

```
thoran ALL = NOPASSWD: /usr/sbin/networksetup
```

or the same in a file at `/etc/sudoers.d/mercurial`, alongside the entries mercurial wants — see mercurial for those.
