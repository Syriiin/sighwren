+++
title = "Why is Nix working on bash but not zsh?"
date = 2026-01-08T11:22:06+11:00
draft = true
categories = [ "troubleshooting answers" ]
tags = [ "linux", "nix" ]
+++

# TL;DR

The Nix installation script only adds profile sourcing to shells that are installed at the time you install Nix.

The simplest and safest fix is to simply reinstall Nix.

Alternatively you can attempt to repair your installation by manually adding the profile sourcing lines yourself.

For this machine on Ubuntu 24.04 with the multi-user Nix installer, the lines were as follows in `/etc/zshrc` and `/etc/zsh/zshrc`:

```sh
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```

---

# Long version

> These were my searches while troubleshooting this issue:
>
> - "zsh: command not found: nix"
> - "home manager zsh add nix to path"
> - "home manager configure zsh but dont install"
> - "nix zsh not sourcing /etc/profile"
> - "nix command available in bash but not zsh"

I was setting up a new linux machine, when something unexpected happened.

I installed Nix, setup home-manager with a default home.nix and installed neovim in my home.nix. All was good.

Next I wanted to setup zsh, however even though zsh can be installed and configured with home-manager, I wanted it to be my default shell, which isn't cleanly done with home-manager, as `chsh` only works with shells in `/etc/shells`.

I installed zsh via apt, set it as my default and when I logged back in, I was shocked to see that the Nix commands were not being found by zsh. I checked my `PATH` and noticed the Nix directory was missing.

Some minutes later I found this block in the Nix installer:

```sh
added=
p=
p_sh=$NIX_LINK/etc/profile.d/nix.sh
p_fish=$NIX_LINK/etc/profile.d/nix.fish
if [ -z "$NIX_INSTALLER_NO_MODIFY_PROFILE" ]; then
    # Make the shell source nix.sh during login.
    for i in .bash_profile .bash_login .profile; do
        fn="$HOME/$i"
        if [ -w "$fn" ]; then
            if ! grep -q "$p_sh" "$fn"; then
                echo "modifying $fn..." >&2
                printf '\nif [ -e %s ]; then . %s; fi # added by Nix installer\n' "$p_sh" "$p_sh" >> "$fn"
            fi
            added=1
            p=${p_sh}
            break
        fi
    done
    for i in .zshenv .zshrc; do
        fn="$HOME/$i"
        if [ -w "$fn" ]; then
            if ! grep -q "$p_sh" "$fn"; then
                echo "modifying $fn..." >&2
                printf '\nif [ -e %s ]; then . %s; fi # added by Nix installer\n' "$p_sh" "$p_sh" >> "$fn"
            fi
            added=1
            p=${p_sh}
            break
        if [ -w "$fn" ]; then
            if ! grep -q "$p_sh" "$fn"; then
                echo "modifying $fn..." >&2
                printf '\nif [ -e %s ]; then . %s; fi # added by Nix installer\n' "$p_sh" "$p_sh" >> "$fn"
            fi
            added=1
            p=${p_sh}
            break
        fi
    done

    if [ -d "$HOME/.config/fish" ]; then
        fishdir=$HOME/.config/fish/conf.d
        if [ ! -d "$fishdir" ]; then
            mkdir -p "$fishdir"
        fi

        fn="$fishdir/nix.fish"
        echo "placing $fn..." >&2
        printf '\nif test -e %s; . %s; end # added by Nix installer\n' "$p_fish" "$p_fish" > "$fn"
        added=1
        p=${p_fish}
    fi
else
    p=${p_sh}
fi
```

It first checks if you have `.bash_profile`, `.bash_login` and `.profile` files and if so for each, adds lines to source the Nix profile. It then does the same for zsh and fish too.

Since at the time of Nix installation, I hadn't installed zsh yet, it didn't modify the profile, hence Nix was working in bash but not zsh.

To fix it, I simply reinstalled Nix, so that it would take me through the profile configuration again.

Alternatively you can manually add the profile sourcing lines to your shell's config files.

For this particular machine running Ubuntu 24.04 and the Nix standalone multi-user installer, these were the relevant sourcing lines:

```sh
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```
