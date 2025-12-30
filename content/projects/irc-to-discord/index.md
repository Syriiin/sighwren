+++
title = 'irc-to-discord'
date = 2016-12-31T00:55:16+11:00
tags = ["programming", "python", "IRC", "chatbot"]
categories = ["projects"]
+++

{{< lead >}}
Okay let's learn to read RFCs.
{{< /lead >}}

irc-to-discord is a chat relay service that bridges IRC and discord channels.

I created irc-to-discord mainly for the [ModDota](https://moddota.com/) community as at the time we were in the middle of transitioning from IRC to discord, and still had many members split between each.

I had written some basic IRC bot code before but never finished any real projects. irc-to-discord was my first time implementing a full IRC bot client and integrating it with a discord bot was a fun challenge.

One of the most important features of irc-to-discord was it's ability to translate text formatting between the platforms. Discord uses markdown while IRC uses control character codes.

Relaying from IRC to discord is relatively straightforward, since discord has much more flexibility in it's message content. The only concessions to make are stripping the formatting that isn't support by discord, like text or background colouring.

Relaying discord messages to IRC is much more challenging however. In addition to formatting, discord allows much larger messages sizes, as well as embedded images and file uploads, so these needed to be converted to an IRC compatible format also; usually in the form of links.

{{< figure
  src="assets/discord.png"
  alt="Screenshot of discord message with lots of markdown formatting"
  caption="2025-12-30: The profile page"
>}}

{{< figure
  src="assets/irc.png"
  alt="Screenshot of the relayed IRC message"
  caption="2025-12-30: The beatmap page"
>}}

The formatting translation was certainly the most difficult part of the project and it definitely had it's bugs in particularly heavily formatted messages. I had planned to replace the regex based translation engine with a lexical analysis engine to create an formatting syntax tree, but before I got around to implementing it, all the users of irc-to-discord had migrated to discord natively, so there was no need anymore and the project was retired.

{{< github repo="Syriiin/irc-to-discord" showThumbnail=true >}}
