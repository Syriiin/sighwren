+++
title = 'iceblock'
date = 2023-02-11T23:31:02+11:00
tags = ["programming", "python", "golang", "terraform", "packer", "minecraft", "cloud", "infra-as-code"]
categories = ["projects"]
+++

{{< lead >}}
Minecraft meets cloud automation.
{{< /lead >}}

# Overview

iceblock is a Minecraft server you can put on ice.

It is designed to be a budget friendly server stack that spins down when idle and spins up when players wish to connect to save on idle compute cost.

It runs on Azure Spot VMs and Azure function apps to keep running costs low.

# Motivation

In 2023 my friends and I had our biyearly spark of motivation to play a Minecraft world together again.

However I've learned from the past how these things go and knew it would probably fizzle out gradually over a few months and didn't want to be stuck paying the bill for an always-on server that only gets used 3 out of 730 hours in the month.

In the past I or one of my friends had simply hosted the server on our PC, but then I would need to keep my PC on 24/7, as I hadn't set up my home lab yet. Even worse!

Hence the server had the following requirements:

1. Low cost, especially when idle
2. Available for players 24/7, although short interrupts are acceptable
3. Full access to server management to install plugins and such

For the previous couple years I had been doing cloud infrastructure and automation at my company, so I did some thinking and came up with an architecture I called "iceblock; a minecraft server you can put on ice".

In other words, it has a super low idle cost, at the expense of a short cold start period. Much like cloud serverless function architectures.

Of course the challenge here is that Minecraft servers are game servers that are stateful and need to be online for players to connect. It's not like http handlers which can scale up and down in an instant. So how do we make the server "available" without having it actually running?

# Architecture

At a high level the iceblock architecture is an Azure VM that hosts a Minecraft server and is spun up and down by a controller application according to defined rules.

Let's look at the details.

All the infrastructure to run iceblock runs in Azure and is provisioned with [Terraform](https://developer.hashicorp.com/terraform), so it's a single command to deploy the ensure stack.

The Azure VM runs on a spot instance with an image baked by [Packer](https://developer.hashicorp.com/packer) to include the "bootstrapper" which is executed on boot as a systemd service.

The bootstrapper is a golang application which subprocesses the Minecraft Java server binary and communicates with it via local RCON. It does a number of things including:

- bootstrapping the Minecraft server itself according to a config
- taking automatic server backups and shipping them to Azure blob store
- listens to spot instance eviction events and ensures safe stopping

The server and bootstrapper satisfy the "full access to server management" and "available 24/7" criteria, but the main requirement of low cost still needs to be addressed. This is what the "controller" does.

The controller is a python Azure function app. It is primarily a Discord bot that uses the [HTTP interactions API](https://discord.com/developers/docs/interactions/overview#preparing-for-interactions) so it doesn't require a running server. The bot implements 3 commands:

- `/status` to display if the server is online, and if so, the current player count
- `/start` to start the Azure VM if it isn't currently online
- `/stop` to stop the Azure VM, if there are no players online

These commands use the Minecraft [Server List Ping protocol](https://minecraft.wiki/w/Java_Edition_protocol/Server_List_Ping) to query player counts and the Azure API to start/stop the VM.

Additionally, the function app includes a 15 minute timer that will periodically check if the server is empty, and if so, stop it. Hence satisfying our final low idle cost requirement.

{{< figure
  src="assets/discord.png"
  alt="Screenshot of the controller usage in Discord"
  caption="A screenshot of the controller in use in Discord"
>}}

Source: The code is sitting in a repo ready to be made public after I check for any security issues.

<!-- {{< github repo="Syriiin/iceblock" showThumbnail=true >}} -->
