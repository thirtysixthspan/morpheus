The Morpheus API
================

Morpheus is the Greek God of Dreams who delivers messages from the Gods to mortals

Description
-----------
This API is responsible for parsing various kinds of information from chat messages based on the markup in those messages. It is implemented in Ruby using the Praxis framework.

[![Build Status](https://travis-ci.org/thirtysixthspan/morpheus.svg?branch=master)](https://travis-ci.org/thirtysixthspan/morpheus)

Setup
-----
To setup the API for use in development mode, you must
* have ruby installed (version 2.3 suggested) and available in your path
* have bundler installed (version 1.13.2 suggested)
* have installed the required gems using bundler - `bundle install`

To launch the API in development mode you can issue the following command

```bundle exec rackup -p 8888```

or simply run the included script

`./launch`


Documentation
-------------
This API is self documenting.

To generate the documentation you must
* have node installed (version 6.7 suggested) and available in your path
* have npm installed (version 3.10.8 suggested)

The documentation can be generated with the following command:

```bundle exec rake praxis:docs:generate```

The documentation can be viewed in a browser with the following command:

```bundle exec rake praxis:docs:preview```


Tests
-----
This API includes unit and functional tests. All of the tests can be run using the following command:

`bundle exec rake`

To manual test the API while it is running in development mode you can use the parse script by passing in a message on the command line.

```
./parse '@chris you around?'
./parse 'Good morning! (megusta) (coffee)'
./parse 'Olympics are starting soon; http://www.nbcolympics.com'
./parse '@bob @john (success) such a cool feature https://twitter.com/jdorfman/status/430511497475670016'
```

Notes
-----
This API currently does not require authentication of any sort. If this is going to be a public API, authentication should be put in place so that authorization rules can be created and rate limiting can be enabled.


License
-------
Copyright (c) 2016 Derrick Parkhurst (derrick.parkhurst@gmail.com),

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

