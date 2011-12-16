# PHP countinous test runner (Now with pirate messages! Yarr!)

So far, it works on Fedora 16, and I suppose that all the bunch of Linux distributions that uses NotifyOSD.

## Dependencies:

* inotify-tools

    In order to install it simply run: sudo yum install inotify-tools
    
### Usage:

Locate PHPAutotest.sh in your project's root and run it in background, passing as argument the folder you want to _listen_ for changes in order to start a test run when some of its files are modified.

* Sample:

> $sh PHPAutotest.sh src

Also, you can pass as a second argument the folder where you want to retrieve your phpunit config file (by default it expects it to be in _app/_):

> $sh PHPAutotest.sh src app/
