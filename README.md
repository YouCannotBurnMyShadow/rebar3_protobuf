protobuf
=====

A rebar plugin

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        { protobuf, ".*", {git, "git@host:user/protobuf.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 protobuf
    ===> Fetching protobuf
    ===> Compiling protobuf
    <Plugin Output>
