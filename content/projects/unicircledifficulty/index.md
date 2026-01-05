+++
title = 'UniCircleDifficulty'
date = 2017-11-17T18:16:19+11:00
tags = ["programming", "C#", "osu!", "pp"]
categories = ["projects"]
+++

{{< lead >}}
Let's build our own pp system, based on physics, not bandaids.
{{< /lead >}}

After the rise and fall of [PP+](../pp+/index.md), I had the drive to try my own hand at building a difficulty calculator.

There we're aspects of ppv2 and PP+ that I thought we're good, but in general I feel their philosophy of balance patches and tweaks was suboptimal. It's very likely the most _practical_ way to build a system people are mostly satisfied with, but I think under the surface there should be a way to develop a system based on physics and the core of what actually makes osu! maps difficult, rather than relying on balance patches in a reactive manner to overweighted and underweighted maps.

The way I think about it is similar to treating the disease, not the symptoms. ppv2 and PP+ treat the symptoms, but didn't address the underlying mechanics. ppv2 does it better these days, but it's still not great.

In addition to a difficulty and pp calculator, I also built a difficulty-aware score processor, which I still think is the most sensible way to do scoring, if the questions about recalculating upon algorithm changes could be solved.

{{< figure
  src="assets/visualiser.png"
  alt="Screenshot of the visualiser component"
  caption="2018-06-14: The visualiser component with FDFD loaded"
>}}

The systems weren't ready for real use and the numbers weren't balanced at all, but the philosophy was the main point of the project so I wrote an essay to explain the system and the philosophy behind it and [posted it](https://www.reddit.com/r/osugame/comments/82x1gp/osu_is_evolving_here_are_my_thoughts/) in February 2018.

The post got great feedback, and I wanted to continue with the project, but I got too busy with university and struggled to balance the difficulty calculator system in particular with the little time I had.

It's still one of my favourite projects and certainly one I'm very proud of. Someday I hope I get the time to revive it as a part of [osu!chan](../osuchan/index.md).

{{< github repo="Syriiin/UniCircleDifficulty" showThumbnail=false >}}
