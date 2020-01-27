+++
title = "Python asyncio example"
description = ""
tags = [
    "python",
    "async",
]
date = "2020-01-26"
categories = [
    "Python",
]
menu = "main"
+++

A simple python asyncio example which fetches urls concurrently.

```python
import asyncio
import aiohttp


async def fetch(url):
    print(f'Fetching {url}')
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return {
                'url': url,
                'status': response.status,
            }

# Get a reference to the event loop
loop = asyncio.get_event_loop()

requests = [fetch("https://github.com"),
            fetch("https://google.com"),
            fetch("http://httpbin.org/uuid"),
            fetch("http://httpbin.org/uuid")]

# Run the batch
responses = loop.run_until_complete(asyncio.gather(*requests))

# Examine responses
for resp in responses:
    print(resp)

```
