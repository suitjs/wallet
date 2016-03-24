[<img src="http://www.suitjs.com/img/logo-suitjs.svg?v=2" width="256" alt="SuitJS">](http://www.suitjs.com/)
# Wallet

Keep your valuables well stored.  
  
Wallet is a tool that wraps Mozilla's **[LocalForage](http://mozilla.github.io/localForage/)** to simplify **[offline storage](http://www.html5rocks.com/en/tutorials/offline/storage/)**.  

* Easy Key-Value pairs based API
   * Uses [IndexedDB](https://developer.mozilla.org/en/docs/Web/API/IndexedDB_API) in the "backstage"
* Allows the storing of all types of Javascript objects
   * Object
   * String
   * Number
   * ArrayBuffer
* Accepts either `function(){}` callbacks and SuitJS [ControllerNotifications](http://suitjs.com/docs/core/global.html#ControllerNotification)
* Offers database contexts to avoid data collision between applications

# Install
#### Download
* Download either the `wallet.js` or `wallet.min.js` sources.
* Add the tag `<script src="js/suitjs/wallet.js"></script>`

#### Bower
* Wallet is available as bower package.
* Run `bower install suitjs-wallet`
* It will install all script versions.
* Add the tag `<script src="bower_components/suitjs-wallet/js/wallet.js"></script>`

#### CDN
* TBD

# Usage
After adding the script tag, the `Wallet` global variable will be available.  
 
#### Hello World

```js
//Before the 'load' event, call 'Wallet.init' and set your database name.
//Try to make this name unique because it may collide with other apps using 'Wallet'.
Wallet.init("my-unique-database");

//Not obligatory.
//But a context can be set and allow different kinds of profiling.
Wallet.context = "debug";

//Set some value.
//Internally the 'key' used will be 'debug.key'
Wallet.set("key",{ "some": "data", "num": 10}, function(p_data,p_error) {
    
    if(p_error!=null) { console.error(p_error); return; } //something went wrong.
    console.log(p_data);                                  //object we just stored
});


/*...*/

Wallet.get("key",function(p_data,p_error) {
    
    if(p_error!=null) { console.error(p_error); return; } //something went wrong.
    console.log(p_data);                                  //{ "some": "data", "num": 10}
});

```
Then, it is also possible to integrate `Wallet` into SuitJS applications.  
Make sure `SuitJS` exists in the application context.

```js
//Setup Wallet as above

//Define a simple controller.
Suit.controller.add({
    on: function(n) {
        switch(n.path) {
            
            case "storage-update@set":   console.log(n.data); /*{ "some": "data", "num": 10}*/ break;
            case "storage-update@error": console.log(n.data); /*Error*/                        break;            
            
            case "storage-fetch@get":   console.log(n.data); /*{ "some": "data", "num": 10}*/ break;
            case "storage-fetch@error": console.log(n.data); /*Error*/                        break;
        }        
    }
});

//Call the same methods but use String as 'callback'.
//They will do a Suit.controller.dispatch()

Wallet.set("key",{ "some": "data", "num": 10},"storage-update");

Wallet.get("key","storage-fetch");


```


# Documentation
For in depth information of the API, visit the **[documentation](http://www.suitjs.com/docs/wallet/)**. 

# Examples
Usage examples can be found at **[CodePen](http://codepen.io/collection/XOyEpq/)**.