+++
title = "difficalcy"
date = 2020-10-01T13:23:55+10:00
tags = ["programming", "C#", "osu!", "pp"]
categories = ["projects"]
+++

{{< lead >}}
Yea [oppai](https://github.com/Francesco149/oppai) is great, but have you tried lazers?
{{< /lead >}}

# Overview

Difficalcy is a simple HTTP API interface for the official osu! difficulty calculators.

Run the server:

```sh
docker run -p 5000:80 ghcr.io/syriiin/difficalcy-osu:latest
```

Call the API:

```sh
curl "localhost:5000/api/calculation?BeatmapId=658127"
```

Get your lazer powered calculations:

```json
{
  "accuracy": 1,
  "combo": 2402,
  "difficulty": {
    "aim": 3.486559350583331,
    "speed": 3.401805899214971,
    "flashlight": 0,
    "total": 7.218144469196162
  },
  "performance": {
    "aim": 223.2319016752279,
    "speed": 216.94931341785514,
    "accuracy": 142.3199671239901,
    "flashlight": 0,
    "total": 607.3436935784534
  }
}
```

# History and motivation

ppv2 was [open sourced](https://github.com/ppy/osu-performance/commit/32c3ad349c20757e154196e23c4a5fb579e0fdec) in April of 2016 and a few days later [Francesco149](https://github.com/Francesco149) created [oppai](https://github.com/Francesco149/oppai), a port of the algorithm into a simple C++ binary, which made it easy to integrate ppv2 calculations into projects.

Later that year, I developed one of [UniChan](../unichan/index.md)'s core features, the `=nochoke` command, that detected and "unchoked" scores, calculating a theoretical total pp for a player if they never choked scores. But this was fundamentally different from most of UniChan's other features in that it required actually calculating pp for new scores, rather than fetching the pp values from the osu! API. Interfacing with the oppai calculator is what made this possible.

Later, when I ported this functionality to [osu!chan classic](../osuchan-classic/index.md) (and later [osu!chan](../osuchan/index.md)), oppai (and later [oppai-ng](https://github.com/Francesco149/oppai-ng)) was used also.

This was great for a while, as ppv2 hardly ever got updated in these days, however once ppv2 updates became larger and more frequent, oppai started to lag behind, which meant UniChan and osu!chan lagged behind also. Additionally, oppai only ever supported the osu! standard game mode which meant that much of osu!chan's more interesting features we're unavailable for taiko, catch and mania.

By 2020, the ppv2 difficulty and performance calculators had been ported to [osu!lazer](https://github.com/ppy/osu) and were soon to become the official calculation engine, and I had decided to port the [PP+](../pp+/index.md) algorithm to the lazer engine in order to open source it.

It was this perfect storm of oppai's update lag, lazer becoming the official engine, and my project to port the PP+ algorithm into lazer that made me want to develop a project to make interfacing with the lazer difficulty calculators as easy as oppai.

[osu-tools](https://github.com/ppy/osu-tools) also existed and provided an experience similar to oppai, however the overhead of instantiating the .NET objects on every invocation made the performance unsuitable for a project like osu!chan that would be recalculating millions of scores when an update occurred.

I decided the most optimal way to make it work would be to create an ASP.NET API as an interface for the difficulty and performance calculators to allow for subsequent requests to reuse resources would be the most reasonable way to balance efficiency and usability. So difficalcy was born.

I also wanted difficalcy to be modular so that I could include the four main osu! game modes in the main package, but also allow 3rd party plugins for other calculators, like PP+ or alternate lazer rulesets, to be loaded dynamically with API endpoints generated at runtime. The result of this attempt was [difficalcy-reflection](https://github.com/Syriiin/difficalcy-reflection) and [difficalcy-performanceplus-plugin](https://github.com/Syriiin/difficalcy-performanceplus-plugin).

{{< github repo="Syriiin/difficalcy-reflection" showThumbnail=false >}}
{{< github repo="Syriiin/difficalcy-performanceplus-plugin" showThumbnail=false >}}

While I did manage to get it to work eventually, it was an absolute pain to develop due to the reflection black magic necessary to get all the assemblies to work correctly together and share resources, and as soon as you had two plugins compiled from different (but theoretically compatible!) versions of the osu! lazer core libraries, the whole thing would explode with nonsense errors.

I decided to scrap this architecture and instead let each ruleset be it's own binary, and simply share a library for the common core. This architecture was much simpler to develop and maintain, at the cost of a bit of overhead in running multiple servers instead of a single one.

I lost motivation for this project several times after the failure of the initial architecture, and ended up not completing it until April of 2024 when I [released v0.1.0](https://github.com/Syriiin/difficalcy/releases/tag/v0.1.0). Since it's release and integration into osu!chan however, it has been rock solid and has powered osu!chan's difficulty and performance calculations since, allowing for pp updates to be released at the same time as they are released for the main osu! servers. Additionally it allowed me to seamlessly integrate PP+ into osu!chan using the new open source port of the original closed source algorithm.

{{< github repo="Syriiin/difficalcy" showThumbnail=false >}}
{{< github repo="Syriiin/difficalcy-performanceplus" showThumbnail=false >}}
