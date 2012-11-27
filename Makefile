
.PHONY: all app clean deps

./ebin/erlkafka_app.app: src/*.erl include/*.hrl
	./rebar compile

deps:
	./rebar get-deps

app: deps ./ebin/erlkafka_app.app

clean:
	rm -fr log
	rm -fr Mnesia*
	rm -f rel/reltool.config
	rm -fr rel/mira_cep_sub
	rm -f rel/mira_cep_sub.tar.gz
	rm -f package/deb/*.deb
	rm -f package/deb/*.tar.gz
	rm -fr package/deb/debian
	rm -fr .eunit
	rm -fr erl_crash.dump
	./rebar clean

all: clean app
	@echo "Done."
