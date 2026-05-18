@everyone 
# NeriumR Temp release tommorow
- This initial release have purposed, my 2 tester is not enough :triumph: so i will be opening this for everyone to use not really every but for those who followed the instruction in this https://discordapp.com/channels/1429041405249978480/1501513086304260196/1504070342057000960  if you followed correctly i will DM your ||secret key||

- Note that key is unique to ur User. What does this mean it means that this key will be tied on your robloxIds and discord UserId
Q: Why you go this far in key system isnt this too much?
A: Not really, if you remember what happen to wyvern? it got leaked and lot of people abuse it and did skiddiedies causing of confusion and some people even add maliciuos script on wyvern, and another reason was to tracked ur usage your data no i dont logged your actual data its for statistic and what would i even do with your data in the first place

Q: Is NeriumR ofbuscated?
A: Obviously yes, but it have reason i need to hide the unprotected function.

What neriumR offer you?
**Main ( configuration )**
- Website Sniper
    - This let you sniped web Item everywhere anywhere using neriumR auto search
- Paid Sniper
     - This also let you sniped everywhere and even have higher chance to get `1#` as always unless no competition also using this script.
	 - This also offer you a complex configuration for flexibility. Im not gonna explained all but its pretty self explanation


```luau

["Paid"] = {
        ["enable"] = false,
        ["specific type"] = {
            ["enable"] = false,
            ["assetType"] = {1, 2, 3}
        },
        ["price target"] = {
            ["minimum"] = 1,
            ["maximum"] = 100
        },
        ["creator settings"] = {
            ["blocklist"] = {
                ["enable"] = false,
                ["creatorsId"] = {}
            },
            ["whitelist"] = {
                ["enable"] = false,
                ["creatorsId"] = {}
            }
        }
    }
``` 

- Instant Prompt 
    - No need for clicking the button of purchase that take 3-5 second it can easily lose your dream serial. with this once the prompt appear it will automatically trigger the purchase api within ms the item was already yours, this was pretty famous back then when wyvern got leaked almost all goblin was staying in flex. But they die after fluxus discontinued since all executor now block the purchase API, and me here right now continue the legacy of Instant Prompt and bypassed the block function
- Watch List Sniper
    - This let you watch the certain UGC id and buy them once its on-sale higher chance of getting `1#` and defeat all those manually buyer ( beta not tested yet ) 



# Terminal Command
- `signal` - Fire all developer product tricking the server that you bought the item.
- `prompt <assetId>` - The famous server tricker, some game have refund method that when the item prompt was cancelled accidentally or got an error somehow it will re-prompt you the item back 
    - Note that this client Sided call so it will return an error as always dont expect for its to return succes
- `Proximity` - fire all proximity prompt
- `click` - fire all click detector
- `touch` - fire all touch interest
- `autorefund <boolean>` - if somehow the refund work prompt the command `prompt <assetid>` you can enable this to automatic for you ( beta not yet tested )
`remote -f <params>` - fire all replicated Event
    - note you can add more params by seperating with space `remote -f 1234356 true`
	```lua
	remoteEvent:FireServer(123456, true)
	``` 
	- `-f` was required it stand for as force this needed to prevent a misstyping of remote and also another way of verification that you agree the ris of firing remote 
