all: compile

get-deps:
	@./rebar get-deps

compile: get-deps
	@ERL_LIBS=`pwd`/deps/elixir/lib ./rebar compile

clean:
	@./rebar clean

dist-clean: clean
	@./rebar clean
	@./rebar delete-deps
	@rmdir deps 2>/dev/null || true
	@rm -f erl_crash.dump

start:
	@ERL_LIBS=deps `pwd`/deps/elixir/bin/elixir --no-halt -pa ebin -e "WebSocketServer.start"

iex:
	@ERL_LIBS=deps `pwd`/deps/elixir/bin/iex -pa ebin
