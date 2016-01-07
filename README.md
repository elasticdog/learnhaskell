Learn Haskell
=============

This repository will track my progress in following the [recommended path][]
for learning Haskell based on [Chris Allen][]'s experience helping others.

[recommended path]: https://github.com/bitemyapp/learnhaskell
[Chris Allen]: http://bitemyapp.com/

Usage
-----

I've configured this project to utilize [doctest][] as the default test suite
in order to verify that my solutions to the problem sets match the expectations
given in the upstream examples.

First, you'll want to install [stack][] and initialize your environment:

    $ git clone https://github.com/elasticdog/learnhaskell.git
    $ cd learnhaskell/
    $ stack setup

...then, you can run the test suite via the following command:

    $ stack test

[doctest]: https://github.com/sol/doctest
[stack]: http://haskellstack.org/
