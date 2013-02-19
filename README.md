FileUploader
============

An HTML5 and javascript file uploader that supports drag and drop, as well as file input, uploading. Written in coffeescript.

Usage
-----

With the following html

```html
<html>
  <head>
    <title>Drop test</title>
    <style type='text/css' src='file-uploader.css'></style>
  </head>
  <body>
    <div class='drop-area'></div>
    <script type='text/javascript' src='http://code.jquery.com/jquery-1.9.1.min.js'></script>
    <script type='text/javascript' src='file-uploader.js'></script>
  </body>
</html>
```

And a little bit of js magic

```javascript
new FileUploader('.drop-area', '/files/');
```

A party is born.

FileUploader takes a minimum of two arguments:

1. A css selector for the area you want to use for the uploader
1. A url to upload the files to

By default the uploader will use 'POST' as the method used in the ajax call.

Extras
------

If you add a data-file-uploader-content attribute to the node you are going to use, FileUploader will append it into the results area for you.

Browser Support
---------------

This has been tested on the latest platforms for:

1. Desktop
  1. Firefox
  1. Chrome
  1. Safari
1. Mobile
  1. IOS 6.1
  1. Android 4.x

More testing needs to be completed. This should work on any webkit based browser and any browser that supports the FormData javascript object.

Requirements
------------

1. jQuery
1. Some basic javascript knowledge

Roadmap
-------

1. <strike>Add automatic results area injection</strike> (Done)
1. <strike>Add automatic file input injection</strike> (Done)
1. Get rid of dependency on jQuery
1. Add options for overriding the ajax submit method
1. Add options for overriding error, complete, and success callbacks
1. Setup automated node compilation of coffeescript to javascript
1. Setup proper testing
1. Check support for IE

Contributing
----------

Feel free to make changes. Fork this project and have at. If you make anything you'd like to give back just make a pull request.

Compiling
---------

If you have nodejs installed you can npm install to get all the dependencies. After that run:

```cli
./node_modules/coffee-script/bin/coffee -c -o lib src
```

The compiled, but unminified js, will be stored in the lib directory. Just copy to wherever you need to use it.
