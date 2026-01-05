+++
title = 'owc-calendar-helper'
date = 2024-11-07T22:29:46+11:00
tags = ["programming", "python", "osu!"]
categories = ["projects"]
+++

{{< lead >}}
Because I'd rather spend 2 hours automating something than 20 minutes doing it by hand.
{{< /lead >}}

I jest, but this project is actually one of the rare situations where I saved myself significant time by automating this process.

I'm an avid watcher of [OWC](https://osu.ppy.sh/wiki/en/Tournaments/OWC), and Team Australia in particular, but the constant last minute rescheduling of matches is an absolute pain to keep on top of, especially when trying to keep the calendar events also updated in my own calendar.

owc-calendar-helper is a straightforward script that simply pulls the current week's match schedules from the wiki and creates a well formed `.ics` file of all the matches to import into calendar applications.

{{< figure
  src="assets/home.png"
  alt="Screenshot of the home page"
  caption="2026-01-02: A screenshot of the current owc.syrin.me homepage"
>}}

{{< github repo="Syriiin/owc-calendar-helper" showThumbnail=false >}}
