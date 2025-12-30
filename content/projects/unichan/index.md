+++
title = 'UniChan'
date = 2015-12-23T00:00:00+11:00
tags = ["programming", "python", "osu!", "discord", "chatbot"]
categories = ["projects"]
+++

UniChan was my first real project.

I had just started playing [osu!](https://osu.ppy.sh/) earlier in the year and Discord had also just launched a few months earlier.
There weren't many, if any, public and well known osu! discord bots at this time, so like most of my projects, UniChan was born out a desire to create something I wanted that didn't already exist.

I used IRC before discord and my friends had built IRC bots for our channels so I thought it was my turn to join the club.

I used the newly started [discord.py](https://discordpy.readthedocs.io/en/stable/) framework, played around with the [osu! API](https://github.com/ppy/osu-api/wiki) and later that day, UniChan was created!

{{<figure
  src="assets/stats-command.png"
  alt="A discord chat screenshot"
  caption="A screenshot of me testing UniChan's =stats command for the first time on 2015-12-23"
>}}

As this was my first real project, unsurprisingly the code is largely the result of hacking things together and seeing what worked. It's full of commented blocks (because obviously I didn't use source control!), mad ramblings, duplicated code and an almost intentional seeming lack of consistent formatting, almost all in one multi-thousand line `commands.py` file! We all started somewhere and should be able to look back and celebrate how far we've come.

{{<figure
  src="assets/mad-ramblings.png"
  alt="comment reading \"THIS BLOCK IS BROKEN AND I DONT KNOW WHY\""
  caption="Really takes me back..."
>}}


At her peak UniChan was added to over 500 discord servers.

To this day I still keep UniChan running for the few discord servers that still use her although most of her commands have been disabled at this point as discord's API changes have slowly broken her over time.

Source: The code is sitting in a repo ready to made public after I check for any security issues
