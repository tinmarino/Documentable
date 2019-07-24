# Perl6 Doc Tools [![CI Status](https://circleci.com/gh/antoniogamiz/Perl6-Documentable.svg?style=shield)](https://circleci.com/gh/antoniogamiz/Perl6-Documentable) [![Build Status](https://travis-ci.org/antoniogamiz/Perl6-Documentable.svg?branch=master)](https://travis-ci.org/antoniogamiz/Perl6-Documentable) [![artistic](https://img.shields.io/badge/license-Artistic%202.0-blue.svg?style=flat)](https://opensource.org/licenses/Artistic-2.0)

In this repository you can find all logic responsible of generate the [official documentation of Perl6](https://docs.perl6.org/) or any other repository that follows the same specification. Could be used for modules that include a substantial amount of documentation, for instance.

## Table of contents

- [Installation](#installation)
- [Usage](#usage)
- [Documentation](/docs)
- [What is being generated](#what-is-being-generated)
- [Default templates](#default-templates)
- [Tests](#ŧests)
- [FAQ](#faq)
- [Authors](#authors)

## Installation

```
$ zef install Perl6::Documentable
```

If you have already downloaded this repo,

```
$ zef install .
```

## Usage

Before generating any documents you should execute:

```
documentable setup
```

in order to download the necessary files needed to generate the site (CSS, svg, ...). Alternatively, you can add your own. See [default templates](#default-templates) to get more information.

```
# setup the working directory
documentable setup

# generate and write the documentation
documentable start [--topdir=<Str>] [-v|--verbose] [-c|--cache] [-p|--pods] [-s|--search-index]
                  [-i|--indexes] [-t|--type-images] [-f|--force] [-a|--all] [--highlight]
                  [-k|--kind] [--manage]

# update the documentation when a pod file (or several) have been modified
documentable update [--topdir=<Str>]

# clean the files generated by documentable setup
# warning: this command will ALL directories created by `setup` no matter
# what files you had created before
documentable clean
```

See [what is being generated](#what-is-being-generated) to get more information about `documentable start`.

#### --topdir <Str>

Directory where the pod files are stored. Set to `doc` by default.

#### -v, --verbose

Be more verbose/talkative during the operation. Useful for debugging
and seeing what's going on "under the hood".

#### -c, --cache

Enables the use of a ([Pod cache](https://github.com/finanalyst/pod-cached)). Set to `True`
by default.

#### -p, --pods

Generate one HTML page for every pod file.

#### -s, --search-index

Generate the search file `search.js`.

#### -i, --indexes

Generate all index files.

#### -t, --type-images

Generate and write (if necessary) all typegraph svg files.

#### -f, --force

If specified, typegraph svg files will be forcibly generated and written.

#### --highlight

If specified, code blocks will be highlighted using [atom-language-perl6](https://github.com/perl6/atom-language-perl6).

#### -k, --kind

If specified, "kind" files will be written for `syntax` and `routine`.

#### --manage

Flag to sort the Language page in sections, as described in [language-order-control.json](resources/language-order-control.json).

#### -a, --all

Equivalent to `-p -s -i -t`.

## What is being generated

Currently, we create three different type of pages:

- Source documents: pages coming from whole pods.
- Per kind documents: pages coming from different pods, like this [one](https://docs.perl6.org/routine/ff).
- Indexes documents: pages that put together all previous documents in an accesible way.

## Default templates

As you may have noticed, every page in the documentation follows the same template. You can get that templates in the [releases page](https://github.com/antoniogamiz/Perl6-Documentable/releases/tag/v1.1.2). I strongly recommend you to use the defaults, which can be setup executing

```
documentable setup
```

That command will download the [latest assets tar](https://github.com/antoniogamiz/Perl6-Documentable/releases/download/v1.1.2/assets.tar.gz) in your directory. But what contains this tar? Several things:

- Necessary files to enable highlighting (`highlights` dir).
- `html` dir containing several icons, graphics, etc. In this directory will be written all HTML documents generated by `Perl6::Documentable`.
- `assets` dir containing the style sheets used and JS code to enable search functionality.
- `template` dir containing the default templates used.
- Two files to run the server (`app-start` and `app.pl`).
- A Makefile to configure highlighting (`make init-highlights`) and easily start a dev server with `make run`.

## Tests

Test files follow this convention:

- From 0 to 99: basic tests, not related with the core functionality of the module.
- From 100-199: `Perl6::Utils` related tests.
- From 200 to 299: [Perl6::Documentable](#perl6documentable) related tests.
- From 300 to 399: [Perl6::Documentable::Registry](#perl6documentableregistry) related tests.
- From 400 to 499: `Perl6::Documentable::Registry::To::HTML` related tests.

## Dependencies installation

#### Rakudo

You need Perl 6 installed. You can install the Rakudo Perl 6 compiler by
downloading the latest Rakudo Star release from
[rakudo.org/downloads/star/](http://rakudo.org/downloads/star/).

#### Zef

[Zef](https://modules.perl6.org/repo/zef) is a Perl 6 module installer. If you
installed Rakudo Star package, it should already be there. Feel free to
use any other module installer for the modules needed (see below).

#### Mojolicious / Web Server

Mojolicious is written in Perl 5, so assuming that you use
[`cpanm`](https://metacpan.org/pod/App::cpanminus),
install this now:

```
    $ cpanm -vn Mojolicious
```

#### GraphViz

To generate the svg files for the typegraph representation you need to have installed `graphviz`. If you use Ubuntu/Debian:

```
    $ sudo apt-get install graphviz
```

#### Highlight (OPTIONAL)

This is necessary to appli highlighting to the code examples in the documentation. You can skip it, but have in mind that all code examples will appear with the same color (black).

You can set this up with the default Makefile (obtained using `documentable setup`):

```
    make init-highlights
```

#### SASS Compiler

To build the styles, you need to have a SASS compiler. You can either install
the `sass` command

    $ sudo apt-get install ruby-sass

## FAQ

_Question:_ Do I need to regenerate all pages when I have only changed one?

_Answer:_ No, you can execute `documentable update` to only regenerate those pages affected by your changes.

##

Is not your question here? Then, please [raise an issue](https://github.com/antoniogamiz/Perl6-Documentable/issues/new).

# AUTHORS

Moritz Lenz <@moritz>

Jonathan Worthington <@jnthn>

Richard <@finanalyst>

Will Coleda <@coke>

Aleks-Daniel <@AlexDaniel>

Sam S <@smls>

Alexander Moquin <@Mouq>

Antonio <antoniogamiz10@gmail.com>

# COPYRIGHT AND LICENSE

Copyright 2019 Perl6 Team

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
