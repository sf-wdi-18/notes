**If you wanted to register FB API Keys, such that...**

FB_API_KEY=thisistheapikeythinggoeshere

FB_API_ID=thisissomeidagwehqrwligu23liug24kbjfwe

**In bash, run...**
```bash
export FB_API_KEY=thisistheapikeythinggoeshere
export FB_API_ID=thisissomeidagwehqrwligu23liug24kbjfwe
```

**Then, on your server, you can declare...**
```javascript
var env = process.env;
var api_key = env.MY_API_KEY;

var myFn = function(someUrl) {
  request(someUrl+"?key="+api_key);
};
```

**To set these secret variables on Heroku, you can...**
```bash
heroku config:set FB_API_KEY=thisistheapikeythinggoeshere
```
