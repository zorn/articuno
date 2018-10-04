# Articuno

Articuno is a static website generator written in Elixir. 

Articuno a pet project and is not really intended for use by others BUT I do want to make the code open source in case people can get some value out of that. If you do want an Elixir-based site generator checkout:

* <https://github.com/BennyHallett/obelisk>
* <https://github.com/Dalgona/Serum>

## Build

Articuno is a command line app built using escript. As such to build the binary you run:

    mix escript.build

## Run

Once built, you can use Articuno to make a new site using 

    ./articuno init

This will generate a `site.json` file.

To build a site use:

    ./articuno build path/to/site

This will generate the website at `path/to/site/_build`. 

Feel free to copy the results you your webserver of choice.