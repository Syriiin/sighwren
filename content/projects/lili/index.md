+++
title = 'lili'
date = 2021-08-02T22:00:55+10:00
tags = ["programming", "golang", "typescript", "react"]
categories = ["projects"]
+++

{{< lead >}}
Using a notes app off the shelf? Pfft I'll make my own!
{{< /lead >}}

I used to have a really terrible habit. I would keep a simple text file called `NOTES` uncommitted in my project repos.
I wouldn't commit it because it was effectively a raw stream of my consciousness in text form as I would have conversations with myself and play with ideas.
I never liked traditional note apps since I really liked the feel of a raw text file.

I always knew it was a foolish idea to keep these files on my PC without any backups, but I had never lost a hard drive before so I obviously thought it would never happen to me... and of course, it then did.

My PCs main data drive started to fail and before I could get everything off it, it quickly became unusable.
After days of effort I managed to recover most of my `NOTES` files using the [TestDisk](https://www.cgsecurity.org/wiki/TestDisk) recovery toolkit, and vowed to never do something so foolish again. So instead of keeping my notes on my local disk without backups, I moved them to a _cloud provider's_ disks... without backups!

My brazen defiance of the most basic rules of data preservation aside, this did make me want to create an application to store these notes in way that was slightly more resilient than my local disk. I also wanted to learn golang at the time, so I thought this would be a fun little project to accomplish both goals.

A couple days later and lili was complete! A simple SPA with a simple goal.

The backend was a simple golang webserver that was really just CRUD for a "notes" table plus some authentication, and the frontend was a simple react app that embedded the [monaco editor](https://github.com/microsoft/monaco-editor) for the vscode-like feel I like about my `NOTES` files.

{{< figure
  src="assets/lili.png"
  alt="Screenshot of lili"
  caption="2025-12-31: A screenshot of the current lili.syrin.me application"
>}}

Despite it being the simplest project I ever created, I probably used it more than any other over the years. I created it in 2021 and used it as my main note app for everything from project notes to DnD characters to TODO lists until I switched to obsidian in early 2025.

{{< github repo="Syriiin/lili" showThumbnail=false >}}
{{< github repo="Syriiin/liliview" showThumbnail=false >}}
