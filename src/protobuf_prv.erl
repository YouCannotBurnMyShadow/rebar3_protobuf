-module('protobuf_prv').

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, 'protobuf').
-define(DEPS, [app_discovery]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 protobuf"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "Proto-file compiler"},
            {desc, "Proto-file compiler"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    lager:info("~p", [State]),
    % Apps = rebar_state:project_apps(State),
    % DepsToBuild = rebar_state:deps_to_build(State),
    % Deps = lists:flatten(lists:map(fun rebar_app_info:deps/1, Apps)),
    % SrcDirs = lists:map(fun rebar_app_info:dir/1, Apps),
    % OutDirs = lists:map(fun rebar_app_info:out_dir/1, Apps),
    % io:format("~p~n", [SrcDirs]),
    % io:format("~p~n", [OutDirs]),
    % io:format("~p~n", [DepsToBuild]),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).
