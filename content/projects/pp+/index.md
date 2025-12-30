+++
title = 'PP+'
date = 2017-02-08T03:35:00+11:00
tags = ["programming", "python", "django", "javascript", "jquery", "osu!", "pp"]
categories = ["projects"]
+++

![logo](./assets/logo.png)

{{< lead >}}
The first pp system improvement since ppv2.
{{< /lead >}}

_aka. PerformancePlus_

Since early 2016 the osu! community was getting pretty tired of the naive ppv2 system that resulted in a boring triangle jump dominated meta that had already been in place since ppv2 released in 2014.

In early 2017, [Drezi](https://osu.ppy.sh/users/3936645) and [DT-sama](https://osu.ppy.sh/users/3525018) started the PP+ project.
Drezi created an a new pp algorithm with more fine grained skill distinction than the comparatively simple ppv2.
Knowing me from [osu!chan classic](../osuchan-classic/index.md), Drezi and DT-sama invited me to join the team to build the website.

The core algorithm had already been written as a C# project with it's own SQLite DB so the web side effectively only needed to be an interface for the core.

After a couple months of work, we [released PP+](https://www.reddit.com/r/osugame/comments/64zjtp/introducing_performanceplus_pp/) and created a big stir in the community. On top of the new core pp algorithm, we also implemented a seasonal leaderboard system which was something new to osu! at the time.

{{< figure
  src="assets/season-leaderboard.png"
  alt="Screenshot of the season leaderboard page"
  caption="2018-06-04: The season leaderboard page from later in 2018"
>}}

Drezi continued to refine the algorithm over the next few months, but ultimately didn't want to open source his core algorithm, so when he stopped working on it the project eventually died out.

PP+ had already ignited a spark however and there was a lot of buzz around improving ppv2, so after PP+ development stopped, a massive number of contributors including myself ended up contributing to the pp algorithm in the fairly young osu!lazer project.

A few years later in 2020, I wanted to decommission the PP+ site as the core C# program was quite inefficient after years of stagnation and costed quite a lot to keep running, however there was still a fairly substantial user base, particularly among the Chinese osu! community.

Instead of decommissioning it outright, I planned to port the core algorithm to a modern difficulty calculator framework and integrate it into the new [osu!chan](../osuchan/index.md) project. Drezi agreed to let me port the closed source core into an open source version.

My open source port of the PP+ algorithm into the lazer engine can be found here: https://github.com/Syriiin/osu/tree/performanceplus

Although I did end up porting the core functionality of PP+ into osu!chan (which also lead to the creation of [difficalcy](../difficalcy/index.md)), instead of decommissioning the site entirely, I disabled the less used parts and moved the deployment to share a server with some of my other projects so it wouldn't cost so much.

I still do intend to decommission it eventually though!

{{< figure
  src="assets/profile-now.png"
  alt="Screenshot of the profile page"
  caption="2025-12-30: The profile page"
>}}

{{< figure
  src="assets/beatmap-now.png"
  alt="Screenshot of the beatmap page"
  caption="2025-12-30: The beatmap page"
>}}

Source: The code is sitting in a repo ready to made public after I check for any security issues.

<!-- {{< github repo="Syriiin/syrsite" showThumbnail=true >}} -->
