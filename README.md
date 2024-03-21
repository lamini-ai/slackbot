# To create your own bot
* Go to https://api.slack.com/apps?new_app=1
* Choose "From an app manifest" and select "Lamini"
* Give it a name and set `"socket_mode_enabled"` to be `true`
* Under "OAuth & Permissions", add the following scopes: `app_mentions:read`, `channels:history`, `chat:write`, `commands`, `groups:history`, `reactions:read`, `reactions:write`
* Under "Event Subscriptions", enable Events and subscribe to the following bot events: `app_mention`, `reaction_added`, `reaction_removed`
* (optional) If you want the count slash command to work, add `/count-reactions` under "Slash Commands"
* Go to `Basic Information`, install your app and add an App-Level token with all Scopes

# To run the bot
* Clone and cd into this repository
* Update `config.json` with your Lamini and Slack information (set up above)
    * To get the channel id, go to the channel in Slack and copy the last part of the channel link
* `docker build --tag 'slack_bot' .`
* `docker run -d 'slack_bot'`
