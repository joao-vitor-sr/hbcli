PREFIX = /usr/local

test: src/hbcki.sh
	shellcheck -s sh src/hbcli.sh

clean:
	rm -f hbcli

install: 
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/share/hbcli
	cp -f src/hbcli.sh $(DESTDIR)$(PREFIX)/bin/hbcli
	cp languages/* $(DESTDIR)$(PREFIX)/share/hbcli/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/hbcli
	chmod 755 $(DESTDIR)$(PREFIX)/share/hbcli

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/hbcli
	rm -fr $(DESTDIR)$(PREFIX)/share/hbcli

.PHONY: test clean install uninstall
