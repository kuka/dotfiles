#!/bin/bash
#basic newsboat bookmark plugin for instapaper

username="kuanysh@me.com"
password="8hKgjLzJ2FuUR9n2pzdb9YnW2MiyRkdNjTPhokqckQ9833sgAw"
url="$1"
title="$2"
description="$3"
feed_title="$4"

# content="${url}"$'\n'"${description}"$'\n'"${feed_title}"

curl https://www.instapaper.com/api/add\?username=$username\&password\=$password\&url\=$url\&title\=\"${title}\"
