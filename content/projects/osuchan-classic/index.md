+++
title = 'osu!chan classic'
date = 2016-12-10T15:21:30+11:00
tags = ["programming", "python", "django", "javascript", "jquery", "osu!"]
categories = ["projects"]
+++

![logo](./assets/logo.png)

{{< lead >}}
The start of my main project going forwards.
{{< /lead >}}

osu!chan classic is the initial version of osu!chan I developed inside [syrsite](../syrsite/index.md).

Originally hosted at https://syrin.me/osuchan, now https://old.syrin.me/osuchan.

At this time [UniChan](../unichan/index.md) had grown to have some pretty useful and interesting commands to do things like extrapolating scores with filters and detecting/fixing chokes to create some cool "what if" statistics for osu! players. However as a discord bot, there was only so much that could be done in terms of UX so I wanted to create a website which would provide a much better experience.

I sketched out a few page layouts and threw together some styles over the christmas holidays in hopes to release it before school started back up.

{{< figure
  src="assets/nochoke-sketch.png"
  alt="Sketch of the nochoke page layout"
  caption="2016-12-09: A sketch of my planned layout for the nochoke page"
>}}

{{< figure
  src="assets/topranks-draft.png"
  alt="Screenshot of the top ranks page in dev"
  caption="2016-12-12: The top ranks page during development"
>}}

I [released osu!chan](https://www.reddit.com/r/osugame/comments/5mg09u/hey_guys_i_made_a_site_for_some_neat_osu_stats/) just under a month later with all the features from UniChan as well as a few new ones, and after the initial reddit hug of death was over and the site stopped crashing due to it's wildly unoptimised code running on a tiny VPS instance, I gradually added new features.

{{< figure
  src="assets/profile.png"
  alt="Screenshot of the profile page"
  caption="2017-01-12: The profile page after the initial design changes"
>}}

{{< figure
  src="assets/topranks.png"
  alt="Screenshot of the top ranks page"
  caption="2017-02-22: The top ranks page after the further design changes and new feature additions"
>}}

It always amazes me to think that back then, without any experience in web dev, I was able to take a project from idea to release in less than a month. It took a combination of not being a perfectionist (because I didn't know what perfect looked like yet!) and having a drive to get it released before the school holidays were over!

I'm not sure how much longer I plan to keep the classic version running for since the successor [osu!chan](../osuchan/index.md) project has been live since 2019.

{{< figure
  src="assets/profile-now.png"
  alt="Screenshot of the profile page"
  caption="2025-12-30: The profile page now at the end of 2025"
>}}

Source: The code is sitting in a repo ready to be made public after I check for any security issues

<!-- {{< github repo="Syriiin/syrsite" showThumbnail=false >}} -->
