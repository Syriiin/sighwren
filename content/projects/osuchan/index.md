+++
title = 'osu!chan'
date = 2019-04-10T15:42:28+10:00
tags = ["programming", "python", "django", "typescript", "postgresql", "react", "ansible", "docker", "osu!"]
categories = ["projects"]
+++

{{< lead >}}
A full rewrite is in order!
{{< /lead >}}

https://osuchan.syrin.me

# Overview

osu!chan is a stats site for the rhythm game osu! that provides players a unique look at their play style and history, while also providing alternate ways to enjoy the game with the custom leaderboard system.

osu!chan is also used to power various systems of osu! events such as [COE](https://cavoe.events/), [osu!Sweden LAN](https://osu.ppy.sh/community/forums/topics/2075895), and others. osu!chan powers the event leaderboards for these events as well as a handful of stage shows at COE such as the "mrekk vs COE" pp race and others.

{{< figure
  src="assets/profile.png"
  alt="Screenshot of the profile page"
  caption="2026-01-05: The profile page"
>}}

{{< figure
  src="assets/score.png"
  alt="Screenshot of the score detail view"
  caption="2026-01-05: The score detail view"
>}}

{{< figure
  src="assets/coe.png"
  alt="Screenshot of the COE 2025 leaderboard"
  caption="2026-01-05: The leaderboard page for COE 2025"
>}}

# Technology

The core application is a Python Django REST API backed by a PostgreSQL DB, with a TypeScript React SPA frontend.

The system runs on containers inside a VPS that is managed and deployed to via Ansible in a closed source pipeline for security purposes.

# History

osu!chan is a full rewrite of [osu!chan classic](../osuchan-classic/index.md) into a standalone Django project incorporating all my learnings from the first few years of learning programming.

Along with cleaning up the code architecture and performance _immensely_, I also built a fully new React SPA frontend, experimenting with a few different design systems before deciding to build one from the ground up using [styled-components](https://styled-components.com/).

osu!chan has continued to be my main ongoing project, being worked on semi-regularly over the years. There have been periodic breaks, to work on other projects to support osu!chan, such as [difficalcy](../difficalcy/index.md) or upstream contributions to osu! itself, but in the end osu!chan is my home base.

Several new features were added over time including the profile sandbox, custom leaderboards and PP+ integration, as well as a whole host of backend improvements that unlock the potential for many features that now only require time to implement.

After the years of backend improvements, the React frontend has certainly fallen behind, both in terms of the wider JavaScript ecosystem patterns/tech but also in ease of maintainability compared to the backend, so I plan to soon rewrite a new frontend with a design overhaul as well.

{{< github repo="Syriiin/osuchan-backend" showThumbnail=false >}}
{{< github repo="Syriiin/osuchan-frontend" showThumbnail=false >}}
